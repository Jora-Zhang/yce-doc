<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

检查应用重名
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-22
修订说明：添加了dcIdList参数，用来处理同一个应用分批发布校验重名失败导致的问题

目录
--------------
### 目的
用户创建应用时检查应用名是否重复

### 请求

* 请求方法: POST
* 请求URL: /api/v1/organizations/{:orgId}/users/:userId/deployments/check
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
{
    "name": "xxx",
    "dcIdList": [1, 2, 66]
}
```


### 页面设计
无


### 程序实现逻辑
```Title: 创建组织
YCE-->>K8s: 在指定的数据中心k8s集群里查询是否有该应用名重复，重复即不可用
YCE<<--K8s: 返回查询结果
```

### 响应数据结构:
返回码为0, 表示可用。
返回码为1415表示应用名已存在

### 备注
传来的参数里如果没有dcId或dcId为0，均得到MySQL查询出错的响应。如果dcId没有值，则提示JSON序列化出错
测试URL： curl -XPOST -H "Authorization":"d1857478-7458-4bba-b05d-9c52c882b2f6" -d "{\"name\":\"healthz\", \"dcIdList\":[1, 2]}" localhost:8080/api/v1/organizations/2/users/7/deployments/check


### ///////////////以下为旧版本



<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

检查应用重名
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-09

目录
--------------
### 目的
用户创建应用时检查应用名是否重复

### 请求

* 请求方法: POST
* 请求URL: /api/v1/organizations/{:orgId}/users/:userId/deployments/check
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "name": "xxx",
}
```


### 页面设计 
无


### 程序实现逻辑
```Title: 创建组织
YCE-->>K8s: 在每个数据中心的k8s集群里查询是否有该应用名重复，只要有一个重复即不可用
YCE<<--K8s: 返回查询结果 
```

### 响应数据结构: 
返回码为0, 表示可用。
返回码为1415表示应用名已存在

### 备注



### ///////////////以下为旧版本

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

检查应用重名
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-08

目录
--------------
###目的
用户创建应用时检查应用名是否重复

###请求

* 请求方法: POST
* 请求URL: /api/v1/organizations/{:orgId}/users/:userId/deployments/check
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "name": "xxx",
}
```


###页面设计 
无


###程序实现逻辑
```Title: 创建组织
YCE-->>K8s: 在每个数据中心的k8s集群里查询是否有该应用名重复 
YCE<<--K8s: 返回查询结果 
```

###响应数据结构: 
返回码为0, 表示可用。
返回码为1415表示用户名已存在

### 备注