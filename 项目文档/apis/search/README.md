
<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

应用管理页面的搜索功能
==============

作者: [lth2015](https://github.com/lth2015)

最后修订: 2017-03-01

目录
--------------
### 目的
用户可以在页面上通过关键词搜索自己所关心的应用，比如 在搜索框中输入想搜索的应用名称的部分字符，输入数据中心名称等...

### 请求

* 请求方法: 
* 请求URL: /api/v1/search/deployments
* 请求头: Authorization:$SessionId, 从LocalStorage读
* 请求参数: 
{
    "orgId": "1", // 组织id
    "keywords": "appname" // 关键词必须为一个单词，搜索框中初始提示为"应用名称"，前端需要trim掉空格和换行，而且单词中不能包含~!@#$%^&*()_+=-`等特殊字符
}


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
返回码为0, 表示操作成功，否则为出错。
Message内容如下，返回的结构跟应用列表
```json
{
  "code": 0,
  "message": "操作成功",
  "data": "[
        {
          \"userName\": \"liyao.miao\",
          \"dcName\": \"办公网\",
          \"dcId\": 1,
          \"deploymentName\": \"xxx\",   // 2st priority
          \"updateTime\": \"xxx\",       // 1nd priority
          \"deployment\": {
            \"metadata\": {
              \"name\": \"test\",
              \"namespace\": \"dev\"
            }
          },
          \"podList\": {
            \"items\": [
              {
                \"metadata\": {
                  \"name\": \"test-335239156-2ycqw\",
                  \"namespace\": \"dev\"
                }
              }
            ]
          },
          \"service\": {
            \"metadata\": {
              \"name\": \"testapp-svc\",
              \"namespace\": \"dev\"
            }
          }
        },
        {
          \"userName\": \"liyao.miao\",
          \"dcName\": \"办公网\",
          \"dcId\": 1,
          \"deploymentName\": \"xxx\",   // 2st priority
          \"updateTime\": \"xxx\",       // 1nd priority
          \"deployment\": {
            \"metadata\": {
              \"name\": \"test\",
              \"namespace\": \"dev\"
            }
          },
          \"podList\": {
            \"items\": [
              {
                \"metadata\": {
                  \"name\": \"test-335239156-2ycqw\",
                  \"namespace\": \"dev\"
                }
              }
            ]
          },
          \"service\": {
            \"metadata\": {
              \"name\": \"testapp-svc\",
              \"namespace\": \"dev\"
            }
          }
        },
    // ...
    ]"
```

### 备注
搜索框支持多关键字搜索，以空格分开多个关键词，结果集会把所有包含这些关键词的应用都返回回来。


