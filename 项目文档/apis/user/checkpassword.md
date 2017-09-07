<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

验证密码
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-01

目录
--------------
###目的
用户修改密码时校验旧密码

###请求

* 请求方法: POST
* 请求URL: api/v1/organizations/:orgId/users/:userId/checkpassword
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
     "password": "xxx"    // 旧密码
}
```


###页面设计 
无


###程序实现逻辑
```Title: 验证密码 
YCE-->>MySQL: 在user表根据userId查询对应的密码是否正确
YCE<<--MySQL: 返回查询结果 
```

###响应数据结构: 
返回码为0, 表示可用。
返回码为1417表示密码错误

### 备注
无