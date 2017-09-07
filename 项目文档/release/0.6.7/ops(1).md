# 管理员须知

## v0.6.7镜像

镜像名 | 校验
-------- | -----------
img.reg.3g:15000/yce:201705251058 | `8f4a2d550b0b`


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
    * 当用户登录或退出时，浏览器的localStorage发生改变（即用户身份信息发生改变）时，其他窗口跳回到登录页面

    ![](http://oonf35dr9.bkt.clouddn.com/usershandle.jpeg)
    ![](http://oonf35dr9.bkt.clouddn.com/usershandle1.jpeg)
    ![](http://oonf35dr9.bkt.clouddn.com/usershandle2.jpeg)

* 发布应用时自动注入LABEL_NAME环境变量([JSYWYBRQY-149](http://jira.yeepay.com/browse/JSYWYBRQY-149))

    * 在发布应用时，根据选择的数据中心自动注入LABEL_NAME环境变量来用于区分生产和内测
    * 发布应用过程中，当选择了生产内测数据中心后，无法选择其他数据中心
    * 如果选中了生产内测数据中心后，想更换数据中心的选择，请取消生产内测数据中心的选中状态（点击生产内测数据中心）后，进行操作

* 同步镜像右侧增加了刷新组件([JSYWYBRQY-89](http://jira.yeepay.com/browse/JSYWYBRQY-89))

    * 与应用管理右侧刷新组件用法相同
    ![](http://oonf35dr9.bkt.clouddn.com/refresh.jpeg)

* 同步镜像时，运行状态指示为绿色动态条 ([JSYWYBRQY-102](http://jira.yeepay.com/browse/JSYWYBRQY-109))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-114742.png)

* 应用升级时，自动填充当前镜像名最后一个":"前的字符串，从而自行筛选 ([JSYWYBRQY-127](http://jira.yeepay.com/browse/JSYWYBRQY-127))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-120706.png)

* 点击镜像列表，搜索框默认触焦 ([JSYWYBRQY-120](http://jira.yeepay.com/browse/JSYWYBRQY-120))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-144738.png)

* 发布失败时，红色的错误提示不消失 ([JSYWYBRQY-118](http://jira.yeepay.com/browse/JSYWYBRQY-118))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-145524.png)

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

    ![](http://7xiwbf.com1.z0.glb.clouddn.com/commitid.png)


### 样式细节修改

* 增加了loading组件([JSYWYBRQY-96](http://jira.yeepay.com/browse/JSYWYBRQY-96))

    * 取消了上个版本增加的操作进度条([JSYWYBRQY-65](http://jira.yeepay.com/browse/JSYWYBRQY-65))
    * 只有时间超过50ms的请求，开始时出现loading，完成时loading消失
    * 系统设置了请求最长时间，如果请求90秒内无返回结果，关闭请求，loading消失

    ![](http://oonf35dr9.bkt.clouddn.com/loading.jpeg)

* 增加动画效果([JSYWYBRQY-137](http://jira.yeepay.com/browse/JSYWYBRQY-137))

    * 系统左侧的导航栏在展开和收缩时增加了动画效果
    * 各管理页的列表在加载完成后增加了动画效果

* 应用的回滚，只有最近的10条镜像可以回滚([JSYWYBRQY-119](http://jira.yeepay.com/browse/JSYWYBRQY-119))

* 点击用户名可以查看当前系统的版本

* 服务健康检查时间加个秒 ([JSYWYBRQY-110](http://jira.yeepay.com/browse/JSYWYBRQY-110))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-143807.png)

* 同步镜像时，队列显示先入先出([JSYWYBRQY-82](http://jira.yeepay.com/browse/JSYWYBRQY-82))

    ![](http://7xiwbf.com1.z0.glb.clouddn.com/syncqueue.png)

## 废弃特性

暂无

## 常见问题与解决

* 当网络不好的情况下，如果请求时间超过90秒，请求会关闭，此时请尝试在网络良好的情况下操作
* 若出现应用列表里有但集群里没有的"幽灵"应用（可导致应用操作失败），请联系管理员手动操作Redis
* 若出现应用列表里没有但集群里有的应用，请多次刷新页面，如仍无效请联系管理员重启YCE。
* 若admin在查看nodePort管理时获取不到对应的服务详情，可能原因是该服务的删除未经YCE执行，所以没能及时更新数据库的记录
* 在应用列表操作后若结果没有及时更新，请稍后进行刷新。若多次刷新仍无效，请联系管理员。
* 在系统使用过程中，如果进度条未完成，请耐心等待或刷新页面重新操作。
