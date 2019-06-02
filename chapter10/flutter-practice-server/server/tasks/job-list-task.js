const cp = require('child_process')
const { resolve } = require('path')
const mongoose = require('mongoose')
const Job = mongoose.model('Job')

;(async () => {
  const script = resolve(__dirname, '../crawler/job-list')
  const child = cp.fork(script, [])   // 派生出子进程
  let invoked = false   // 调用的辨识符

  child.on('error', err => {
    if (invoked) return

    invoked = true

    console.log(err)
  })

  child.on('exit', code => {
    if (invoked) return

    invoked = true
    let err = code === 0 ? null : new Error('exit code ' + code)

    console.log(err)
  })

  child.on('message', data => {
    let result = data.result

    // console.log(result)

    result.forEach(async item => {
      let job = await Job.findOne({
        id: item.id
      })

      if (!job) {
        job = new Job(item)
        await job.save()
      }
    })
  })
})()
