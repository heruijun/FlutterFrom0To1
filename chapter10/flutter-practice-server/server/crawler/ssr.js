const puppeteer = require('puppeteer');

async function ssr(url) {
  const browser = await puppeteer.launch({headless: true});
  const page = await browser.newPage();
  await page.goto(url, {waitUntil: 'networkidle0'});
  const html = await page.content(); // serialized HTML of page DOM.
  await browser.close();
  return html;
}

;(async() => {
  let result = await ssr('http://www.baidu.com');
  console.log(result);
})();