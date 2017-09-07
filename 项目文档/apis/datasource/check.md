<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

重名检查
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明：添加了测试URL，同时填加了version作为参数

目录
--------------
### 目的
由DBA创建数据源文件时进行重名检查

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/check
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
   "name": "xxx", // 数据源文件名
   "version": "1",// 数据源文件版本
   "orgId": 1     // 当前DBA的orgId，供认证会话用
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
重名检查
YCE-->>MySQL: 在datasource表中查询该数据源文件名未被使用
YCE<<--MySQL: 返回查询结果
```

### 响应数据结构:
返回码为0, 表示可用。
返回码1415表示出错。

### 备注
同名配置文件全局只有一份，内容是确定的。不存在同名配置文件内容不符的情况。
测试用URL: curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"name\":\"CONFIG.properties\", \"version\":\"2\", \"orgId\":1}" localhost:8080/api/v1/datasources/check


### ////以下为弃用旧版本


<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

重名检查
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-01
修订说明：添加了对数据源文件名的备注

目录
--------------
### 目的
由DBA创建数据源文件时进行重名检查

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/check
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
   "name": "xxx", // 数据源文件名
   "orgId": 1     // 当前DBA的orgId，供认证会话用
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
重名检查
YCE-->>MySQL: 在datasource表中查询该数据源文件名未被使用
YCE<<--MySQL: 返回查询结果
```

### 响应数据结构:
返回码为0, 表示可用。
返回码1415表示出错。

### 备注
同名配置文件全局只有一份，内容是确定的。不存在同名配置文件内容不符的情况。


### ////以下为弃用旧版本

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

重名检查
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-28

目录
--------------
### 目的
由DBA创建数据源文件时进行重名检查

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/check
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
   "name": "xxx", // 数据源文件名
   "orgId": 1     // 当前DBA的orgId，供认证会话用
}
```


### 页面设计
无


### 程序实现逻辑
```Title:
重名检查
YCE-->>MySQL: 在datasource表中查询该数据源文件名未被使用
YCE<<--MySQL: 返回查询结果
```

### 响应数据结构:
返回码为0, 表示可用。
返回码1415表示出错。

### 备注

