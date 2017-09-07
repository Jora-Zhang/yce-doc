# 用户须知

## 主要更新说明

本次更新主要包含：

* 新特性：

    * 增加loading组件
    * 同步镜像右侧增加了刷新组件
    * 同步镜像时，运行状态指示为绿色滚动条
    * 应用升级时，自动填充当前镜像名最后一个":"前的字符串，从而自行筛选
    * 点击镜像列表，搜索框默认触焦
    * 服务健康检查时间加个秒
    * 应用的回滚，只有最近的10条镜像可以回滚
    * 增加动画效果
    * 发布应用时自动注入LABEL_NAME环境变量
    * 发布失败时，红色的错误提示不消失
    * 点击用户名可以查看当前系统的版本
    * 同步镜像时，队列显示先入先出
    * 应用升级失败提示（找不到NewRs问题）

* Bug修复：

    * 多用户操作问题

## 主要特性

* 多用户操作问题([JSYWYBRQY-108](http://jira.yeepay.com/browse/JSYWYBRQY-108))

    * 同一浏览器只允许登录一个账号

    ![](http://oonf35dr9.bkt.clouddn.com/usershandle.jpeg)
    ![](http://oonf35dr9.bkt.clouddn.com/usershandle1.jpeg)
    ![](http://oonf35dr9.bkt.clouddn.com/usershandle2.jpeg)

* 发布应用时自动注入LABEL_NAME环境变量,用于区分生产和内测([JSYWYBRQY-149](http://jira.yeepay.com/browse/JSYWYBRQY-149))

    * 发布应用时，当选择了生产内测数据中心后，无法选择其他数据中心，只有取消了生产内测数据中心的选中状态，才能选择其他的数据中心

* 同步镜像右侧增加了刷新组件([JSYWYBRQY-89](http://jira.yeepay.com/browse/JSYWYBRQY-89))

    ![](http://oonf35dr9.bkt.clouddn.com/refresh.jpeg)

* 同步镜像时，运行状态指示为绿色动态条 ([JSYWYBRQY-102](http://jira.yeepay.com/browse/JSYWYBRQY-109))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-114742.png)

* 应用升级时，会根据当前镜像的前缀名进行筛选 ([JSYWYBRQY-127](http://jira.yeepay.com/browse/JSYWYBRQY-127))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-120706.png)

* 点击镜像列表，搜索框默认触焦 ([JSYWYBRQY-120](http://jira.yeepay.com/browse/JSYWYBRQY-120))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-144738.png)

* 发布失败时，红色的错误提示不消失 ([JSYWYBRQY-118](http://jira.yeepay.com/browse/JSYWYBRQY-118))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-145524.png)

* 应用升级失败提示 ([JSYWYBRQY-138](http://jira.yeepay.com/browse/JSYWYBRQY-138))

    ![升级](http://7xiwbf.com1.z0.glb.clouddn.com/rollup.png)
    ![升级失败](http://7xiwbf.com1.z0.glb.clouddn.com/rolluperr.png)
    ![应用详情提示还是升级前镜像](http://7xiwbf.com1.z0.glb.clouddn.com/deployment.png)
    ![应用实例详情提示还是升级前镜像](http://7xiwbf.com1.z0.glb.clouddn.com/instance.png)

### 样式细节修改

* 增加了loading组件([JSYWYBRQY-96](http://jira.yeepay.com/browse/JSYWYBRQY-96))

    * 取消了上个版本增加的操作进度条([JSYWYBRQY-65](http://jira.yeepay.com/browse/JSYWYBRQY-65))
    * 时间超过50ms的请求，加载时有loading条，请求超过90秒，请求关闭并且loading消失

    ![](http://oonf35dr9.bkt.clouddn.com/loading.jpeg)

* 左侧栏与列表页增加动画效果([JSYWYBRQY-137](http://jira.yeepay.com/browse/JSYWYBRQY-137))

* 应用的回滚，只可以回滚最近10条([JSYWYBRQY-119](http://jira.yeepay.com/browse/JSYWYBRQY-119))

* 点击用户名可以查看当前系统的版本

* 服务健康检查时间加个秒 ([JSYWYBRQY-110](http://jira.yeepay.com/browse/JSYWYBRQY-110))

    ![](http://oonfhlbqp.bkt.clouddn.com/QQ20170511-143807.png)

* 同步镜像时，队列显示先入先出([JSYWYBRQY-82](http://jira.yeepay.com/browse/JSYWYBRQY-82))

    ![](http://7xiwbf.com1.z0.glb.clouddn.com/syncqueue.png)

## 废弃特性

暂无

## 常见问题与解决

* 当网络不好的情况下，如果请求时间超过90秒，请求会关闭，此时请尝试在网络良好的情况下操作。
* 若出现应用列表应用操作失败（xx操作失败），请联系管理员。
* 在应用列表操作后若结果没有及时更新，请稍后进行刷新。若多次刷新仍无效，请联系管理员。
* 在系统使用过程中，如果进度条未完成，请耐心等待或刷新页面重新操作。
