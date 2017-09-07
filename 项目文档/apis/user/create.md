<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

创建用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-14

目录
--------------
### 目的
由管理员创建用户

### 请求

* 请求方法: POST 
* 请求URL: /api/v1/user/new
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "userName": "xxx",
    "password": "xxx",  // 暂时有默认值
    "orgName": "dev",       // 创建用户时选择
    "orgId": "1",          // 表示创建者所在的组织, 用来验证管理员会话 
    "op": "1",           // 管理员userId
    "navList": "{
     \"list\": [
       {
         \"href\": \"walkthrogh\",
         \"className\": \"fa-rocket\",
         \"includeState\": \"main.costManage\",
         \"state\": \"main.walkthrogh\",
         \"name\": \"绿色通道\",
         \"id\": 10
       }
       ] 
    }"
}
```


### 页面设计 


### 程序实现逻辑
```Title: 创建用户
YCE-->>MySQL: 在user表中插入一条数据  
YCE<<--MySQL: 返回插入结果 
```


### 响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
用户权限依赖于navList的修改得到。创建用户的时候从全部的navList里挑选需要的权限出来，然后保存到该用户的navList字段，从而设定权限。

测试curl: curl -XPOST -H "Authorization":"8ea98925-8bee-445c-902c-e3e9552acfa9" -d "{\"userName\":\"test.user\", \"password\":\"123456\", \"orgName\":\"dev\", \"orgId\":\"3\", \"op\":\"1\", \"navList\":\"{ \\\"list\\\": [{ \\\"href\\\": \\\"walkthrogh\\\",\\\"className\\\": \\\"fa-rocket\\\", \\\"includeState\\\": \\\"main.costManage\\\",\\\"state\\\": \\\"main.walkthrogh\\\", \\\"name\\\": \\\"绿色通道\\\",\\\"id\\\": 10}] }\"}" localhost:8080/api/v1/user/new



### 以下为旧版本, 无效///////////////////////////////////////////////////


<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

创建用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-10

目录
--------------
### 目的
由管理员创建用户

### 请求

* 请求方法: POST 
* 请求URL: /api/v1/user/new
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "userName": "xxx",
    "password": "xxx",  // 暂时有默认值
    "orgName": "dev",       // 创建用户时选择
    "orgId": "1",          // 表示创建者所在的组织, 用来验证管理员会话 
    "op": "1",           // 管理员userId
    "type": "1"          // 默认 
}
```


### 页面设计 


### 程序实现逻辑

Title: 创建用户

YCE-->>MySQL: 在user表中插入一条数据  
YCE<<--MySQL: 返回插入结果 


type: 权限位：SO
S表示同步镜像权限(syncImage)
O表示操作权限(operation)

type: 权限位：SO

type = S + O

* S表示同步镜像权限(syncImage)，选中为2，不选为0 
* O表示操作权限(operation)，选中为1，不选为0

|type值 | SO | 权限说明 |
|:-----:|:--:|:----:|
|0      | 00 | 完全受限，不能同步镜像，也不能操作。适用于QA/生产上开放给查看状态程序员的权限 |
|1      | 01 | 不能同步镜像，可以操作。适用于生产上上线程序员的权限，默认创建|
|2      | 10 | 可以同步镜像，不能操作|
|3      | 11 | 可以同步镜像，也可以操作，适于QA的上线程序员的权限|


### 响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
默认创建的用户type为1

测试URL：curl -XPOST -H "Authorization":"77c9e866-dcf0-4e0b-9171-d62d71ff908e" -d "{\"userName\":\"test.user\", \"password\":\"123456\", \"orgName\":\"dev\", \"orgId\":\"3\", \"op\":\"1\", \"type\":\"1\"}" localhost:8080/api/v1/user/new




### 以下为旧版本, 无效///////////////////////////////////////////////////




<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

创建用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-01-06

目录
--------------
###目的
由管理员创建用户

###请求

* 请求方法: POST 
* 请求URL: /api/v1/user/new
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "userName": "xxx",
    "password": "xxx",  // 暂时有默认值
    "orgName": "dev",       // 创建用户时选择
    "orgId": "1",          // 表示创建者所在的组织, 用来验证管理员会话 
    "op": "1",           // 管理员userId
    "type": "1"          // 1表示普通用户,具有应用管理的读写权限,2表示受限用户,只具有对应用管理的读权限
}
```


###页面设计 
增加用户类型的选项:正常用户为1, 观察者为2 默认为正常用户


###程序实现逻辑
```Title: 创建用户
YCE-->>MySQL: 在user表中插入一条数据  
YCE<<--MySQL: 返回插入结果 
```

###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
无



### 以下为旧版本, 无效///////////////////////////////////////////////////

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

创建用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-14

目录
--------------
###目的
由管理员创建用户

###请求

* 请求方法: POST 
* 请求URL: /api/v1/user/new
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "userName": "xxx",
    "password": "xxx",  // 暂时有默认值
    "orgName": "dev",       // 创建用户时选择
    "orgId": "1",          // 表示创建者所在的组织, 用来验证管理员会话 
    "op": "1"           // 管理员userId
}
```


###页面设计 
无


###程序实现逻辑
```Title: 创建用户
YCE-->>MySQL: 在user表中插入一条数据  
YCE<<--MySQL: 返回插入结果 
```

###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
无




### 创建用户
-----------

#### 创建初始化
目的: 为创建用户做准备, 获取组织列表供管理员为用户选择
请求URL: /api/v1/user/init
请求头: Authorization:SessionId
请求方法: GET 

返回数据:
```
{
    "code": 0,
    "msg": "xxx",
    "data": [
            "dev",
            "ops"
        ] 
}
```


#### 用户名检查
目的: 当管理员输入用户名完毕后(离开输入框), 检查用户名是否重复
请求URL: /api/v1/user/check
请求头: Authorization:SessionId
请求方法: POST

携带数据:
```
{
    "userName": "xxx",
    "orgName": "yyy",   // 
    "orgId": "1"          //表示创建者(管理员)所在的组织,用来验证管理员会话, 从本地存储中获取
}
```

返回在该组织里是否存在, "code": 1415 为用户名已存在, 不能使用该名称, 需提示。 "code": 0为未被占用, 可以使用该名称, 无需提示。

程序实现逻辑:

根据orgName获得orgId

去user表里选择同时满足orgId和name的用户,如果有,返回存在,如果没有,返回不存在

#### 创建
请求URL: /api/v1/user/new
请求头: Authorization:SessionId
请求方法: POST

携带数据:
```
{
    "userName": "xxx",
    "password": "xxx",  // 暂时有默认值
    "orgName": "dev",       // 创建用户时选择
    "orgId": "1",          // 表示创建者所在的组织, 用来验证管理员会话 
    "op": "1"           // 管理员userId
}
```

#### 用户列表
请求URL: /api/v1/user
请求头: Authorization:SessionId
请求方法: GET 

返回数据:
```
{
    "code": 0,
    "msg": "...",
    "data": {
        "users": [{
            "id": 1,
            "name": "abc.de",
            ....
        }] 
        "orgList": [{
            "orgId": orgName,    // map例如: "1": "dev"
        }]
    }
}
```

列表显示内容:
ID, 用户名, 所属组织, 创建时间, 操作

数据均从data.users的数组里每个元素中取, 其中: 

* ID: id
* 用户名: name
* 所属组织: orgId 
* 创建时间: createdAt
* 操作: 更新、删除

所属组织名称根据orgId获取orgName

#### 删除用户
请求URL: /api/v1/user/delete
请求方法: POST
请求头: Authorization:SessionId
携带数据:
```
{
    "op": 1,
    "userName": "xxx"
}
```

#### 更新用户
请求URL: /api/v1/user/update
请求方法: POST
请求头: Authorization:SessionId

携带数据:
```
{
    "op": 1,              // 管理员userId
    "name": "xxx",
    "orgId": "3",         // 管理员所属orgId
    "password": "xxx",    // 更新的密码
    "orgName":  "xxx",    // 更新的组织, 目前不支持
}
```
