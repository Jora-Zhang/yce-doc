<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

创建服务
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-29

目录
--------------
###目的
由用户创建服务

###请求

* 请求方法: POST 
* 请求URL: /api/v1/organizations/{orgId}/users/{userId}/services/new
* 请求头: Authorization:$SessionId, 从LocalStorage读  
* 请求参数: 
JSON

```json
    {
      "serviceName": "test-service",
      "orgName": "ops",
      "dcIdList": [1],
      "service": {
                     "kind": "Service",
                     "apiVersion": "v1",
                     "metadata": {
                         "name": "test-service",
                         "namespace": "ops",
                         "labels": {
                             "name": "test-service",
                             "author":"liyao.miao",
                             "type": "service"        //必填,为了区分service和endpoints
                         }
                     },
                     "spec": {
                         "type": "NodePort",
                         "selector": {
                             "name": "test-deployment"
                         },
                         "ports": [
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

| 项目 | 变量 | 说明 |
|:------:|:--:|:----:|
|服务名称| data.serviceName, data.service.metadata.name, data.service.metadata.labels["name"] | 名字非空,正则: "\^[a-z]\([-a-z0-9]*[a-z0-9]\)?$",长度不超过24个字符|
|组织| data.orgName, data.service.metadata.namespace |从本地读取orgName, 正则:"\^[a-z0-9]\([-a-z0-9]*[a-z0-9]\)?$"|
|数据中心| data.dcIdList | 必选,至少选一个|
|服务类型| data.service.spec.type | 必选, 单选,值为ClusterIP或NodePort|
|选择器Key| name |有选择器的时候,默认值为name|
|选择器Value|data.service.selector["name"]|通过绿色通道的时候,值为应用名|
|选择器Key| 用户自填Key||
|选择器Value| data.service.selector["xxx"]|用户填写Value|
|端口组名称| data.service.spec.ports[$index].name|不能为空,不能多于15个字符,至少包含一个[a-z],可包含[-a-z0-9],不能以连字符开头, 正则: "\^[a-z0-9]\([-a-z0-9]*[a-z0-9]\)?$"|
|端口组TargetPort|data.service.spec.ports[$index].targetPort|范围[1,65535]|
|端口组Port|data.service.spec.ports[$index].port|范围[1,65535]|
|端口组nodePort|data.service.spec.ports[$index].nodePort|目前范围是[30000,32767],支持推荐|
|端口组协议|data.service.spec.protocol|不能为空,只能为TCP或UDP|
|标签组Key|name|默认|
|标签组Value|data.service.metadata.labels["name"]|同服务名|
|标签组Key|author|默认|
|标签组Value|data.service.metadata.labels["author"]|从本地读取userName,用户名应该是xx.xx的格式, 例如liyao.miao,同时也支持yong.li-1|
|标签组Key|type|用来与endpoints进行区分|
|标签组Value|data.service.metadata.labels["type"]|值为service|
|标签组Key|用户自填||
|标签组Value|data.service.metadata.labels["xxx"]|用户自填|


###页面设计 
无


###程序实现逻辑
```Title: 创建组织
YCE-->>k8s: 每个k8s集群创建service
YCE<<--K8s: 返回创建结果
```

###响应数据结构: 
返回码为0, 表示可用。
其他返回码表示出错。



### 备注


### 以下为旧版本, 无效///////////////////////////////////////////////////

### 服务发布准备

用户点击服务发布(左侧菜单)时请求后台数据:

请求的URL:

GET /api/v1/organizations/{orgId}/users/{userId}/services/init

请求头中包含: Authorization: ${sessionId}

其中: userId, orgId, sessionId在登录成功后从后台返回给浏览器, 前端存储在LocalStorage(目前为SessionStorage)里面

返回值:

* 组织名称

* 该组织下的数据中心列表



获取成功的大概数据格式如下:

```json

   {
      "code": 0,
      "message": "请求成功",
      "data": {
                "orgId":  "1",
                "orgName": "Ops",
                "nodePort": 30000,  
                "dataCenters": [
                {
                    "dcId": "1",
                    "name": "世纪互联",
                    "budget": 10000000,
                    "balance": 10000000
                },
                {
                    "dcId": "2",
                    "name": "电信机房",
                    "budget": 10000000,
                    "balance": 10000000
                },
                {
                    "dcId": "3",
                    "name": "电子城机房",
                    "budget": 10000000,
                    "balance": 10000000
                }
                ],
      }
   } 
    
```

这些将关系到用户部署服务到哪个机房


用户需要确定:

* 服务名:
* 服务所属数据中心: 依据GET请求的返回值确定。卡片式
* 服务类型:
    仅允许ClusterIP和NodePort两种类型，单选

    1. ClusterIP: 不允许用户填写NodePort或NodePort为0
    2. NodePort: 允许用户填写NodePort

* 选择器(selector): 
  开关。如果打开,用户需要填写一条记录。如果关闭
* 端口组:
  多条:
  
	|名称  |协议  |类型  |端口号 |
|:---:|:----:|:---:|:----:|
|     | tcp  | port| 80|
|  |          |targetPort| 8080|
|  |            |*nodeport*| *80*|

* 标签组
  多条:
  
  KEY:VALUE

### 服务发布提交
用户点击提交请求后台数据:

请求的URL:

POST /api/v1/organizations/{orgId}/users/{userId}/services/new

请求头中包含: Authorization: ${sessionId}

```json
    {
      "serviceName": "test-service-withselector",
      "orgName": "ops",
      "dcIdList": [1],
      "service": {
                     "kind": "Service",
                     "apiVersion": "v1",
                     "metadata": {
                         "name": "1-test-nginx-service",
                         "labels": {
                             "name": "1-test-nginx-service",
                             "type": "service"
                         }
                     },
                     "spec": {
                         "type": "NodePort",
                         "selector": {
                             "name": "test-nginx-test"
                         },
                         "ports": [
                             {
                                 "protocol": "TCP",
                                 "port": 30091,
                                 "targetPort": 80,
                                 "nodePort": 32289
                             }
                         ]
                     }
                 }
    }
```


### 服务修改和删除

按钮在服务及访问点管理的页面上。


