const puppeteer = require('puppeteer')

const sleep = time => new Promise(resolve => {
  setTimeout(resolve, time)
})

async function fetchCompany (page, companyId) {
  const url = `https://www.zhipin.com/${companyId}`
  const id = companyId

  await page.goto(url, {
    waitUntil: 'networkidle2'
  })

  return await page.evaluate(() => {
    let $ = window.$;
    let inc = $('.fold-text').html()   // 公司简介
    let tags = $('.company-tags span')  // 公司福利
    let tagsResult = []
    let companyImgs = $('.slider-main img')   // 公司图片
    let companyImgsResult = []
    if (tags.length >= 1) {
      tags.each((index, item) => {
        let tag = $(item).text()
        tagsResult.push(tag)
      })
    }
    if (companyImgs.length >= 1) {
      companyImgs.each((index, item) => {
        let img = $(item).attr('src')
        companyImgsResult.push(img)
      })
    }

    return {
      inc,
      tagsResult,
      companyImgsResult
    }
  })
}

;(async () => {
  let companyIds = process.argv[2].split(',');
  let result = []

  const browser = await puppeteer.launch({
    args: ['--no-sandbox'],
    dumpio: false
  })

  const page = await browser.newPage()

  await sleep(2000)
  while (companyIds.length > 0) {
    let temp = await fetchCompany(page, companyIds[0])
    const data = {
      id: companyIds[0],
      inc: temp.inc,
      tagsResult: temp.tagsResult,
      companyImgsResult: temp.companyImgsResult
    }
    result.push(data)
    companyIds.shift()
  }

  console.log(result)

  process.send({result})
  await sleep(5000)
  browser.close()
  process.exit(0)
})()