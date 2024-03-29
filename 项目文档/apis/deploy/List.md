<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

管理应用列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-08

目录
--------------
### 目的
用户查看所有的应用列表

### 请求

* 请求方法: GET 
* 请求URL: /api/v1/organizations/{orgId}/users/{userId}/deployments
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数: 


###页面设计 
列表显示:

根据应用列表页面的设计，要显示的信息及相关说明如下：

|项目：      |  数据源：| 说明: |
|:---------:|:-------:|:----:|
|ID         |  数字，为页面显示ID| |
|应用名称    |  data[].deploymentName | |
|应用实例    |  data[].podList.items[].metadata.name| |
|当前状态    |  data[].podList.items[].status.phase | |
|对应服务    |  data[].service.metadata.name | 支持详情(内容同服务管理里服务详情), 如果没有service.metadata.name则显示N/A,此时不显示详情。|
|计算节点    |  data[].podList.items[].status.hostIP | 支持详情(暂时不做) |
|数据中心    |  data[].dcName | 需要为中文|
|发布人员    |  data[].userName | |


###程序实现逻辑:

```Sequence
Title: 发布应用
YCE-->>K8s: 遍历数据中心
YCE<<--K8s: 得到应用列表 
YCE<<--YCE: 拼接、排序
```

###响应数据结构: 
返回码为0, 表示操作成功。
其他返回码表示出错。
JSON
```json
{
  "code": 0,
  "message": "操作成功",
  "data": [
        {
          "userName": "liyao.miao",
          "dcName": "办公网",
          "dcId": 1,
          "deploymentName": "xxx",   // 2st priority
          "updateTime": "xxx",       // 1nd priority
          "deployment": {
            "metadata": {
              "name": "test",
              "namespace": "dev"
            }
          },
          "podList": {
            "items": [
              {
                "metadata": {
                  "name": "test-335239156-2ycqw",
                  "namespace": "dev"
                }
              }
            ]
          },
          "service": {
            "metadata": {
              "name": "testapp-svc",
              "namespace": "dev"
            }
          }
        }
      ]
}
```

### 备注
对于不可用的数据中心,不显示其应用
对于不可用的数据中心设置访问超时时间，超时则不显示其数据，并返回连接数据中心超时
应用列表是排序后的结果，按照时间(逆序)第一、应用名(字母序)第二排序



### 以下为旧版本, 无效///////////////////////////////////////////////////

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

管理应用列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-01-01

目录
--------------
###目的
用户查看所有的应用列表

###请求

* 请求方法: GET 
* 请求URL: /api/v1/organizations/{orgId}/users/{userId}/deployments
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 


###页面设计 
列表显示:

根据应用列表页面的设计，要显示的信息及相关说明如下：

|项目：      |  数据源：| 说明: |
|:---------:|:-------:|:----:|
|ID         |  数字，为页面显示ID| |
|应用名称    |  data[].deployments[].deploy.metadata.name | |
|应用实例    |  data[].deployments[].podList.items[].metadata.name| |
|当前状态    |  data[].deployments[].podList.items[].status.phase | |
|对应服务    |  data[].deployments[].service.metadata.name | 支持详情(内容同服务管理里服务详情), 如果没有service.metadata.name则显示N/A,此时不显示详情。|
|计算节点    |  data[].deployments[].podList.items[].status.hostIP | 支持详情(暂时不做) |
|数据中心    |  data[].dcName | 需要为中文|
|发布人员    |  data[].deployments[].userName | |


###程序实现逻辑:

```Sequence
Title: 发布应用
YCE-->>MySQL: 根据orgId确定dcId
YCE<<--MySQL: 返回请求结果
YCE-->>K8s: 发布Deployment
YCE--<<K8s: 返回发布结果
```

###响应数据结构: 
返回码为0, 表示操作成功。
其他返回码表示出错。
JSON
```json
{
    "code": 0,
    "message": "操作成功",
    "data": [
        {
            "dcId": 1,
            "dcName": "办公网",
            "deployments": [
                {
                    "userName": "liyao.miao",
                    "deploy": {
                        "metadata": {
                            "name": "test",
                            "namespace": "dev",
                            "creationTimestamp": "2016-12-20T08: 14: 23Z",
                            "labels": {
                                "aaa": "zzz",
                                "author": "liyao.miao",
                                "name": "test",
                                "version": "v3.0"
                            }
                        },
                        "spec": {
                            "replicas": 1,
                            "template": {
                                "metadata": {
                                    "labels": {
                                        "aaa": "zzz",
                                        "author": "liyao.miao",
                                        "name": "test",
                                        "version": "v3.0"
                                    }
                                },
                                "spec": {
                                    "volumes": [
                                        {
                                            "name": "mingc",
                                            "hostPath": {
                                                "path": "wenjian"
                                            }
                                        },
                                        {
                                            "name": "mingchen",
                                            "hostPath": {
                                                "path": "wenjianwenjain"
                                            }
                                        }
                                    ],
                                    "containers": [
                                        {
                                            "name": "test",
                                            "image": "img.reg.3g: 15000/busybox:v3.0",
                                            "resources": {
                                                "limits": {
                                                    "cpu": "2",
                                                    "memory": "4G"
                                                }
                                            },
                                            "volumeMounts": [
                                                {
                                                    "name": "mingc",
                                                    "readOnly": true,
                                                    "mountPath": "mulu"
                                                },
                                                {
                                                    "name": "mingchen",
                                                    "readOnly": true,
                                                    "mountPath": "muluulu"
                                                }
                                            ],
                                            "livenessProbe": {
                                                "httpGet": {
                                                    "path": "url",
                                                    "port": 11111,
                                                    "scheme": "HTTP"
                                                },
                                                "initialDelaySeconds": 33333,
                                                "periodSeconds": 22222
                                            },
                                            "lifecycle": {
                                                "postStart": {
                                                    "exec": {
                                                        "command": [
                                                            "dada1"
                                                        ]
                                                    }
                                                }
                                            }
                                        }
                                    ]
                                }
                            }
                        }
                    },
                    "podList": {
                        "items": [
                              {
                                "metadata": {
                                    "name": "test-335239156-2ycqw",
                                    "namespace": "dev",
                                    "creationTimestamp": "2016-12-20T08: 14: 23Z",
                                    "labels": {
                                        "aaa": "zzz",
                                        "author": "liyao.miao",
                                        "name": "test",
                                        "pod-template-hash": "335239156",
                                        "version": "v3.0"
                                    }
                                }, // metadata
                                "spec": {
                                    "volumes": [
                                        {
                                            "name": "mingc",
                                            "hostPath": {
                                                "path": "wenjian"
                                            }
                                        },
                                        {
                                            "name": "mingchen",
                                            "hostPath": {
                                                "path": "wenjianwenjain"
                                            }
                                        }
                                    ],
                                    "containers": [
                                        {
                                            "name": "test",
                                            "image": "img.reg.3g: 15000/busybox: v3.0",
                                            "resources": {
                                                "limits": {
                                                    "cpu": "2",
                                                    "memory": "4G"
                                                },
                                                "requests": {
                                                    "cpu": "2",
                                                    "memory": "4G"
                                                }
                                            },
                                            "volumeMounts": [
                                                {
                                                    "name": "mingc",
                                                    "readOnly": true,
                                                    "mountPath": "mulu"
                                                },
                                                {
                                                    "name": "mingchen",
                                                    "readOnly": true,
                                                    "mountPath": "muluulu"
                                                }
                                            ],
                                            "livenessProbe": {
                                                "httpGet": {
                                                    "path": "url",
                                                    "port": 11111,
                                                    "scheme": "HTTP"
                                                },
                                                "initialDelaySeconds": 33333,
                                                "periodSeconds": 22222
                                            },
                                            "lifecycle": {
                                                "postStart": {
                                                    "exec": {
                                                        "command": [
                                                            "dada1"
                                                        ]
                                                    }
                                                }
                                            }
                                        }
                                    ]
                                }, // spec
                                "status": {
                                    "phase": "Pending",
                                    "hostIP": "172.21.1.11",
                                    "podIP": "10.0.46.24",
                                    "startTime": "2016-12-20T08: 14: 23Z"
                                } // status
                              } // podList.items
                        ] // podList.items[]
                    } // podList
                },
                "service": 
                  {
                      "metadata": {
                          "name": "testapp-svc",
                          "namespace": "dev",
                          "selfLink": "/api/v1/namespaces/dev/services/testapp-svc",
                          "uid": "6224128f-    c69e-11e6-977e-44a84240716a",
                          "resourceVersion": "54629741",
                          "creationTimestamp": "2016-12-20T10:23:43Z",
                          "labels": {
                              "author": "liyao.miao",
                              "name": "testapp-svc",
                              "type": "service"
                          }
                      },
                      "spec": {
                          "type": "ClusterIP",
                          "ports": [
                              {
                                  "name": "name1",
                                  "protocol": "TCP",
                                  "port": 8080,
                                  "targetPort": 8080,
                                  "nodePort": 0
                              }
                          ],
                          "selector": {
                              "name": "testapp"
                          },
                          "clusterIP": "192.168.3.120",
                          "sessionAffinity": "None"
                      },
                      "status": {
                          "loadBalancer": {}
                      }
                  } 
            ]
        }
    ]
}
```

### 备注
对于不可用的数据中心,不显示其应用




### 以下为旧版本, 无效///////////////////////////////////////////////////

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

管理应用列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-21

目录
--------------
###目的
用户查看所有的应用列表

###请求

* 请求方法: GET 
* 请求URL: /api/v1/organizations/{orgId}/users/{userId}/deployments
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 


###页面设计 
列表显示:

根据应用列表页面的设计，要显示的信息及相关说明如下：

|项目：      |  数据源：| 说明: |
|:---------:|:-------:|:----:|
|ID         |  数字，为页面显示ID| |
|应用名称    |  data[].deployments[].deploy.metadata.name | |
|应用实例    |  data[].deployments[].podList.items[].metadata.name| |
|当前状态    |  data[].deployments[].podList.items[].status.phase | |
|对应服务    |  data[].deployments[].service.metadata.name | 支持详情(内容同服务管理里服务详情), 如果没有service.metadata.name则显示N/A,此时不显示详情。|
|计算节点    |  data[].deployments[].podList.items[].status.hostIP | 支持详情(暂时不做) |
|数据中心    |  data[].dcName | 需要为中文|
|发布人员    |  data[].deployments[].userName | |


###程序实现逻辑:

```Sequence
Title: 发布应用
YCE-->>MySQL: 根据orgId确定dcId
YCE<<--MySQL: 返回请求结果
YCE-->>K8s: 发布Deployment
YCE--<<K8s: 返回发布结果
```

###响应数据结构: 
返回码为0, 表示操作成功。
其他返回码表示出错。
JSON
```json
{
    "code": 0,
    "message": "操作成功",
    "data": [
        {
            "dcId": 1,
            "dcName": "办公网",
            "deployments": [
                {
                    "userName": "liyao.miao",
                    "deploy": {
                        "metadata": {
                            "name": "test",
                            "namespace": "dev",
                            "creationTimestamp": "2016-12-20T08: 14: 23Z",
                            "labels": {
                                "aaa": "zzz",
                                "author": "liyao.miao",
                                "name": "test",
                                "version": "v3.0"
                            }
                        },
                        "spec": {
                            "replicas": 1,
                            "template": {
                                "metadata": {
                                    "labels": {
                                        "aaa": "zzz",
                                        "author": "liyao.miao",
                                        "name": "test",
                                        "version": "v3.0"
                                    }
                                },
                                "spec": {
                                    "volumes": [
                                        {
                                            "name": "mingc",
                                            "hostPath": {
                                                "path": "wenjian"
                                            }
                                        },
                                        {
                                            "name": "mingchen",
                                            "hostPath": {
                                                "path": "wenjianwenjain"
                                            }
                                        }
                                    ],
                                    "containers": [
                                        {
                                            "name": "test",
                                            "image": "img.reg.3g: 15000/busybox:v3.0",
                                            "resources": {
                                                "limits": {
                                                    "cpu": "2",
                                                    "memory": "4G"
                                                }
                                            },
                                            "volumeMounts": [
                                                {
                                                    "name": "mingc",
                                                    "readOnly": true,
                                                    "mountPath": "mulu"
                                                },
                                                {
                                                    "name": "mingchen",
                                                    "readOnly": true,
                                                    "mountPath": "muluulu"
                                                }
                                            ],
                                            "livenessProbe": {
                                                "httpGet": {
                                                    "path": "url",
                                                    "port": 11111,
                                                    "scheme": "HTTP"
                                                },
                                                "initialDelaySeconds": 33333,
                                                "periodSeconds": 22222
                                            },
                                            "lifecycle": {
                                                "postStart": {
                                                    "exec": {
                                                        "command": [
                                                            "dada1"
                                                        ]
                                                    }
                                                }
                                            }
                                        }
                                    ]
                                }
                            }
                        }
                    },
                    "podList": {
                        "items": [
                              {
                                "metadata": {
                                    "name": "test-335239156-2ycqw",
                                    "namespace": "dev",
                                    "creationTimestamp": "2016-12-20T08: 14: 23Z",
                                    "labels": {
                                        "aaa": "zzz",
                                        "author": "liyao.miao",
                                        "name": "test",
                                        "pod-template-hash": "335239156",
                                        "version": "v3.0"
                                    }
                                }, // metadata
                                "spec": {
                                    "volumes": [
                                        {
                                            "name": "mingc",
                                            "hostPath": {
                                                "path": "wenjian"
                                            }
                                        },
                                        {
                                            "name": "mingchen",
                                            "hostPath": {
                                                "path": "wenjianwenjain"
                                            }
                                        }
                                    ],
                                    "containers": [
                                        {
                                            "name": "test",
                                            "image": "img.reg.3g: 15000/busybox: v3.0",
                                            "resources": {
                                                "limits": {
                                                    "cpu": "2",
                                                    "memory": "4G"
                                                },
                                                "requests": {
                                                    "cpu": "2",
                                                    "memory": "4G"
                                                }
                                            },
                                            "volumeMounts": [
                                                {
                                                    "name": "mingc",
                                                    "readOnly": true,
                                                    "mountPath": "mulu"
                                                },
                                                {
                                                    "name": "mingchen",
                                                    "readOnly": true,
                                                    "mountPath": "muluulu"
                                                }
                                            ],
                                            "livenessProbe": {
                                                "httpGet": {
                                                    "path": "url",
                                                    "port": 11111,
                                                    "scheme": "HTTP"
                                                },
                                                "initialDelaySeconds": 33333,
                                                "periodSeconds": 22222
                                            },
                                            "lifecycle": {
                                                "postStart": {
                                                    "exec": {
                                                        "command": [
                                                            "dada1"
                                                        ]
                                                    }
                                                }
                                            }
                                        }
                                    ]
                                }, // spec
                                "status": {
                                    "phase": "Pending",
                                    "hostIP": "172.21.1.11",
                                    "podIP": "10.0.46.24",
                                    "startTime": "2016-12-20T08: 14: 23Z"
                                } // status
                              } // podList.items
                        ] // podList.items[]
                    } // podList
                },
                "service": 
                  {
                      "metadata": {
                          "name": "testapp-svc",
                          "namespace": "dev",
                          "selfLink": "/api/v1/namespaces/dev/services/testapp-svc",
                          "uid": "6224128f-    c69e-11e6-977e-44a84240716a",
                          "resourceVersion": "54629741",
                          "creationTimestamp": "2016-12-20T10:23:43Z",
                          "labels": {
                              "author": "liyao.miao",
                              "name": "testapp-svc",
                              "type": "service"
                          }
                      },
                      "spec": {
                          "type": "ClusterIP",
                          "ports": [
                              {
                                  "name": "name1",
                                  "protocol": "TCP",
                                  "port": 8080,
                                  "targetPort": 8080,
                                  "nodePort": 0
                              }
                          ],
                          "selector": {
                              "name": "testapp"
                          },
                          "clusterIP": "192.168.3.120",
                          "sessionAffinity": "None"
                      },
                      "status": {
                          "loadBalancer": {}
                      }
                  } 
            ]
        }
    ]
}
```

### 备注
对于不可用的数据中心,不显示其应用





20161220

JSON
```json
{
  "kind": "PodList",
  "apiVersion": "v1",
  "metadata": {
    "selfLink": "/api/v1/namespaces/ops/pods",
    "resourceVersion": "16266621"
  },
  "items": [
    {
      "metadata": {
        "name": "nginx-test-1252813378-39wjk",
        "generateName": "nginx-test-1252813378-",
        "namespace": "ops",
        "selfLink": "/api/v1/namespaces/ops/pods/nginx-test-1252813378-39wjk",
        "uid": "217b98e7-64ee-11e6-b957-44a84240716a",
        "resourceVersion": "16258268",
        "creationTimestamp": "2016-08-18T02:47:40Z",
        "labels": {
          "name": "spec-template-metadata-labels",
          "pod-template-hash": "1252813378"
        },
        "annotations": {
          "kubernetes.io/created-by": "{\"kind\":\"SerializedReference\",\"apiVersion\":\"v1\",\"reference\":{\"kind\":\"ReplicaSet\",\"namespace\":\"ops\",\"name\":\"nginx-test-1252813378\",\"uid\":\"2179503e-64ee-11e6-b957-44a84240716a\",\"apiVersion\":\"extensions\",\"resourceVersion\":\"16258237\"}}"
        }
      },
      "spec": {
        "volumes": [
          {
            "name": "default-token-jr2e0",
            "secret": {
              "secretName": "default-token-jr2e0"
            }
          }
        ],
        "containers": [
          {
            "name": "nginx-test",
            "image": "nginx:1.7.9",
            "resources": {},
            "volumeMounts": [
              {
                "name": "default-token-jr2e0",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "terminationMessagePath": "/dev/termination-log",
            "imagePullPolicy": "IfNotPresent"
          }
        ],
        "restartPolicy": "Always",
        "terminationGracePeriodSeconds": 30,
        "dnsPolicy": "ClusterFirst",
        "serviceAccountName": "default",
        "serviceAccount": "default",
        "nodeName": "172.21.1.21",
        "securityContext": {}
      },
      "status": {
        "phase": "Running",
        "conditions": [
          {
            "type": "Ready",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2016-08-18T02:47:41Z"
          }
        ],
        "hostIP": "172.21.1.21",
        "podIP": "10.0.62.3",
        "startTime": "2016-08-18T02:47:40Z",
        "containerStatuses": [
          {
            "name": "nginx-test",
            "state": {
              "running": {
                "startedAt": "2016-08-18T02:47:41Z"
              }
            },
            "lastState": {},
            "ready": true,
            "restartCount": 0,
            "image": "nginx:1.7.9",
            "imageID": "docker://sha256:84581e99d807a703c9c03bd1a31cd9621815155ac72a7365fd02311264512656",
            "containerID": "docker://0ac0b1d2e4bc085a1655049e7c251c056bffe05ec26b60523bd34fd590bcc472"
          }
        ]
      }
    }
    ]
}
    //还有一些省略了
```

|信息：      |  说明：|
|:------------:|:--------------:|
|ID          |  数字，为页面显示ID|
|应用名称    |  data[].deployments.deployList.items[i].metadata.name |
|应用实例    |  data[].deployments.podList.items[every].metadata.name
|标签组合    |  data[].deployments.deployList.items[i].metadata.labels |
|数据中心    |  data[].dcName, 需要为中文 |
|当前状态    |  data[].deployments.podList.items[every].status.phase, 需要为中文 |
|运行时长    |  data[].deployments.podList.items[every].metadata.creationTimestamp，需要转化为天、分、时、秒（一级） |

应用列表
===========

用户点击应用管理时请求后台数据:

请求的方法及URL: GET /api/v1/organizations/{orgId}/users/{userId}/deployments

请求头中包含: Authorization: ${sessionId} *暂时在Session Storage里*

返回值:

* 该组织下数据中心里的应用列表


```json
{
    "code":0,
    "message":[
        "OK"
    ],
    "data": [{
            "dcId": 1,
            "dcName": "bangongwang",
            //该数据中心下的应用列列表
            "deployments": [{
                userName: "xxx",
                //应用对应的deployment
                deployment[i]: {
                
                },
                //该deployment下的最新的ReplicaSet包含的PodList
                podList[every]: {
               
                },
                
            }]
    }]
}
```

返回json示例：

列表显示:

根据应用列表页面的设计，要显示的信息及相关说明如下：

|信息：      |  说明：|
|:------------:|:--------------:|
|ID          |  数字，为页面显示ID|
|应用名称    |  data[].deployments.deployList.items[i].metadata.name |
|应用实例    |  data[].deployments.podList.items[every].metadata.name
|标签组合    |  data[].deployments.deployList.items[i].metadata.labels |
|数据中心    |  data[].dcName, 需要为中文 |
|当前状态    |  data[].deployments.podList.items[every].status.phase, 需要为中文 |
|运行时长    |  data[].deployments.podList.items[every].metadata.creationTimestamp，需要转化为天、分、时、秒（一级） |


podList的json结构：

```json
{
  "kind": "PodList",
  "apiVersion": "v1",
  "metadata": {
    "selfLink": "/api/v1/namespaces/ops/pods",
    "resourceVersion": "16266621"
  },
  "items": [
    {
      "metadata": {
        "name": "nginx-test-1252813378-39wjk",
        "generateName": "nginx-test-1252813378-",
        "namespace": "ops",
        "selfLink": "/api/v1/namespaces/ops/pods/nginx-test-1252813378-39wjk",
        "uid": "217b98e7-64ee-11e6-b957-44a84240716a",
        "resourceVersion": "16258268",
        "creationTimestamp": "2016-08-18T02:47:40Z",
        "labels": {
          "name": "spec-template-metadata-labels",
          "pod-template-hash": "1252813378"
        },
        "annotations": {
          "kubernetes.io/created-by": "{\"kind\":\"SerializedReference\",\"apiVersion\":\"v1\",\"reference\":{\"kind\":\"ReplicaSet\",\"namespace\":\"ops\",\"name\":\"nginx-test-1252813378\",\"uid\":\"2179503e-64ee-11e6-b957-44a84240716a\",\"apiVersion\":\"extensions\",\"resourceVersion\":\"16258237\"}}"
        }
      },
      "spec": {
        "volumes": [
          {
            "name": "default-token-jr2e0",
            "secret": {
              "secretName": "default-token-jr2e0"
            }
          }
        ],
        "containers": [
          {
            "name": "nginx-test",
            "image": "nginx:1.7.9",
            "resources": {},
            "volumeMounts": [
              {
                "name": "default-token-jr2e0",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "terminationMessagePath": "/dev/termination-log",
            "imagePullPolicy": "IfNotPresent"
          }
        ],
        "restartPolicy": "Always",
        "terminationGracePeriodSeconds": 30,
        "dnsPolicy": "ClusterFirst",
        "serviceAccountName": "default",
        "serviceAccount": "default",
        "nodeName": "172.21.1.21",
        "securityContext": {}
      },
      "status": {
        "phase": "Running",
        "conditions": [
          {
            "type": "Ready",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2016-08-18T02:47:41Z"
          }
        ],
        "hostIP": "172.21.1.21",
        "podIP": "10.0.62.3",
        "startTime": "2016-08-18T02:47:40Z",
        "containerStatuses": [
          {
            "name": "nginx-test",
            "state": {
              "running": {
                "startedAt": "2016-08-18T02:47:41Z"
              }
            },
            "lastState": {},
            "ready": true,
            "restartCount": 0,
            "image": "nginx:1.7.9",
            "imageID": "docker://sha256:84581e99d807a703c9c03bd1a31cd9621815155ac72a7365fd02311264512656",
            "containerID": "docker://0ac0b1d2e4bc085a1655049e7c251c056bffe05ec26b60523bd34fd590bcc472"
          }
        ]
      }
    }
    ]
}
    //还有一些省略了
```

