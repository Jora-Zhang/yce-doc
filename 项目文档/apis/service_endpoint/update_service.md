<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

更新服务
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-07

目录
--------------
###目的
由用户更新服务

###请求

* 请求方法: POST 
* 请求URL:  /api/v1/organizations/{orgId}/users/{userId}/services/update
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON

```json
    {
      "serviceName": "test-service",                 // 本地读取  
      "orgName": "ops",                              // 本地读取
      "dcIdList": [1],                               // 本地获取dcId再填充
      "service": {
                     "kind": "Service",              // 默认
                     "apiVersion": "v1",             // 默认
                     "metadata": { 
                         "name": "test-service",     // 本地读取
                         "namespace": "ops",         // 本地读取
                         "labels": {                 
                             "name": "test-service", // 本地读取
                             "author":"liyao.miao",  // 本地读取
                             "type": "service"       // 本地读取: 必填,为了区分service和endpoints
                         }
                     },
                     "spec": {
                         "type": "NodePort",         // 本地读取
                         "selector": {
                             "name": "test-deployment" // 本地读取
                         },
                         "ports": [                  // 端口组由用户重新输入
                             {
                                 "name": "port",
                                 "protocol": "TCP",
                                 "port": 80,
                                 "targetPort": 80,
                                 "nodePort": 32289
                             }
                         ]
                     }
                 
                 }
    }
```
本地读取内容:
| 项目 | 变量 | 说明 |
|:------:|:--:|:----:|
|serviceName|data[$index1].serviceList.items[$index2].metadata.name| |
|orgName|data[$index1].serviceList.items[$index2].metadata.namespace||
|dcIdList|添加data[$index1].dcId||
|service.kind|默认为"service"||
|service.apiVersion|默认为"v1"||
|service.metadata.name|data[$index1].serviceList.items[$index2].metadata.name|
|service.metadata.namespace|data[$index1].serviceList.items[$index2].metadata.namespace||
|service.metadata.labels|data[$index1].serviceList.items[$index2].metadata.labels||
|service.spec.type|data[$index1].serviceList.items[$index2].spec.type||
|service.spec.selector|data[$index1].serviceList.items[$index2].spec.selector||
|service.spec.ports[$index3].name|data[$index1].serviceList.items[$index2].spec.ports[$index3].name|用户修改|
|service.spec.ports[$index3].protocol|data[$index1].serviceList.items[$index2].spec.ports[$index3].protocol|用户修改|
|service.spec.ports[$index3].port|data[$index1].serviceList.items[$index2].spec.ports[$index3].port|用户修改|
|service.spec.ports[$index3].targetPort|data[$index1].serviceList.items[$index2].spec.ports[$index3].targetPort|用户修改|
|service.spec.ports[$index3].nodePort|data[$index1].serviceList.items[$index2].spec.ports[$index3].nodePort|用户修改|



用户填写内容:
| 项目 | 变量 | 说明 |
|:------:|:--:|:----:|
|端口组名称| data.service.spec.ports[$index].name|不能为空,不能多于15个字符,至少包含一个[a-z],可包含[-a-z0-9],不能以连字符开头, 正则: "\^[a-z0-9]\([-a-z0-9]*[a-z0-9]\)?$"|
|端口组TargetPort|data.service.spec.ports[$index].targetPort|范围[1,65535]|
|端口组Port|data.service.spec.ports[$index].port|范围[1,65535]|
|端口组nodePort|data.service.spec.ports[$index].nodePort|目前范围是[30000,32767],支持推荐|
|端口组协议|data.service.spec.protocol|不能为空,只能为TCP或UDP|



###页面设计 
无


###程序实现逻辑
```Title: 创建组织
YCE-->>k8s: 每个k8s集群更新service
YCE<<--K8s: 返回更新结果
YCE-->>MySQL: 更新每个dc对应的nodeport状态
YCE<<--MySQL: 返回更新结果
```

###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。



### 备注
更新时应该发送全部的service JSON 过去

测试用JSON: 
- 创建服务: curl -XPOST -H "Authorization":"ed4b58a5-1614-4b63-ae1c-cbf1ba3ef41a" -d "{\"serviceName\": \"nginx-update\",\"orgName\": \"dev\",\"dcIdList\": [1],\"service\": {\"kind\": \"Service\",\"apiVersion\": \"v1\",\"metadata\": {\"name\": \"nginx-update\",\"labels\": {\"name\": \"nginx-update\",\"namespace\": \"dev\",\"author\": \"liyao.miao\",\"type\": \"service\"}},\"spec\": {\"type\": \"NodePort\",\"selector\": {\"name\": \"nginx-deployment\"},\"ports\": [{\"name\": \"port1\",\"targetPort\": 10000,\"port\": 10000,\"nodePort\": 30005}]}}}" localhost:8080/api/v1/organizations/1/users/7/services/new
- 更新服务: curl -XPOST -H "Authorization":"ed4b58a5-1614-4b63-ae1c-cbf1ba3ef41a" -d "{\"serviceName\": \"nginx-update\",\"orgName\": \"dev\",\"dcIdList\": [1],\"service\": {\"kind\": \"Service\",\"apiVersion\": \"v1\",\"metadata\": {\"name\": \"nginx-update\",\"labels\": {\"name\": \"nginx-update\",\"namespace\": \"dev\",\"author\": \"liyao.miao\",\"type\": \"service\"}},\"spec\": {\"type\": \"NodePort\",\"selector\": {\"name\": \"nginx-deployment\"},\"ports\": [{\"name\": \"port2\",\"targetPort\": 10000,\"port\": 10000,\"nodePort\": 30004},{\"name\": \"port3\",\"targetPort\": 10000,\"port\": 10000,\"nodePort\": 30006}]}}}" localhost:8080/api/v1/organizations/1/users/7/services/update

