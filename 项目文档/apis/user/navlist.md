<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

管理用户列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-14

目录
--------------
### 目的
由管理员以列表形式管理用户

### 请求

* 请求方法: POST 
* 请求URL: /api/v1/user/navlist
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
    "userName": "xxx",
    "orgId": "1"        //表示(管理员)所在的组织,用来验证管理员会话, 从本地存储中获取
}



### 页面设计 
无


### 程序实现逻辑
```Title: 用户列表 
YCE-->>MySQL: 根据用户名查询对应的navList  
YCE<<--MySQL: 返回请求结果 
```

### 响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。
JSON:
```json
{
    "code": 0,
    "msg": "...",
    "data": {
        "navList": {
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
        } 
    }
}
```

### 备注
无

测试curl: curl -XPOST -H "Authorization":"8ea98925-8bee-445c-902c-e3e9552acfa9" -d "{\"userName\":\"test.user\", \"orgId\":\"3\"}" localhost:8080/api/v1/user/navlist