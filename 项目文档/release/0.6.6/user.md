# 用户须知

## 主要更新说明

本次更新主要提升了易用性。

* 增加全局搜索([JSYWYBRQY-40](http://jira.yeepay.com/browse/JSYWYBRQY-40))
    * 管理页面可以在搜索框中输入关键字进行全局搜索，关键字输入完成后无需点击搜索按钮，列表会自动根据关键字过滤出对应项。
    ![](http://oonf35dr9.bkt.clouddn.com/search.jpeg)
* 模板相关([JSYWYBRQY-30](http://jira.yeepay.com/browse/JSYWYBRQY-30))
    * 创建模板过程中取消应用名与服务名的填写。
    * 修改模板时只需要在模板管理页点击修改按钮即可进行模板的修改，且修改模板时模板名不可编辑且不进行模板名的查重校验，如下图。
    ![](http://oonf35dr9.bkt.clouddn.com/templateModify.jpeg)
    ![](http://oonf35dr9.bkt.clouddn.com/inputDisabled.jpeg)
* 导航栏选中状态([JSYWYBRQY-64](http://jira.yeepay.com/browse/JSYWYBRQY-64))
    * 左侧navList导航栏用户点击后会有选中状态，即使刷新页面，最后一次点击的导航项依然会有选中状态，如下图。
    ![](http://oonf35dr9.bkt.clouddn.com/navListchecked.jpeg)
* 操作进度条([JSYWYBRQY-65](http://jira.yeepay.com/browse/JSYWYBRQY-65))
    * 0.6.6版本之前对系统功能进行操作时，如果操作成功，页面右上角会出现绿色的消息通知块，提示操作成功。0.6.6版中我们取消了绿色通知块的提示，改为使用进度条的方式给用户进行提示，如下图。
    ![](http://oonf35dr9.bkt.clouddn.com/deleteProgress.jpeg)
    * 这里需要注意的是，如果操作失败，我们还使用右上角红色的消息通知块进行操作失败的提示。
* 增加了应用的首次发布人和最后修改人 ([JSYWYBRQY-60](http://jira.yeepay.com/browse/JSYWYBRQY-60))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-171843.png)
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-171730.png)
* 删除应用时提示是否删除该服务 ([JSYWYBRQY-67](http://jira.yeepay.com/browse/JSYWYBRQY-67))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-172552.png)
* 升级理由、回滚理由在历史发布详情里展示 ([JSYWYBRQY-69](http://jira.yeepay.com/browse/JSYWYBRQY-69))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-173216.png)
* UTC时间转为本地时间 ([JSYWYBRQY-72](http://jira.yeepay.com/browse/JSYWYBRQY-72))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-180049.png)


### 样式细节修改
* 管理列表可以查看更多详情的表格（例如：应用名称、应用实例）在鼠标移入时鼠标变为手形，且当前表格的字体为蓝色。
* 当表单存在不合法项存在时，提交按钮是不可以提交的，0.6.6版本中如果按钮是不可提交或点击时，样式置灰，只有当表单全部合法之后，按钮才变为可点击的蓝色。
* 服务详情端口组、应用发布的高级配置中启动准备等进行了样式折叠。
* 点击取消按钮进度条消失 ([JSYWYBRQY-42](http://jira.yeepay.com/browse/JSYWYBRQY-42))
* 应用名处按照svc的要求， 限制20个字符，超出给出提示 ([JSYWYBRQY-61](http://jira.yeepay.com/browse/JSYWYBRQY-61))
* 模板名处限制20个字符，超出给出提示 ([JSYWYBRQY-41](http://jira.yeepay.com/browse/JSYWYBRQY-41))
* 探活按钮排版重写 ([JSYWYBRQY-33](http://jira.yeepay.com/browse/JSYWYBRQY-33))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-183103.png)
* 所有必填项加红 ([JSYWYBRQY-68](http://jira.yeepay.com/browse/JSYWYBRQY-68))
* 升级、回滚体现出具体的镜像名 ([JSYWYBRQY-70](http://jira.yeepay.com/browse/JSYWYBRQY-70))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-173900.png)
* 在列表页加上总条数 ([JSYWYBRQY-71](http://jira.yeepay.com/browse/JSYWYBRQY-71))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-174602.png)
* 修改组织默认选中其规格和数据中心 ([JSYWYBRQY-72](http://jira.yeepay.com/browse/JSYWYBRQY-72))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170419-180423.png)
* 服务类型改为中文 ([JSYWYBRQY-101](http://jira.yeepay.com/browse/JSYWYBRQY-101))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170421-095544.png)
* 服务端口组的TargetPort和nodePort合并了 ([JSYWYBRQY-102](http://jira.yeepay.com/browse/JSYWYBRQY-102))
![](http://oonfhlbqp.bkt.clouddn.com/QQ20170421-095946.png)

## 废弃特性

暂无

## 常见问题与解决

* 在系统使用过程中，如果进度条未完成，请耐心等待或刷新页面重新操作。
* 在应用列表操作后若结果没有及时更新，请稍后进行刷新。若多次刷新仍无效，请联系管理员。

