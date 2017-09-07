<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

NodePort占用列表
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-01

目录
--------------
###目的
为管理员列出所有被占用的NodePort. 被占用的含义是该nodePort在数据库表中的记录存在且status为OCCUPIED.

###请求

* 请求方法: GET
* 请求URL: /api/v1/nodeports
* 请求头: Authorization:$SessionId, 从LocalStorage读 
* 请求参数: 无

###页面设计 
管理页面样式(参考应用管理). 显示表头: ID, NodePort, 数据中心, 服务名称, 创建时间, 其中:

* ID: id, 按序生成
* NodePort: data.nodePorts[0].port
* 数据中心: 根据data.nodePorts[0].dcId 在data.dcList[]里找对应数据中心的名字
* 服务名称: data.nodePorts[0].svcName
* 创建时间: data.nodePorts[0].modifiedAt 
* 创建者: 根据data.nodePorts[0].modifiedOp 在data.users[]里找对应的用户名

###程序实现逻辑:

```Sequence
Title: NodePort占用列表
YCE-->>MySQL: 查询status为OCCUPIED的nodePort
YCE<<--MySQL: 返回查询结果
YCE-->>MySQL: 查询dcId对应的dcName
YCE<<--MySQL: 返回查询结果
```

说明: 收到GET请求, 去数据库里查询所有status为INVALID的nodePort,并查询dcId与dcName的对应关系, 两者共同作为结果返回

###响应数据结构: 

JSON, 示例如下:

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "nodePorts": [
            {
                "port": 32080,
                "dcId": 1,
                "svcName": "yce-svc",
                "status": 0,
                "createdAt": "2016-08-26T09: 40: 57+08: 00",
                "ModifiedAt": "2016-12-01T15: 57: 40+08: 00",
                "modifiedOp": 1,
                "comment": "yce-testservice"
            },
            {
                "port": 32080,
                "dcId": 2,
                "svcName": "yce-svc",
                "status": 0,
                "createdAt": "2016-12-01T15: 57: 40+08: 00",
                "ModifiedAt": "2016-12-01T15: 57: 40+08: 00",
                "modifiedOp": 1,
                "comment": ""
            }
        ],
        "dcList": {
            "1": "办公网",
            "2": "电信机房"
        },
        "users": {
            "1": "admin",
            "2": "tao.yu",
            "3": "bin.liu",
            "4": "yong.li-1",
            "5": "dawei.li",
            "6": "xueyan.xu",
            "7": "liyao.miao",
            "8": "hao.wu",
            "9": "test",
            "10": "rui.chen",
            "11": "cheng.li"
        }
    }
} 
```
### 备注
无
