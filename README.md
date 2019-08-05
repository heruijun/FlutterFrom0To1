# 《Flutter从0到1构建大前端应用》源码

## 源码介绍
源码与书本中的章节对应，由于Flutter技术发展迅速，这里也会有一些更新，请读者见下面“补充内容”区域并更新代码。
使用说明：
1. git clone https://github.com/heruijun/FlutterFrom0To1
2. 使用Android Studio或VSCode导入项目
3. 执行flutter packages get之后，就可以运行项目。

## 书中勘误表
如发现书中内容描述有误，请尽快联系作者，以便作者在第一时间修复，联系方式见“作者简介”。

已知问题，请查看[chapter_error](https://github.com/heruijun/FlutterFrom0To1/tree/master/chapter_error)

## 补充内容
1. 2019/07/21，对书中第4章手势章节追加了一个手势实现360旋转展物的例子，放在[chapter4/gesture_detector_360](https://github.com/heruijun/FlutterFrom0To1/tree/master/chapter4/gesture_detector_360)
2. 2019/07/23，书中9.3.5章节只对aar打包方式做了简单的讲解，应读者建议，补充了Flutter在Android端工程化实践，实现了抽取Flutter业务层代码，通过fat-aar打成一个aar包，并且通过变量实现Flutter环境切换，放在[chapter9/flutter_fat_aar](https://github.com/heruijun/FlutterFrom0To1/tree/master/chapter9/flutter_fat_aar)

## 关于实战项目（必读）
本书最后的实战章节，展现了除Flutter之外的一些前端和node服务器的知识，里面涉及到一些安装和配置，考虑到无前端和node基础的同学跑起来比较吃力，所以扩展了一下安装和配置教程，请点击[小白安装和配置文档](https://github.com/heruijun/FlutterFrom0To1/tree/master/chapter10/README.md)查看。
在源码中除了Flutter客户端项目之外，你还能在服务端代码里学习到以下知识点，也就是大前端相关的知识内容，可以说是彩蛋内容：
1. node父子进程通信
2. Koa2接口服务API
3. nuxt相关知识
4. vue基础
5. puppeteer爬虫服务器抓取网站数据

## 作者简介
目前在平安银行担任移动端架构师，负责平安口袋银行app信用卡模块的核心业务开发和性能分析治理等工作，熟悉Android，Hybrid，ReactNative等跨平台方案。并且在团队内部推进和分享Flutter技术实施，包括Flutter工程化，路由，插件，MXFlutter等技术调研和探索。

作者联系方式QQ：113805738，微信：heruijun2258

Flutter千人技术交流QQ群：468010872

其他Flutter开源项目：[Flutter仿Boss直聘](https://github.com/heruijun/flutter_boss)
