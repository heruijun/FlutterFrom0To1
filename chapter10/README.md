# 概述
本教程针对《Flutter从0到1构建大前端应用》第十章实战章节，考虑到node服务端对于新手或者非前端从业人员来说安装有些吃力，所以扩展了此篇文章，描述了详细的安装过程。
安装内容涉及Mongo数据库，node环境，以及Homebrew工具的安装和配置工作。

## MongoDB 安装和配置方式（一）
1. 下载地址：[https://www.mongodb.com/download-center/community](https://www.mongodb.com/download-center/community)
2. 下载对应版本后解压
3. 设置环境变量：export PATH=<mongodb-install-directory>/bin:$PATH，这里把<mongodb-install-directory>替换成你的目录
4. 创建数据库目录：mkdir -p /data/db
5. 执行mongo命令，开启mongo服务

## MongoDB 安装和配置方式（二），推荐
如果上述安装方式（一）在mac上行不通且mongo服务启动不起来，可以考虑通过Homebrew安装。
1. 安装Homebrew，安装命令是：/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
2. 执行Homebrew命令：brew services start mongodb
3. 执行执行mongo命令，开启mongo服务

## node安装
1. 本书中运行的node版本是8.12.0，为了确保你能正常运行起来，请安装这个版本，下载地址是[https://nodejs.org/dist/v8.12.0/](https://nodejs.org/dist/v8.12.0/)
2. 安装完成后请运行命令node -v确认是否输出了版本号。由于推荐的版本是v8.12.0，那么命令行显示v8.12.0则表示安装正确。

## 安装项目
1. 设置服务端ip，由于服务端是部署在本地的，先读者使用命令ifconfig查出本机ip地址，然后修改chapter10/flutter-practice-server/server/index.js文件，找到并替换const host = process.env.HOST || 'xxx.xxx.xxx.xxx'换成自己的ip地址
2. 在服务端的根目录执行命令：npm install --registry=https://registry.npm.taobao.org，会安装node需要的依赖包，如果安装过程中卡住，请重新执行该命令安装。
3. 使用在chapter10/flutter-practice-server根目录下执行命令npm run dev启动服务端，注意在首次启动端时需要chapter10/flutter-practice-server/server/index.js，把下面三行代码的注释解开，因为首次运行需要通过爬虫获取数据并写入mongo
    ```
        require('./tasks/job-list-task')
        require('./tasks/company-list-task')
        require('./tasks/company-detail-task')
    ```
    在运行完爬取数据之后就可以把上面三行的代码重新加上注释.

    注意，启动npm run dev可能会报Chromium revision is not downloaded这样的错，这种情况是爬虫库puppeteer没有安装，需要在chapter10/flutter-practice-server/server目录下执行下面2条命令：
    ```
        npm config set puppeteer_download_host=https://npm.taobao.org/mirrors
        npm i puppeteer
    ``
    安装完puppeteer之后再执行npm run dev，这样应该就可以正常启动node服务器了。

4. 导入客户端Flutter代码，chapter10/flutter-practice，然后需要修改里面ip与服务端一致，然后就可以运行。

## 接口服务
采用Koa2从mongo数据读取，在chapter10/flutter-practice-server/server/routes/index.js查看接口查询代码