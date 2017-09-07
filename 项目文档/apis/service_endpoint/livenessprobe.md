<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

探活服务健康检查
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-21

目录
--------------
### 目的
方便用户探测服务是否健康


### 请求

* 请求方法: POST
* 请求URL: /api/v1/organizations/{orgId}/services/{svcName}/livenessprobe
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数:
JSON
```json
    {
      "dcId": 1,
      "orgId": "7",
      "deploymentName":"xxxxx"
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
服务结果直接返回


### 备注
只对具有NodePort的服务进行探活，探活为ClusterIP:NodePort/healthz

测试URL：url -XPOST -H "Authorization":"2db5b0e0-a137-43b7-9369-de9597b0a62f" -d "{\"dcId\":1, \"deploymentName\":\"testhealthz\", \"orgId\":\"1\"}" localhost:8080/api/v1/organizations/2/services/testhealthz-svc/livenessprobe
