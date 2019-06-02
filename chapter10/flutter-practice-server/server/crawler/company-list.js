const puppeteer = require('puppeteer')

const sleep = time => new Promise(resolve => {
  setTimeout(resolve, time)
})

async function fetchCompanyList (page) {
  const url = `https://www.zhipin.com/gongsi/?ka=header_brand`

  await page.goto(url, {
    waitUntil: 'networkidle2'
  })

  await page.screenshot({
    path: `site/screenshot/company.png`,
    fullPage: true
  })

  return await page.evaluate(() => {
    var $ = window.$
    var items = $('.sub-li')
    var objItem = []

    if (items.length >= 1) {
      items.each((index, item) => {
        let it = $(item)
        let id = it.find('.company-info').attr('href')
        let company = it.find('.conpany-text h4').text()
        let logo = it.find('.company-info img').attr('src')
        let info = it.find('.conpany-text p').text()
        let hot = it.find('.about-info p').text()

        objItem.push({
          id,
          company,
          logo,
          info,
          hot
        })
      })
    }

    return objItem
  })
}

;(async () => {
  console.log('正在抓取公司列表页面')

  const browser = await puppeteer.launch({
    args: ['--no-sandbox'],
    dumpio: false
  })

  const page = await browser.newPage()

  await sleep(2000)
  let result = await fetchCompanyList(page)
  process.send({result})
  
  await sleep(5000)
  browser.close()
  process.exit(0)
})()