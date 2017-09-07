<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

删除数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明：添加了测试用URL，参数里添加name和version, 删掉了请求URL中的名字

目录
--------------
### 目的
由DBA用户删除数据源文件(软删)

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/delete
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
  "userId": 1,    // 当前登录DBA的userId
  "orgId": 2      // 当前登录DBA所属的组织orgId
  "name": "CONFIG.properties",
  "version": "1"
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
删除数据源文件
YCE-->>MySQL: 在Datasource表中将对应记录的status变为INVALID
YCE<<--MySQL: 返回删除结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注

测试用URL： curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"userId\": 7, \"orgId\": 1, \"name\":\"CONFIG.properties\", \"version\":\"3\"}" localhost:8080/api/v1/datasources/delete


### /// 以下为旧版

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

删除数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-28

目录
--------------
### 目的
由DBA用户删除数据源文件(软删)

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/delete
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
  "userId": 1,    // 当前登录DBA的userId
  "orgId": 2      // 当前登录DBA所属的组织orgId
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
删除数据源文件
YCE-->>MySQL: 在Datasource表中将对应记录的status变为INVALID
YCE<<--MySQL: 返回删除结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注