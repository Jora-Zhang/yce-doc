# 开发者须知

[设计文档](https://shimo.im/desktop)

## v0.6.7代码与镜像

镜像名 | 校验
-------- | -----------
img.reg.3g:15000/yce:201705251058 | `8f4a2d550b0b`

### 项目代码

文件名 | 校验
-------- | -----------
[下载链接](http://10.151.30.223/dawei.li/yce/repository/archive.tar.gz?ref=0.6.7) | `8d0ede8bcdd4512be46d8e83a1575d6608482cf7`

## 主要更新说明

## 升级准备

### 环境变量注入

ENVIRONMENT : dev / qa / nc / prod

### 同步镜像更新

[siAgent](https://10.151.30.223:liyao.miao/siAgent)

文件名 | 校验
-------- | -----------
[下载链接](http://10.151.30.223/liyao.miao/siAgent/repository/archive.tar.gz?ref=master) | `776007c7ca8c54488c66b6533692ad990bbd2454`

本次更新主要包含：

* 新特性：

    * 增加loading组件
    * 同步镜像右侧增加了刷新组件
    * 同步镜像时，运行状态指示为绿色动态条
    * 应用升级时，自动填充当前镜像名最后一个":"前的字符串，从而自行筛选
    * 点击镜像列表，搜索框默认触焦
    * 服务健康检查时间加个秒
    * 应用的回滚，只有最近的10条镜像可以回滚
    * 增加动画效果
    * 发布应用时自动注入LABEL_NAME环境变量
    * 发布失败时，红色的错误提示不消失
    * 点击用户名可以查看当前系统的版本
    * 同步镜像时，队列显示先入先出
    * 删除带有多个NodePort的服务时，可以正确删除全部的NodePort
    * Watcher长时间没有收到事件或者收到Nil事件自动重连
    * 应用升级失败提示（找不到NewRs问题）
    * 删除用户后删除对应的SessionId
    * 新建/修改数据中心
    * 无效的数据中心不再导致程序奔溃
    * 在Gitlab-CI的过程中将代码CommitId保存，并与Dockerfile一起放在可执行程序目录下

* Bug修复：

    * 多用户操作问题

## 主要特性

* 多用户操作问题([JSYWYBRQY-108](http://jira.yeepay.com/browse/JSYWYBRQY-108))

    * 同一浏览器的不同窗口只允许一位用户登录使用系统，防止多用户交叉操作
    * addEventListener监听storage事件，如果发生改变，改变包括用户退出(Null)或有新值(newVal)，进行state.go跳转
    * 需要注意的是，之后的版本中如果请求返回{code: 1402}，也需要进行跳转

* 发布应用时自动注入LABEL_NAME环境变量([JSYWYBRQY-149](http://jira.yeepay.com/browse/JSYWYBRQY-149))

    * 在发布应用时，根据选择的数据中心自动注入LABEL_NAME环境变量来用于区分生产和内测
    * 生产内测数据中心与其他数据中心互斥
    * 数据中心选中：使用$watch深度监听(arguments[3] = true)，遍历newVal，如对应下标名字为生产内测，将数据中心选择全部清空后，把生产内测选中

* 同步镜像右侧增加了刷新组件([JSYWYBRQY-89](http://jira.yeepay.com/browse/JSYWYBRQY-89))

    * 与应用管理右侧刷新组件用法相同

* 同步镜像时，运行状态指示为绿色动态条 ([JSYWYBRQY-102](http://jira.yeepay.com/browse/JSYWYBRQY-109))

* 应用升级时，自动填充当前镜像名最后一个":"前的字符串，从而自行筛选 ([JSYWYBRQY-127](http://jira.yeepay.com/browse/JSYWYBRQY-127))

    * 点击升级镜像时通过$emit把当前镜像传送到子页面(镜像选取页面)，子页面拿到当前镜像的值，截取到最后一个冒号之前的字符串，并把字符串的值赋给搜索框的model值，从而进行搜索


* 点击镜像列表，搜索框默认触焦 ([JSYWYBRQY-120](http://jira.yeepay.com/browse/JSYWYBRQY-120))

    * 上一版本直接在html加onfocus并不好使
    * 本版本增加了setFocus组件彻底解决了此问题


* 发布失败时，红色的错误提示不消失 ([JSYWYBRQY-118](http://jira.yeepay.com/browse/JSYWYBRQY-118))

* 删除带有多个NodePort的服务时，可以正确删除全部的NodePort([JSYWYBRQY-113](http://jira.yeepay.com/browse/JSYWYBRQY-113))

* Watcher长时间没有收到事件或者收到Nil事件自动重连([JSYWYBRQY-75](http://jira.yeepay.com/browse/JSYWYBRQY-75))

    * 长时间没有收到新的事件，计时间隔为180秒
    * 收到Nil事件会自动重连

* 应用升级失败提示（找不到NewRs问题）([JSYWYBRQY-138](http://jira.yeepay.com/browse/JSYWYBRQY-138))

    ![升级](http://7xiwbf.com1.z0.glb.clouddn.com/rollup.png)
    ![升级失败](http://7xiwbf.com1.z0.glb.clouddn.com/rolluperr.png)
    ![应用详情提示还是升级前镜像](http://7xiwbf.com1.z0.glb.clouddn.com/deployment.png)
    ![应用实例详情提示还是升级前镜像](http://7xiwbf.com1.z0.glb.clouddn.com/instance.png)

* 删除用户后删除对应的SessionId([JSYWYBRQY-136](http://jira.yeepay.com/browse/JSYWYBRQY-136))

    * 用户登录时获得SessionId，删除用户时删除该SessionId

* 新建/修改数据中心([JSYWYBRQY-125](http://jira.yeepay.com/browse/JSYWYBRQY-125))

    * 现在可以新建/修改数据中心的ApiServer地址，以及端口号，NodePort范围等。不允许新建同样ApiServer地址:端口的记录/修改数据中心名称

* 无效的数据中心不再导致程序奔溃([JSYWYBRQY-124](http://jira.yeepay.com/browse/JSYWYBRQY-124))

    * 无效的数据中心造成连接超时，超时时间为5秒，超时后会不断尝试连接，重试间隔为30秒

* 在Gitlab-CI的过程中将代码CommitId保存，并与Dockerfile一起放在可执行程序目录下([JSYWYBRQY-115](http://jira.yeepay.com/browse/JSYWYBRQY-115))


### 样式细节修改

* 增加了loading组件([JSYWYBRQY-96](http://jira.yeepay.com/browse/JSYWYBRQY-96))

    * [angular-loading-bar](https://github.com/chieffancypants/angular-loading-bar)

* 增加动画效果([JSYWYBRQY-137](http://jira.yeepay.com/browse/JSYWYBRQY-137))

* 应用的回滚，只有最近的10条镜像可以回滚([JSYWYBRQY-119](http://jira.yeepay.com/browse/JSYWYBRQY-119))

* 点击用户名可以查看当前系统的版本

* 服务健康检查时间加个秒 ([JSYWYBRQY-110](http://jira.yeepay.com/browse/JSYWYBRQY-110))

* 同步镜像时，队列显示先入先出([JSYWYBRQY-82](http://jira.yeepay.com/browse/JSYWYBRQY-82))


## 废弃特性

暂无

## API改动

* 添加了environments，供前端显示当前YCE所在的部署环境

## 主要组件改动

无

## 常见问题与解决

* 当网络不好的情况下，如果请求时间超过90秒，请求会关闭，此时请尝试在网络良好的情况下操作
* 若出现应用列表应用操作失败（xx操作失败），请联系管理员尝试重启yce。
* 若admin在查看nodePort管理时获取不到对应的服务详情，可能原因是该服务的删除未经YCE执行，所以没能及时更新数据库的记录
* 在应用列表操作后若结果没有及时更新，请稍后进行刷新。若多次刷新仍无效，请联系管理员。
* 在系统使用过程中，如果进度条未完成，请耐心等待或刷新页面重新操作。