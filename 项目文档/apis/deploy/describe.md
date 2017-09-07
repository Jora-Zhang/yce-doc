<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

查看应用详情
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-08

目录
--------------
###目的
用户点击应用名可以查看到应用详情。这里的详情是实例的详情。

###请求

* 请求方法: 
* 请求URL: 
* 请求头: 
* 请求参数: 
    无

###页面设计 

分多个标签页:

详细信息/环境变量/标签组/健康检查/存储卷/日志

应用名称(deployment):
详细信息Tag:
    应用名称: data[].deployment.metadata.name
    组织名称: data[].deployment.metadata.namespace
    启动时间: data[].deployment.metadata.creationTimestamp
    镜像名称: data[].deployment.spec.containers[0].image
    升级策略: data[].deployment.spec.strategy.type
环境变量Tag: data[].deployment.spec.template.spec.containers[].env
选择器Tag: data[].deployment.spec.selector.matchLabels
标签组Tag: data[].deployment.metadata.labels

应用实例(pod):
详细信息Tag: 
	应用名称: data[].podList.items[].metadata.name 
	组织名称: data[].podList.items[].metadata.namespace 
	CPU资源: data[].podList.items[].spec.containers[0].resources.limits.cpu
	MEM资源: data[].podList.items[].spec.containers[0].resources.limits.mem
	启动时间: data[].podList.items[].metadata.creationTimestamp
	当前状态: data[].podList.items[].status.phase, 需要为中文 
	开放端口: data[].podList.items[].spec.ports[].containerPort
	镜像: data[].podList.items[].spec.containers[0].image
	节点IP: data[].podList.items[].status.hostIP   
	应用IP: data[].podList.items[].status.podIP   
	重启次数: data[].podList.items[].status.containerStatuses[0].restartCount   

环境变量Tag: data[].podList.items[].spec.containers[0].env
开放端口: 
    名称: data[].podList.items[].spec.containers[0].ports[$index].name
    端口: data[].podList.items[].spec.containers[0].ports[$index].containerPort
    协议: data[].podList.items[].spec.containers[0].ports[$index].protocol
标签组Tag: data[].podList.items[].spec.containers[0].metadata.labels
健康检查Tag: 
    URL: data[].podList.items[].spec.containers[0].livenessProbe.httpGet.path 
    Port: data[].podList.items[].spec.containers[0].livenessProbe.httpGet.port
    每隔: data[].podList.items[].spec.containers[0].livenessprobe.periodseconds
    生效时间: data[].podList.items[].spec.containers[0].livenessProbe.initialDelaySeconds
存储卷Tag: 
    名称: data[].podList.items[].spec.volumes[$index].name
    应用目录: data[].podList.items[].spec.containers[0].volumeMounts[$index].mountPath 
    宿主目录: data[].podList.items[].spec.volumes[$index].hostPath.path
    只读: data[].podList.items[].spec.containers[0].volumeMounts[$index].readOnly
启动准备: data[].podList.items[].spec.containers[0].lifecycle.postStart.exec.command[0]
优雅停止: data[].podList.items[].spec.containers[0].lifecycle.preStop.exec.command[0]
命令:
    命令: data[].podList.items[].spec.containers[0].command[0]
    参数: data[].podList.items[].spec.containers[0].args[0]
日志Tag: 同前

服务详情:
详细信息Tag:
    服务名称: data[].service.name
    类型: data[].service.spec.type
    组织名称: data[].service.namespace
    nodePort: data[].service.spec.ports[].port
    启动时间: data[].service.metadata.creationTimestamp
    ClusterIP: data[].service.spec.clusterIP
标签组Tag:
    data[].service.metadata.labels
端口组Tag:
    name: data[].service.spec.ports[].name
    protocol: data[].service.spec.ports[].protocol
    port: data[].service.spec.ports[].port
    targetPort: data[].service.spec.ports[].targetPort
    nodePort: data[].service.spec.ports[].nodePort

###程序实现逻辑:

```Sequence
Title: 查看应用详情
YCE-->>MySQL: 根据orgId请求获取orgName 
YCE<<--MySQL: 返回请求结果
YCE-->>K8s: 在对应的orgName命名空间里找到对应的deployment
YCE<<--K8s: 返回请求结果 
```

###响应数据结构: 
返回码为0, 表示操作成功。
其他返回码表示出错。

```json
{
    "code":0,
    "message":[
        "OK"
    ],
    "data": [{
            "dcId": 1,
            "dcName": "bangongwang",
            "podlist": {
                //该数据中心下的应用列列表，json为k8s原生[PodList](https://godoc.org/k8s.io/kubernetes/pkg/api#PodList)
            }
    }]
}
```

### 备注
应用管理列表的时候已经请求到了deployment的全部信息. 所以不需要通过本接口重复请求了。

### 以下为旧版本, 无效///////////////////////////////////////////////////



<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

查看应用详情
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-22

目录
--------------
###目的
用户点击应用名可以查看到应用详情。这里的详情是实例的详情。

###请求

* 请求方法: 
* 请求URL: 
* 请求头: 
* 请求参数: 
    无

###页面设计 

分多个标签页:

详细信息/环境变量/标签组/健康检查/存储卷/日志

应用名称(deployment):
详细信息: 同前
环境变量: deployments[].deploy.spec.template.spec.containers[].env
标签组: deployments[].deploy.metadata.labels


应用实例(pod):
详细信息Tag: 
	应用名称: deployments[].podList.items[].metadata.name 
	组织名称: deployments[].podList.items[].metadata.namespace 
	CPU资源: deployments[].podList.items[].spec.containers[0].resources.limits.cpu
	MEM资源: deployments[].podList.items[].spec.containers[0].resources.limits.mem
	启动时间: deployments[].podList.items[].metadata.creationTimestamp
	当前状态: deployments[].podList.items[].status.phase, 需要为中文 
	开放端口: deployments[].podList.items[].spec.ports[].containerPort
	镜像: deployments[].podList.items[].spec.containers[0].image
	节点IP: deployments[].podList.items[].status.hostIP   
	应用IP: deployments[].podList.items[].status.podIP   
	重启次数: deployments[].podList.items[].status.containerStatuses[0].restartCount   

环境变量Tag: deployments[].podList.items[].spec.containers[0].env
开放端口: 
    名称: deployments[].podList.items[].spec.containers[0].ports[$index].name
    端口: deployments[].podList.items[].spec.containers[0].ports[$index].containerPort
    协议: deployments[].podList.items[].spec.containers[0].ports[$index].protocol
标签组Tag: deployments[].podList.items[].spec.containers[0].metadata.labels
健康检查Tag: 
    URL: deployments[].podList.items[].spec.containers[0].livenessProbe.httpGet.path 
    Portdeployments[].podList.items[].spec.containers[0].livenessProbe.httpGet.port
    每隔:deployments[].podList.items[].spec.containers[0].livenessprobe.periodseconds
    生效时间deployments[].podList.items[].spec.containers[0].livenessProbe.initialDelaySeconds
存储卷Tag: 
    名称: deployments[].podList.items[].spec.volumes[$index].name
    应用目录: deployments[].podList.items[].spec.containers[0].volumeMounts[$index].mountPath 
    宿主目录: deployments[].podList.items[].spec.volumes[$index].hostPath.path
    只读: deployments[].podList.items[].spec.containers[0].volumeMounts[$index].readOnly
启动准备: deployments[].podList.items[].spec.containers[0].lifecycle.postStart.exec.command[0]
优雅停止: deployments[].podList.items[].spec.containers[0].lifecycle.preStop.exec.command[0]
命令:
    命令: deployments[].podList.items[].spec.containers[0].command[0]
    参数: deployments[].podList.items[].spec.containers[0].args[0]
日志Tag: 同前

###程序实现逻辑:

```Sequence
Title: 查看应用详情
YCE-->>MySQL: 根据orgId请求获取orgName 
YCE<<--MySQL: 返回请求结果
YCE-->>K8s: 在对应的orgName命名空间里找到对应的deployment
YCE<<--K8s: 返回请求结果 
```

###响应数据结构: 
返回码为0, 表示操作成功。
其他返回码表示出错。

```json
{
    "code":0,
    "message":[
        "OK"
    ],
    "data": [{
            "dcId": 1,
            "dcName": "bangongwang",
            "podlist": {
                //该数据中心下的应用列列表，json为k8s原生[PodList](https://godoc.org/k8s.io/kubernetes/pkg/api#PodList)
            }
    }]
}
```

### 备注
应用管理列表的时候已经请求到了deployment的全部信息. 所以不需要通过本接口重复请求了。

### 以下为旧版本, 无效///////////////////////////////////////////////////
应用详情
==============

用户点击应用名时弹窗显示应用详情:

请求的方法及URL: GET /api/v1/organizations/{orgId}/users/{uid}/deployments/{podId}

请求头中包含: Authorization: ${sessionId} *暂时在Session Storage里*

返回值:

* 该组织下数据中心里的应用列表

返回json示例：

```json
{
    "code":0,
    "message":[
        "OK"
    ],
    "data": [{
            "dcId": 1,
            "dcName": "bangongwang",
            "podlist": {
                //该数据中心下的应用列列表，json为k8s原生[PodList](https://godoc.org/k8s.io/kubernetes/pkg/api#PodList)
            }
    }]
}
```

应用详情是在应用列表的基础上，对里面的应用信息进一步筛选, 然后显示在弹窗里

根据应用详情页面的设计，要显示的信息及相关说明如下：

|信息：      |  说明：|
|:------------:|:--------------:|
|ID          |  数字，为页面显示ID|
|应用名称    |  data[].podList.items[].metadata.name |
|标签组合    |  data[].podList.items[].metadata.labels |
|数据中心    |  data[].dataCenter, 需要为中文 |
|当前状态    |  data[].podList.items[].status.phase, 需要为中文 |
|运行时长    |  data[].podList.items[].metadata.creationTimestamp，需要转化为天、分、时、秒（一级） |
|所属用户    |  data[].podList.items[].metadata.labels["maintainer"]  |
|所属组织    |  data[].podList.items[].metadata.labels["organzitions"]  |
|节点IP      | data[].podList.items[].status.hostIP  |
|应用IP      | data[].podList.items[].status.podIP  |
|镜像        | data[].podList.items[].status.containerStatuses.image  |
|重启次数    | data[].podList.items[].status.containerStatuses.restartCount  |
|云盘        |  -  |
