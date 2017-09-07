<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

查看数据源详情
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-09
修订说明：URL里去掉数据源名

目录
--------------
### 目的
DBA可以查看数据源详情，比如某数据源文件包含哪些配置详情(变量及值)，被哪些应用所使用

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/describe
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
```json
{
    "orgId": 1,
    "name": "CONFIG.properties",
    "version": "1"
}
```


### 页面设计
配置详情:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|KEY|  data.datasource[].configuration[]."key" | 这里的key仅表示一个值为"key"的KEY，不代表实际键名|
|VALUE| data.datasource[].configuration[]."value"| 这里的value仅表示一个值为"value"的VALUE，不代表实际键名|


应用详情
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|应用名称| data.datasource[].deploymentInfo[].deploymentName|
|组织| data.datasource[].deploymentInfo[].organization|
|发布时间| data.datasource[].deploymentInfo[].createdAt|
|发布人| data.datasource[].deploymentInfo[].userName|

### 程序实现逻辑
```Title: 数据源详情
YCE-->>MySQL: 从datasource-deployment表中获取使用该数据源文件的应用信息
YCE<<--MySQL: 得到返回

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。


### 备注
配置详情从list里取
应用详情发请求取

测试URL： curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"orgId\":1, \"version\":\"1\", \"name\":\"CONFIG.properties\"}" localhost:8080/api/v1/datasources/describe


#### ///// 以下为弃用旧版本

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

查看数据源详情
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明：请求URL里去掉了名字，添加测试URL，参数里添加name和version

目录
--------------
### 目的
DBA可以查看数据源详情，比如某数据源文件包含哪些配置详情(变量及值)，被哪些应用所使用

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/describe
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
```json
{
    "orgId": 1,
    "name": "CONFIG.properties",
    "version": "1"
}
```


### 页面设计
配置详情:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|KEY|  data.datasource[].configuration[]."key" | 这里的key仅表示一个值为"key"的KEY，不代表实际键名|
|VALUE| data.datasource[].configuration[]."value"| 这里的value仅表示一个值为"value"的VALUE，不代表实际键名|


应用详情
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|应用名称| data.datasource[].deploymentInfo[].deploymentName|
|组织| data.datasource[].deploymentInfo[].organization|
|发布时间| data.datasource[].deploymentInfo[].createdAt|
|发布人| data.datasource[].deploymentInfo[].userName|

### 程序实现逻辑
```Title: 数据源详情
YCE-->>MySQL: 从datasource-deployment表中获取使用该数据源文件的应用信息
YCE<<--MySQL: 得到返回

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。


### 备注
配置详情从list里取
应用详情发请求取

测试URL： curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"orgId\":1, \"version\":\"1\", \"name\":\"CONFIG.properties\"}" localhost:8080/api/v1/datasources/describe


#### ///// 以下为弃用旧版本


<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

查看数据源详情
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-02
修订说明：应用详情去deployment里找

目录
--------------
### 目的
DBA可以查看数据源详情，比如某数据源文件包含哪些配置详情(变量及值)，被哪些应用所使用

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/describe
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
无

### 页面设计
配置详情:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|KEY|  data.datasource[].configuration[]."key" | 这里的key仅表示一个值为"key"的KEY，不代表实际键名|
|VALUE| data.datasource[].configuration[]."value"| 这里的value仅表示一个值为"value"的VALUE，不代表实际键名|


应用详情
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|应用名称| data.datasource[].deploymentInfo[].deploymentName|
|组织| data.datasource[].deploymentInfo[].organization|
|发布时间| data.datasource[].deploymentInfo[].createdAt|
|发布人| data.datasource[].deploymentInfo[].userName|

### 程序实现逻辑
```Title: 数据源详情
YCE-->>MySQL: 从datasource-deployment表中获取使用该数据源文件的应用信息
YCE<<--MySQL: 得到返回

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。


### 备注
配置详情从list里取
应用详情发请求取


#### ///// 以下为弃用旧版本

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

查看数据源详情
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-01

目录
--------------
### 目的
DBA可以查看数据源详情，比如某数据源文件包含哪些配置详情(变量及值)，被哪些应用所使用

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/{datasourceName}/describe
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
无

### 页面设计
配置详情:
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|KEY|  data.datasource[].configuration[]."key" | 这里的key仅表示一个值为"key"的KEY，不代表实际键名|
|VALUE| data.datasource[].configuration[]."value"| 这里的value仅表示一个值为"value"的VALUE，不代表实际键名|


应用详情
|项目:|数据源:|说明:|
|:-:|:--:|:------:|
|应用名称| data.datasource[].deploymentInfo[].deploymentName|
|组织| data.datasource[].deploymentInfo[].organization|
|发布时间| data.datasource[].deploymentInfo[].createdAt|
|发布人| data.datasource[].deploymentInfo[].userName|

### 程序实现逻辑
```Title: 数据源详情
YCE-->>MySQL: 从datasource-deployment表中获取使用该数据源文件的应用信息
YCE<<--MySQL: 得到返回

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。


### 备注
配置详情从list里取
应用详情发请求取