const Koa = require('koa')
const mongoose = require('mongoose')
const app = new Koa();
const router = require('koa-router')()
const koaBody = require('koa-body')

router.post('/log', koaBody(), async (ctx) => {
    ctx.body = JSON.stringify(ctx.request.body)
    const FlutterLog = mongoose.model('FlutterLog')
    var flutterLog = new FlutterLog({
      id: Date.now() + '',
      device: ctx.request.body.device,
      message: ctx.request.body.message,
      cause: ctx.request.body.cause,
      trace: ctx.request.body.trace
    })
    await flutterLog.save()
  }
);

router.get('/log/find', koaBody(), async (ctx) => {
  ctx.body = JSON.stringify(ctx.request.body)
  const FlutterLog = mongoose.model('FlutterLog')
  const logs = await FlutterLog.find({}).sort({
    'meta.createdAt': -1
  })
  ctx.body = {
    'data': {
      logs,
    }
  }
});

app.use(router.routes())
app.listen(3000)
module.exports = router