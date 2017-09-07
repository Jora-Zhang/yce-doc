# 管理员须知

## v0.6.6-fix镜像

镜像名 | 校验
-------- | -----------
img.reg.3g:15000/yce:201704262250 | `22e9eb468b0e`


## 主要更新说明

本次更新主要修复了两处Bug。

* 服务健康检查端口错误。已改为选择服务的NodePort拼接健康检查URL（形如ApiServerIP + SvcNodePort）。
* 创建模板过程中取消选择器的填写([JSYWYBRQY-128](http://jira.yeepay.com/browse/JSYWYBRQY-128))
    * 在创建模板过程中，取消选择器的填写
    * 使用绿色通道时，导入模板后填写应用名，选择器的Value值与应用名保持一致，Key值则为name

    ![](http://oonfhlbqp.bkt.clouddn.com/E3B4F6218BCDA78031A55F7D9A4FEEC8.jpg)


## 主要特性

### 样式细节修改

## 废弃特性

暂无

## 常见问题与解决

