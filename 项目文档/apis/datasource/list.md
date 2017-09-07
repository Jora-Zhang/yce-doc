<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

管理数据源文件列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明：添加了请求参数orgId

目录
--------------
### 目的
为DBA用户返回数据源文件列表

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources
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
|Id|  data[].id|
|名称| data[].name|
|版本| data[].version|
|发布时间| data[].createdAt|
|发布人| data[].userName|
|操作| 修改、导出、删除|




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
        "id": 1,
        "name": "xxx",
        "configurtaion": {
            "JDBC": "xxx.xxx",
            "MAX": 5
        }
        "version": "1",
        "createdAt": "xxx",    // 创建时间
        "userName": "zhuo.li", // 最后修改人员
      }],
}
```
### 备注
下面的这些信息在详情描述里体现：
|配置信息
|应用信息

测试URL： curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"orgId\": 1}" localhost:8080/api/v1/datasources

### //// 下面的为旧版


<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

管理数据源文件列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-01

目录
--------------
### 目的
为DBA用户返回数据源文件列表

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
无


### 页面设计
列表:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|Id|  data.id|
|名称| data.name|
|发布时间| data.createdAt|
|发布人| data.userName|
|操作| 修改、导出、删除|




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
        "id": 1,
        "name": "xxx",
        "configurtaion": {
            "JDBC": "xxx.xxx",
            "MAX": 5
        }
        "createdAt": "xxx",    // 创建时间
        "userName": "zhuo.li", // 最后修改人员
      }],
}
```
### 备注
下面的这些信息在详情描述里体现：
|配置信息| data.datasource[].configuration|
|应用信息| data.datasource[].deploymentInfo|

### //// 下面的为旧版

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

管理数据源文件列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-28

目录
--------------
### 目的
为DBA/上线用户返回数据源文件列表

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
无


### 页面设计
无


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
   "data": {
      "datasources": [{
        "id": 1,
        "name": "xxx",
        "configurtaion": {
            "JDBC": "xxx.xxx",
            "MAX": 5
        },
        "createdAt": "xxx",    // 创建时间
        "userName": "zhuo.li", // 最后修改人员
      }],
}
```
### 备注