<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

查看镜像同步
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-01-13

目录
--------------
###目的
提供查看镜像同步功能


###请求

* 请求方法: GET 
* 请求URL: /api/v1/registry/synclist
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
无



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
[{
  "id": 1,            // 同步id, siAgent分配,暂无用处
  "image": "busybox", // 同步镜像名称(不带img.reg.3g:15000/)
  "tag": "v1",        // 同步镜像标签
  "op": "liyao.miao", // 同步人员
  "createdAt": "2017-01-13", // 同步时间
  "status": "RUNNING",// 同步状态。还有WAITING、SUCC和FAILED两种状态
  "expire": "4200"    // 同步超时, 在siAgent启动时通过环境变量指定
}]
```

### 备注
siAgent的地址和端口通过环境变量传入,分别是:
SIAGENTHOST和SIAGENTPORT
在启动时获取配置(如果是QA环境,则需要这两个环境变量),获取失败报错

### 测试
curl -XGET localhost:8080/api/v1/registry/synclist
