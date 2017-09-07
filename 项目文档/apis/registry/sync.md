<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

同步镜像
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-01-13

目录
--------------
###目的
提供同步镜像功能


###请求

* 请求方法: POST 
* 请求URL: /api/v1/registry/sync 
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON
```json
{
  "image": "busybox", // 待同步镜像名称(不带img.reg.3g:15000/)
  "tag": "v1",        // 待同步镜像标签
  "op": "liyao.miao", // 同步人员(当前登录用户名)
  "createdAt": "2017-01-13" // 同步时间(当前时间)
}
```


###页面设计 
无


###程序实现逻辑
组织名具有全局唯一性
```Title: 同步镜像 
YCE-->siAgent 容器云向siAgent转发请求
YCE<--siAgent 容器云接收siAgent的请求响应
```


###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。
JSON
```json
{
    "code": 0,
    "msg": "...",
    "data": {
    
    } 
}
```

### 备注
siAgent的地址和端口通过环境变量传入,分别是:
SIAGENTHOST和SIAGENTPORT
在启动时获取配置(如果是QA环境,则需要这两个环境变量),获取失败报错


### 测试
curl -XPOST -d "{\"image\":\"busybox\", \"tag\":\"test\", \"op\":\"liyao.miao\", \"createdAt\":\"20170113\"}" localhost:8080/api/v1/registry/sync

