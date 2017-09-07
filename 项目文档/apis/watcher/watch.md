<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

Redis Cache
==============

作者: [liyao.miao](github.com/maxwell92)

最后修订: 2017-04-06 06:32:43
修订说明: 增加了缓存说明

目录
--------------

### 目的

通过缓存减少应用列表请求响应时间

### 请求

请求方法: 无
请求URL: 无
请求头: 无:无

请求参数: 无

### 页面设计

无
无


### 程序实现逻辑

应用列表的请求会先去缓存里找，查找失败再去k8s源里查找，通过k8s watcher将deployment service 和 pod的各种event推回来写到缓存里

### 响应数据结构:

无


### 备注

无




## ////// 以下为旧版本 弃用

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

运行Watcher
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2017-02-27

目录
--------------
### 目的
监视Kubernetes的资源变化，将结果返回给yce，yce处理后将结果交于Watcher，再由Watcher写入Cache
yce的检索search和列表list都去访问Cache获取


### 请求


### 页面设计


### 程序实现逻辑

```Title: Watcher
      Watcher<--Kubernetes
YCE<--Watcher
YCE-->Watcher
      Watcher-->Cache
YCE------------>Cache
YCE<------------Cache
```

### 响应数据结构:


### 备注
当前Watcher是集成在yce里面，所以先不对外开放REST API，只提供接口供调用
每个数据中心的命名空间一个watcher? 还是每个数据中心一个watcher?  如何区分?

