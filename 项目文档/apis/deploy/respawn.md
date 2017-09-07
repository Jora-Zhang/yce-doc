img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

重启应用(实例)
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-21

目录
--------------
### 目的
由用户重启所发布的应用(实例)

### 请求

* 请求方法: POST 
* 请求URL: /api/v1/organizations/{orgId}/deployment/{deploymentName}/respawn
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 
  JSON
```json
 {
    "op": "1", 
    "dcIdList": [1], 
    "podName": "busybox-980287496-8z9t7", 
    "comments": "respawn busybox"
  } 
```

### 页面设计 
无

### 程序实现逻辑:

```Sequence
Title: 重启应用(实例)
YCE-->>MySQL: 根据orgId找到对应dcId里的orgName,
YCE<<--MySQL: 返回请求结果
YCE-->>K8s: 根据orgName和podName删除Pod
YCE<<--K8s: 返回删除结果
YCE-->>MySQL: 插入操作记录
YCE<<--MySQL: 返回插入结果
```

### 响应数据结构: 
返回码为0, 表示操作成功。
其他返回码表示出错。

### 快速测试

```shell
curl -XPOST -H "Authorization":"6d21c4db-1774-418b-b368-e9ca29f7821e" -d "{\"op\": \"1\", \"dcIdList\": [1], \"podName\": \"testapp1-2110715556-vznzq\", \"comments\": \"respawn testapp1\"}" localhost:8080/api/v1/organizations/1/deployment/testapp1/respawn
```

### 备注

