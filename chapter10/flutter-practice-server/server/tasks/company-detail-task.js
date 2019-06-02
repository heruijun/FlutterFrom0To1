const cp = require('child_process')
const { resolve } = require('path')
const mongoose = require('mongoose')
const Company = mongoose.model('Company')
const CompanyDetail = mongoose.model('CompanyDetail')

;(async () => {
  let companies = await Company.find({})
  let companyIds = []

  for(let i = 0; i < companies.length; i++){
    companyIds.push(companies[i].id)
  }

  const script = resolve(__dirname, '../crawler/company-detail')
  const child = cp.fork(script, [companyIds])   // 派生出子进程
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
      let companyDetail = await CompanyDetail.findOne({
        id: item.id
      })

      if (!companyDetail) {
        companyDetail = new CompanyDetail(item)
        await companyDetail.save()
      }
    })
  })
})()
