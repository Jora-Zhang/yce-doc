<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

创建数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-03
修订说明: 添加了version，及测试用URL

目录
--------------
### 目的
由DBA用户创建(或保存)数据源文件

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/new
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
   "name": "xxx",     // 数据源文件的名字
   "version": "1",    // 数据源文件版本
   "userId": 1,       // 当前DBA的userId
   "configuration": {
        "JDBC": "xxx.xxx",
        "MAX": 5
   },                 // 配置KV信息转换成的json
   "orgId": 2,        // 当前DBA的orgId，为后面重名做准备。供校验身份用
   "comment": "xxx"   // DBA对该数据源文件的描述
}
```


### 页面设计
无


### 程序实现逻辑

```Title:
创建模板
YCE-->>MySQL: 在datasource表中插入一条数据
YCE<<--MySQL: 返回插入结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注

datasource表设计

主键: 自增长id


|列:           |  数据类型：| 说明:   |  示例:       |
|:------------:|:------- :|:-------:|:-----------:|
|ID            | INT      | 自增主键 | 1           |
|name          | VARCHAR  |         |  CONFIG     |
|status        | INT      |         |  1          |
|configuration | TEXT     |配置信息KV |             |
|createdAt     | VARCHAR  |         |             |
|modifiedAt    | VARCHAR  |         |             |
|modifiedOp    | VARCHAR  |         |             |
|comment       | VARCHAR  |         |             |


DAO:
```golang
    type DataSource struct {
        Id  int32 `json:"id"`
        Name string `json:"name"
        Status int32 `json:"status"`
        Configuration string `json:"configuration"`
        CreatedAt string `json:"createdAt"`
        ModifiedAt string `json:"modifiedAt"`
        ModifiedOp int32 `json:"modifiedOp"`
        Comment string `json:"comment"`
    }
```

两个按钮, 保存以及取消。

后面可以尝试将configuration按照JSON格式的数据进行存放

在数据源-应用映射表里添加了使用该数据源文件的关联

测试用URL： curl -XPOST -H "Authorization":"ce3303ff-fd80-49e8-b546-b47e78d47087" -d "{\"name\":\"CONFIG.properties\", \"version\":\"1\", \"userId\":7, \"configuration\":\"{\\\"JDBC\\\":\\\"jdbc:192.168\\\", \\\"MAX\\\": 5}\", \"orgId\":1, \"comment\":\"add config 1\"}"

### ////以下为弃用旧版本





<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

创建数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-03-01
修订说明: 添加对数据源表跟数据源-应用映射表的说明

目录
--------------
### 目的
由DBA用户创建(或保存)数据源文件

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/new
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
   "name": "xxx",     // 数据源文件的名字
   "userId": 1,       // 当前DBA的userId
   "configuration": {
        "JDBC": "xxx.xxx",
        "MAX": 5
   },                 // 配置KV信息转换成的json
   "orgId": 2,        // 当前DBA的orgId，为后面重名做准备。供校验身份用
   "comment": "xxx"   // DBA对该数据源文件的描述
}
```


### 页面设计
无


### 程序实现逻辑

```Title:
创建模板
YCE-->>MySQL: 在datasource表中插入一条数据
YCE<<--MySQL: 返回插入结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注

datasource表设计

主键: 自增长id


|列:           |  数据类型：| 说明:   |  示例:       |
|:------------:|:------- :|:-------:|:-----------:|
|ID            | INT      | 自增主键 | 1           |
|name          | VARCHAR  |         |  CONFIG     |
|status        | INT      |         |  1          |
|configuration | TEXT     |配置信息KV |             |
|createdAt     | VARCHAR  |         |             |
|modifiedAt    | VARCHAR  |         |             |
|modifiedOp    | VARCHAR  |         |             |
|comment       | VARCHAR  |         |             |


DAO:
```golang
    type DataSource struct {
        Id  int32 `json:"id"`
        Name string `json:"name"
        Status int32 `json:"status"`
        Configuration string `json:"configuration"`
        CreatedAt string `json:"createdAt"`
        ModifiedAt string `json:"modifiedAt"`
        ModifiedOp int32 `json:"modifiedOp"`
        Comment string `json:"comment"`
    }
```

两个按钮, 保存以及取消。

后面可以尝试将configuration按照JSON格式的数据进行存放

在数据源-应用映射表里添加了使用该数据源文件的关联


### ////以下为弃用旧版本

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

创建数据源文件
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-28

目录
--------------
### 目的
由DBA用户创建(或保存)数据源文件

### 请求

* 请求方法: POST
* 请求URL: /api/v1/datasources/new
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
   "name": "xxx",     // 数据源文件的名字
   "userId": 1,       // 当前DBA的userId
   "configuration": {
        "JDBC": "xxx.xxx",
        "MAX": 5
   }, // 配置KV信息转换成的json
   "orgId": 2         // 当前DBA的orgId
}
```


### 页面设计
无


### 程序实现逻辑

```Title:
创建模板
YCE-->>MySQL: 在datasource表中插入一条数据
YCE<<--MySQL: 返回插入结果
```

### 响应数据结构:
返回码为0, 表示可用。
其他返回码表示出错。

### 备注

datasource表设计

主键: 自增长id


|列:           |  数据类型：| 说明:   |  示例:       |
|:------------:|:------- :|:-------:|:-----------:|
|ID            | INT      | 自增主键 | 1           |
|name          | VARCHAR  |         |  CONFIG     |
|status        | INT      |         |  1          |
|configuration | TEXT     |配置信息KV |             |
|createdAt     | VARCHAR  |         |             |
|modifiedAt    | VARCHAR  |         |             |
|modifiedOp    | VARCHAR  |         |             |
|comment       | VARCHAR  |         |             |


DAO:
```golang
    type DataSource struct {
        Id  int32 `json:"id"`
        Name string `json:"name"
        Status int32 `json:"status"`
        Configuration string `json:"configuration"`
        CreatedAt string `json:"createdAt"`
        ModifiedAt string `json:"modifiedAt"`
        ModifiedOp int32 `json:"modifiedOp"`
        Comment string `json:"comment"`
    }
```

两个按钮, 保存以及取消。

后面可以尝试将configuration按照JSON格式的数据进行存放
