<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

计算节点列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-09

目录
--------------
### 目的
为管理员列出集群所有节点列表


### 请求

* 请求方法: POST 
* 请求URL: /api/v1/nodes/{name}
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 
 JSON
 ```json
  {
    "orgId": 1 // 当前登录用户的orgId
    "dcId": 66 // 该应用(实例)所在的数据中心Id    所有的Id均以数字形式出现
  } 
 ```


### 页面设计 
数据均从data.nodes每个元素中取, 其中: 

* 名称: metadata.name 
* 可用资源: CPU: status.capacity.cpu, Mem: status.capacity.memory (memory需要除以(1024的平方)将转换为G)
* CRI: status.nodeInfo.containerRuntimeVersion
* 操作系统: status.nodeInfo.osImage
* 内核版本: status.nodeInfo.kernelVersion
* 内部地址: status.addresses[$index].address 找type为InternalIP的元素为index
* 运行时间: metadata.creationTimestamp

### 程序实现逻辑:

```Sequence
Title: 数据中心列表 
YCE-->>K8s: 请求可用的计算节点列表，该组织对应的所有数据中心列表(强制要求多个数据中心的节点名称不同)
YCE<<--K8s: 返回请求结果
```


###响应数据结构: 
JSON
```json
{
    "nodes": [
        {
           "status": {
              "images": [
                {
                  "sizeBytes": 314524685,
                  "names": [
                    "img.reg.3g:15000/kibana:4.3.1",
                    "kibana:4.3.1"
                  ]
                }
              ],
              "nodeInfo": {
                "kubeProxyVersion": "v1.2.0",
                "kubeletVersion": "v1.2.0",
                "containerRuntimeVersion": "docker://1.11.2",
                "osImage": "Ubuntu 14.04.4 LTS",
                "kernelVersion": "3.19.0-65-generic",
                "bootID": "e3df5fd3-c989-4d0e-a33a-506418aaa8ca",
                "systemUUID": "4C4C4544-0046-5910-8058-C7C04F533732",
                "machineID": "f039e4d7d3dfed699537a7df57550d08"
              },
              "daemonEndpoints": {
                "kubeletEndpoint": {
                  "Port": 10250
                }
              },
              "addresses": [
                {
                  "address": "172.21.1.11",
                  "type": "LegacyHostIP"
                },
                {
                  "address": "172.21.1.11",
                  "type": "InternalIP"
                }
              ],
              "conditions": [
                {
                  "message": "kubelet has sufficient disk space available",
                  "reason": "KubeletHasSufficientDisk",
                  "lastTransitionTime": "2016-12-06T08:49:11Z",
                  "lastHeartbeatTime": "2017-01-01T03:43:25Z",
                  "status": "False",
                  "type": "OutOfDisk"
                },
                {
                  "message": "kubelet is posting ready status",
                  "reason": "KubeletReady",
                  "lastTransitionTime": "2016-12-06T08:49:11Z",
                  "lastHeartbeatTime": "2017-01-01T03:43:25Z",
                  "status": "True",
                  "type": "Ready"
                }
              ],
              "allocatable": {
                "pods": "110",
                "memory": "98760652Ki",
                "cpu": "40"
              },
              "capacity": {
                "pods": "110",
                "memory": "98760652Ki",
                "cpu": "40"
              }
            },
            "spec": {
              "externalID": "172.21.1.11"
            },
            "metadata": {
              "labels": {
                "kubernetes.io/hostname": "172.21.1.11"
              },
              "creationTimestamp": "2016-06-14T14:31:19Z",
              "resourceVersion": "56476605",
              "uid": "a9019e1d-323c-11e6-b9d6-44a84240716a",
              "selfLink": "/api/v1/nodes/172.21.1.11",
              "name": "172.21.1.11"
            },
            "apiVersion": "v1",
            "kind": "Node" 
        }
    ]
}
```

返回码为0, 表示可用。
其他返回码表示出错。
(nodes[$index].capacity["cpu"] - nodes[$index].allocatable["cpu"]) / nodes[$index].capacity["cpu"] 公式错误 
(nodes[$index].capacity["mem"] - nodes[$index].allocatable["mem"]) / nodes[$index].capacity["mem"] 公式错误 

### 备注
以及在应用管理列表里支持计算节点详情

计算该节点资源占比,需要统计该节点上每个Pod的资源使用,与该节点全部可分配资源做差后再比。

测试用:
curl -XPOST -H "Authorization":"433b2c4f-87d5-44a2-89b1-352bed33d48b" -d "{\"orgId\":\"1\"}" localhost:8080/api/v1/nodes/172.21.1.11


### 以下是旧版本 /////////////



<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

计算节点列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-01-03

目录
--------------
###目的
为管理员列出集群所有节点列表


###请求

* 请求方法: POST 
* 请求URL: /api/v1/nodes/{name}
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 
 JSON
 ```json
  {
    "orgId": "1" // 当前登录用户的orgId
  } 
 ```


###页面设计 
数据均从data.nodes每个元素中取, 其中: 

* 名称: metadata.name 
* 可用资源: CPU: status.capacity.cpu, Mem: status.capacity.memory (memory需要除以(1024的平方)将转换为G)
* CRI: status.nodeInfo.containerRuntimeVersion
* 操作系统: status.nodeInfo.osImage
* 内核版本: status.nodeInfo.kernelVersion
* 内部地址: status.addresses[$index].address 找type为InternalIP的元素为index
* 运行时间: metadata.creationTimestamp

###程序实现逻辑:

```Sequence
Title: 数据中心列表 
YCE-->>K8s: 请求可用的计算节点列表
YCE<<--K8s: 返回请求结果
```


###响应数据结构: 
JSON
```json
{
    "nodes": [
        {
           "status": {
              "images": [
                {
                  "sizeBytes": 314524685,
                  "names": [
                    "img.reg.3g:15000/kibana:4.3.1",
                    "kibana:4.3.1"
                  ]
                }
              ],
              "nodeInfo": {
                "kubeProxyVersion": "v1.2.0",
                "kubeletVersion": "v1.2.0",
                "containerRuntimeVersion": "docker://1.11.2",
                "osImage": "Ubuntu 14.04.4 LTS",
                "kernelVersion": "3.19.0-65-generic",
                "bootID": "e3df5fd3-c989-4d0e-a33a-506418aaa8ca",
                "systemUUID": "4C4C4544-0046-5910-8058-C7C04F533732",
                "machineID": "f039e4d7d3dfed699537a7df57550d08"
              },
              "daemonEndpoints": {
                "kubeletEndpoint": {
                  "Port": 10250
                }
              },
              "addresses": [
                {
                  "address": "172.21.1.11",
                  "type": "LegacyHostIP"
                },
                {
                  "address": "172.21.1.11",
                  "type": "InternalIP"
                }
              ],
              "conditions": [
                {
                  "message": "kubelet has sufficient disk space available",
                  "reason": "KubeletHasSufficientDisk",
                  "lastTransitionTime": "2016-12-06T08:49:11Z",
                  "lastHeartbeatTime": "2017-01-01T03:43:25Z",
                  "status": "False",
                  "type": "OutOfDisk"
                },
                {
                  "message": "kubelet is posting ready status",
                  "reason": "KubeletReady",
                  "lastTransitionTime": "2016-12-06T08:49:11Z",
                  "lastHeartbeatTime": "2017-01-01T03:43:25Z",
                  "status": "True",
                  "type": "Ready"
                }
              ],
              "allocatable": {
                "pods": "110",
                "memory": "98760652Ki",
                "cpu": "40"
              },
              "capacity": {
                "pods": "110",
                "memory": "98760652Ki",
                "cpu": "40"
              }
            },
            "spec": {
              "externalID": "172.21.1.11"
            },
            "metadata": {
              "labels": {
                "kubernetes.io/hostname": "172.21.1.11"
              },
              "creationTimestamp": "2016-06-14T14:31:19Z",
              "resourceVersion": "56476605",
              "uid": "a9019e1d-323c-11e6-b9d6-44a84240716a",
              "selfLink": "/api/v1/nodes/172.21.1.11",
              "name": "172.21.1.11"
            },
            "apiVersion": "v1",
            "kind": "Node" 
        }
    ]
}
```

返回码为0, 表示可用。
其他返回码表示出错。
(nodes[$index].capacity["cpu"] - nodes[$index].allocatable["cpu"]) / nodes[$index].capacity["cpu"] 公式错误 
(nodes[$index].capacity["mem"] - nodes[$index].allocatable["mem"]) / nodes[$index].capacity["mem"] 公式错误 

### 备注
以及在应用管理列表里支持计算节点详情

计算该节点资源占比,需要统计该节点上每个Pod的资源使用,与该节点全部可分配资源做差后再比。

测试用:
curl -XPOST -H "Authorization":"433b2c4f-87d5-44a2-89b1-352bed33d48b" -d "{\"orgId\":\"1\"}" localhost:8080/api/v1/nodes/172.21.1.11
