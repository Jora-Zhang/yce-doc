<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

获取数据源文件简要列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明：修改了请求方法为POST，添加了测试URL

目录
--------------
### 目的
为上线用户返回数据源文件列表

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/brief
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
```json
{
    "orgId": 1
}
```


### 页面设计
列表:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|名称| data.name|
|发布人| data.userName|




### 程序实现逻辑
```Title:
管理模板列表
YCE-->>MySQL: 在datasource表中请求所有可用数据并返回
YCE<<--MySQL: 返回请求结果，并排序后返回
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

JSON
```json
{
   "code": xxx,
   "msg": "xxx",
   "data": [{
        "name": "xxx",
        "userName": "zhuo.li", // 最后修改人员
      }],
}
```
### 备注
测试URL：

#### //以下为旧版

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

获取数据源文件简要列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-01

目录
--------------
### 目的
为上线用户返回数据源文件列表

### 请求

* 请求方法: GET
* 请求URL: /api/v1/datasources/brief
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
```json
{
    "orgId": 1
}
```


### 页面设计
列表:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|名称| data.name|
|发布人| data.userName|




### 程序实现逻辑
```Title:
管理模板列表
YCE-->>MySQL: 在datasource表中请求所有可用数据并返回
YCE<<--MySQL: 返回请求结果，并排序后返回
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

JSON
```json
{
   "code": xxx,
   "msg": "xxx",
   "data": [{
        "name": "xxx",
        "userName": "zhuo.li", // 最后修改人员
      }],
}
```
### 备注
