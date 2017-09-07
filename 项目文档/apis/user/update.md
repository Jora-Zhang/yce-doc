<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

更新用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-14

目录
--------------
### 目的
由管理员更新用户


### 请求

* 请求方法: POST 
* 请求URL: /api/v1/user/update
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "op": 1,              // 管理员userId
    "name": "xxx",
    "orgId": "3",         // 管理员所属orgId
    "password": "xxx",    // 更新的密码, 可选
    "orgName":  "xxx",    // 更新的组织, 可选
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
```Title: 更新用户 
YCE-->>MySQL: 在user表中更新对应用户记录  
YCE<<--MySQL: 返回更新结果 
```

### 响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
测试用CURL: curl -XPOST -H "Authorization":"8ea98925-8bee-445c-902c-e3e9552acfa9" -d "{\"orgId\":\"3\", \"op\":1, \"name\":\"test.user\", \"navList\":\"{ \\\"list\\\": [{ \\\"href\\\": \\\"walkthrogh\\\",\\\"className\\\": \\\"fa-rocket\\\", \\\"includeState\\\": \\\"main.costManage\\\",\\\"state\\\": \\\"main.walkthrogh\\\", \\\"name\\\": \\\"色通道\\\",\\\"id\\\": 10}] }\"}"  localhost:8080/api/v1/user/update

### //////////以下为旧版本



<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

更新用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-10

目录
--------------
### 目的
由管理员更新用户


### 请求

* 请求方法: POST 
* 请求URL: /api/v1/user/update
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "op": 1,              // 管理员userId
    "name": "xxx",
    "orgId": "3",         // 管理员所属orgId
    "password": "xxx",    // 更新的密码
    "orgName":  "xxx",    // 更新的组织, 目前不支持
    "type": "1",          // 值见下面 
}
```


### 页面设计 


### 程序实现逻辑

Title: 更新用户 
YCE-->>MySQL: 在user表中更新对应用户记录  
YCE<<--MySQL: 返回更新结果 


type: 权限位：SO

type = S + O

* S表示同步镜像权限(syncImage)，选中为2，不选为0 
* O表示操作权限(operation)，选中为1，不选为0

默认是type为1.即S为0，O为1


|type值 | SO(bi) | 权限说明 |
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
测试URL：curl -XPOST -H "Authorization":"77c9e866-dcf0-4e0b-9171-d62d71ff908e" -d "{\"name\":\"test.user\", \"orgName\":\"dev\", \"orgId\":\"3\", \"op\":1, \"type\":\"3\"}" localhost:8080/api/v1/user/update




### //////////以下为旧版本
<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

更新用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-01-06

目录
--------------
###目的
由管理员更新用户


###请求

* 请求方法: POST 
* 请求URL: /api/v1/user/update
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "op": 1,              // 管理员userId
    "name": "xxx",
    "orgId": "3",         // 管理员所属orgId
    "password": "xxx",    // 更新的密码
    "orgName":  "xxx",    // 更新的组织, 目前不支持
    "type": "1",          // 1表示普通用户,具有应用管理的读写权限,2表示受限用户,只具有对应用管理的读权限
}
```


###页面设计 
增加用户类型的选项:正常用户为1, 观察者为2,默认为正常



###程序实现逻辑
```Title: 更新用户 
YCE-->>MySQL: 在user表中更新对应用户记录  
YCE<<--MySQL: 返回更新结果 
```

###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
普通用户修改个人信息用的是不同的API,但可以用同样的后台

//////////以下为旧版本
<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

更新用户
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-08

目录
--------------
###目的
由管理员更新用户


###请求

* 请求方法: POST 
* 请求URL: /api/v1/user/update
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "op": 1,              // 管理员userId
    "name": "xxx",
    "orgId": "3",         // 管理员所属orgId
    "password": "xxx",    // 更新的密码
    "orgName":  "xxx",    // 更新的组织, 目前不支持
}
```


###页面设计 
无


###程序实现逻辑
```Title: 更新用户 
YCE-->>MySQL: 在user表中更新对应用户记录  
YCE<<--MySQL: 返回更新结果 
```

###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。

### 备注
普通用户修改个人信息用的是不同的API,但可以用同样的后台
