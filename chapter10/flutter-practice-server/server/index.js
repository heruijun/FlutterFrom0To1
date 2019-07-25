
const Koa = require('koa')
const consola = require('consola')
const { Nuxt, Builder } = require('nuxt')
const { connect, initSchemas, initAdmin } = require('./database/init')
const router = require('./routes')

const app = new Koa()
// const host = process.env.HOST || '192.168.11.104'
const host = process.env.HOST || '172.20.10.3'
const port = process.env.PORT || 3000

let config = require('../nuxt.config.js')
config.dev = !(app.env === 'production')

async function start() {
  const nuxt = new Nuxt(config)

  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  }

  await connect()
  initSchemas()
  await initAdmin()

  // require('./tasks/job-list-task')
  // require('./tasks/company-list-task')
  // require('./tasks/company-detail-task')

  app
    .use(router.routes())
    .use(router.allowedMethods())

  app.use(ctx => {
    ctx.status = 200 // koa defaults to 404 when it sees that status is unset

    return new Promise((resolve, reject) => {
      ctx.res.on('close', resolve)
      ctx.res.on('finish', resolve)
      nuxt.render(ctx.req, ctx.res, promise => {
        // nuxt.render passes a rejected promise into callback on error.
        promise.then(resolve).catch(reject)
      })
    })
  })

  app.listen(port, host)
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
  })
}

start()
