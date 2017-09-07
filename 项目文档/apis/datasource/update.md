<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

更新数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明：添加了版本和名字，删掉了请求URL里的名字，添加了测试用URL，和修改说明

目录
--------------
### 目的
由DBA用户更新数据源文件

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/update
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
    "orgId": 2,          // 用来验证用户
    "userId": 1,         // 当前登录的DBA的userId
    "configuration": {
        "JDBC": "xxx.xx",
        "MAX": 5
    }, //新的配置KV信息JSON
    "version": "1",
    "comment": "xxx"
    "name": "CONFIG.properties" // 用户不可用修改文件名
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
更新模板
YCE-->>MySQL: 在datasource表中找到该记录并更新
YCE<<--MySQL: 返回更新结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
用户发布应用时来更新此表中的deploymentName字段

用户如果修改了参数中的name字段，假如数据库里没有对应的name:version对，就会新建一个对

测试URL： curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"orgId\":1, \"userId\":7, \"configuration\":\"{\\\"MYSQL\\\": \\\"db:aa\\\", \\\"MIN\\\": 1}\", \"version\":\"1\", \"comment\":\"udpate version 1\", \"name\":\"NFIG.properties\"}" localhost:8080/api/v1/datasources/update


#### ////以下为弃用旧版

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

更新数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-01
修订说明：添加了应用信息

目录
--------------
### 目的
由DBA用户更新数据源文件

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/update
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
    "orgId": 2,          // 用来验证用户
    "userId": 1,         // 当前登录的DBA的userId
    "configuration": {
        "JDBC": "xxx.xx",
        "MAX": 5
    }, //新的配置KV信息JSON
    "comment": "xxx"
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
更新模板
YCE-->>MySQL: 在datasource表中找到该记录并更新
YCE<<--MySQL: 返回更新结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
用户发布应用时来更新此表中的deploymentName字段






#### ////以下为弃用旧版

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

更新数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-28

目录
--------------
### 目的
由DBA用户更新数据源文件

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/update
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
    "userId": 1,         // 当前登录的DBA的userId
    "configuration": {
        "JDBC": "xxx.xx",
        "MAX": 5
    }, //新的配置KV信息JSON
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
更新模板
YCE-->>MySQL: 在datasource表中找到该记录并更新
YCE<<--MySQL: 返回更新结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
