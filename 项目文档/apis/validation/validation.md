<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

####修改请谨慎

校验
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-12-02

目录
--------------
###目的
对用户输入的值进行合法性校验

###请求

* 请求方法: 
* 请求URL:
* 请求头: 
* 请求参数: 



###页面设计 
无


###程序实现逻辑
收到请求后通过handler前的中间件进行处理。如果有合法,则不进行操作,跳转到handler。如果有不合法的值,将该值的出错信息返回。

###响应数据结构: 
都合法,不返回错误信息:

```json
{
  "code": 0,
  "message": "xxx",
  "data": "xxx",
}
```

```json
{
    "code": 1605,
    "message": "无效值",
    "data": {
        "errors": [
                "username must match the regex [a-z]*[.][a-z]*[-]?[0-9]*",
                "appname mush match the regex [ ] [ ] [ ]"
        ]
    }
}
```

```json
{
    "code": 1605,
    "message": "无效值",
    "data": {
        "errors": [
            "用户名格式应该类似: \"liyao.miao\" 或者 \"yong.li-1\", 长度应在 63 个字符之内.",
            "组织ID应该类似: \"1\" 或 \"10\", 长度为\" 或者 \"dev\", 长度为 63 个字符."
        ]
    }
}
```

有不合法,返回对应的错误信息集合: 
若JSON解析也失败,返回的结果为:
没有采用下列形式
```json
{
  {
      "code": 1600,
      "message": "Json序列化错误"
  }
} 
```
```json
{  
  {
      "code": 1605,
      "message": "无效值",
      "data": {
          "errors": [
              "应用名称(app): 无效值: 需要满足正则表达式: [a-z0-9]([-a-z0-9]*[a-z0-9])?(\\\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*, 名称应该类似: \\"my-name\\" 或者 \\"dev\\", 长度为63个字符.\\n",
              "组织名称: 无效值: 需要满足正则表达式: [a-z0-9]([-a-z0-9]*[a-z0-9])?, 名称应该类似: \\"my-name\\" 或者 \\"dev\\", 长度为63个字符.\\n",
              "数据中心列表不能为空",
              "应用名称(deployment): 无效值: 需要满足正则表达式: [a-z0-9]([-a-z0-9]*[a-z0-9])?(\\\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*, 名称应该类似: \\"my-name\\" 或者 \\"dev\\", 长度为63个字符.
               命名空间: 无效值: 需要满足正则表达式: [a-z0-9]([-a-z0-9]*[a-z0-9])?, 名称应该类似: \\"my-name\\" 或者 \\"dev\\", 长度为63个字符.\\n"
          ]
      }
  }

}
```

### 备注
无


```json
{
    "code": 1605,
    "message": "无效值",
    "data": {
        "errors": [
            {
                "code": 1605,
                "message": "无效值",
                "data": "must match the regex [a-z]*[.][a-z]*[-]?[0-9]*"
            }
        ]
    }
}
```
