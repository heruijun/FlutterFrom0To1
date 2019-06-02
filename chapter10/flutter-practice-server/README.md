# flutter仿BOSS直聘，服务器端搭建

## 项目简介
记得上一篇的写作时间还在2018年2月份，已经很久没更新了，而flutter的版本更新了好几次，自flutter 1.0正式版推出之后，一直有打算把之前的项目重写一下，因为flutter本身更新了许多新特性，老的已经是过去式了，也老有人来问我，之前的项目运行不了，是的，因为sdk太老了，而且之前的项目纯粹是练手玩。

在过去的这段时间里，踊跃出了很多关于flutter的技术文章和开源项目例子，基本上每天都有，同比RN刚出来时，热情度远超RN。于是，笔者怀着对新技术热情的学习态度重写了这个开源项目，并且后续也会不断完善。

为什么选仿BOSS直聘作为题材？
因为这款APP相信大家都在使用，里面组件繁多且有一定复杂度，能衍生出来许多基于flutter组件库的子项目，里面有些功能，比如地图，IM，后面都会使用flutter来实现。为了让项目更接近真实，这次连服务端也实现了。先把开源地址提供给大家：

## 项目效果图：
![img](https://user-gold-cdn.xitu.io/2019/1/20/1686a0c4b2fb9cda?w=252&h=528&f=gif&s=1194865)

## 项目简介
* 基于puppeteer + mongo + nodejs实现爬虫服务器，使用nuxt + koa2 + vue实现服务端渲染以及api服务接口。这里就不过多占用篇幅了，本文主要还是讲flutter，对前端感兴趣的会另外分享相关技术话题。

## 项目安装
1. 安装 mongoDB，不会的请去http://www.runoob.com/mongodb/mongodb-tutorial.html
2. 安装nodejs，可以去https://nodejs.org/zh-cn/
3. 修改项目里的配置文件，server/index.js，找到下面这一行，把ip改成自己的
```
const host = process.env.HOST || '192.168.11.104'
```
4. 在根文件夹里执行npm install
5. 执行npm run dev启动起来即可

## github地址：
服务端版本：[flutter仿boss直聘服务端](https://github.com/heruijun/flutter-boss-server).

flutter版本：[flutter仿boss直聘](https://github.com/heruijun/flutter_boss).

## qq技术Flutter讨论千人群号：468010872
![img](https://user-gold-cdn.xitu.io/2019/1/20/1686a0d003f4a331?w=541&h=741&f=jpeg&s=55386)

## 联系方式
微信：heruijun2258，注明来意。