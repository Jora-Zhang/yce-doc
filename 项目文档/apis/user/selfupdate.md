<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

用户自更新
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-02

目录
--------------
###目的
由用户更新用户自己的信息,暂时只提供密码修改


###请求

* 请求方法: POST 
* 请求URL: /api/v1/organizations/:orgId/users/:userId/selfupdate
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "password": "xxx",    // 更新的密码
    "name": "xxx",        // 用户新名字,目前不支持
    "orgName":  "xxx",    // 更新的组织, 目前不支持
    "orgId": "3"         // 用户的新组织Id, 目前不支持
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
无
