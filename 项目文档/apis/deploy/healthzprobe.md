<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

探活应用健康检查
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-21
修订说明：修改了备注里的探活信息

目录
--------------
### 目的
方便用户探测应用是否健康


### 请求

* 请求方法: POST
* 请求URL: /api/v1/organizations/{orgId}/deployment/{deploymentName}/livenessprobe
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
    {
      "dcId": 1,
      "orgId": "7",
      "podName": "healthz-nodeport-1355935587-epcj9"
    }
```

### 页面设计
无

### 程序实现逻辑:

```Sequence
Title: 数据中心列表
YCE-->>APP: 探活GET
YCE<<--APP: 探活结果
```

说明: 收到GET请求, 在数据库里查找所有status为VALID的数据中心, 并组成列表返回

### 响应数据结构:
应用结果直接返回


### 备注
只对当前实例进行探活，探活为PodIP:port/healthz

测试URL：curl -XPOST -H "Authorization":"067f16eb-c8e1-4f44-8311-8d0117beb6aa" -d "{\"orgId\":\"1\", \"dcId\":1, \"podName\":\"healthz-nodeport-1355935587-epcj9\"}" localhost:8080/api/v1/organizations/1/deployment/healthz-nodeport/livenessprobe


#### //// 以下为旧版本
<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

探活应用健康检查
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-10

目录
--------------
### 目的
方便用户探测应用是否健康


### 请求

* 请求方法: POST 
* 请求URL: /api/v1/organizations/{orgId}/deployment/{deploymentName}/livenessprobe 
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 
JSON
```json
    {
      "dcId": 1,
      "orgId": "7",
      "podName": "healthz-nodeport-1355935587-epcj9"
    }
```

### 页面设计 
无

### 程序实现逻辑:

```Sequence
Title: 数据中心列表 
YCE-->>APP: 探活GET 
YCE<<--APP: 探活结果
```

说明: 收到GET请求, 在数据库里查找所有status为VALID的数据中心, 并组成列表返回 

### 响应数据结构: 
应用结果直接返回


### 备注
如果该应用没有设置健康检查，无法进行探活
如果该应用设置了健康检查，但是没有服务，探活按容器IP:PORT/healthz的方式进行，说明容器正常。但是不能跨集群。
如果该应用设置了健康检查，且有ClusterIP类型的服务，探活按ClusterIP:PORT/healthz的方式进行，说明从集群内到服务到容器都正常。不能跨集群。
如果该应用设置了健康检查，且有NodePort类型的服务，探活按ClusterIP:NodePort/healthz的方式进行， 说明从集群外到服务到容器都正常

如果该应用设置的健康检查端口是另一个开放端口，会提示Not Found
如果该应用设置的健康检查端口是未开放的端口，如果是容器IP会提示Connection refused，如果是CLUSTERIP，会提示Connection timed out，如果是NODEPORT，会提示Not Found
如果探活失败，那就是失败。

测试URL：curl -XPOST -H "Authorization":"067f16eb-c8e1-4f44-8311-8d0117beb6aa" -d "{\"orgId\":\"1\", \"dcId\":1, \"podName\":\"healthz-nodeport-1355935587-epcj9\"}" localhost:8080/api/v1/organizations/1/deployment/healthz-nodeport/livenessprobe

