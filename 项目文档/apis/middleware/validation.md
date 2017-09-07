<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25"> 

#### 修改请谨慎

输入JSON校验
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-30

目录
--------------
### 目的
收到前端发来的请求后对请求进行有效性校验

### 请求

* 请求方法: 
* 请求URL:
* 请求头: 
* 请求参数: 


### 页面设计 
无


### 程序实现逻辑

```Title:输入JSON校验 
在每个router上配置相应资源的校验handler,每次收到请求时先去handler里进行校验
校验无误,提交后台执行
校验有误,拒绝提交,直接返回错误及错误原因
```

### 响应数据结构: 
无

### 备注
以每种POST过来的资源为对象,分别在声明类的时候定义对应的校验方法

