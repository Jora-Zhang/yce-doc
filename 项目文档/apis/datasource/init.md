<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

创建准备
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-28

目录
--------------
### 目的
为DBA创建数据源文件做准备. 暂时没有想到应做的准备

### 请求

* 请求方法: GET
* 请求URL: /api/v1/datasources/init
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:



###页面设计
无


###程序实现逻辑
无

###响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
无
