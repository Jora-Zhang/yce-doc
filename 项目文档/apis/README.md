<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

容器云对外API定义(第一版)
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-29
修订说明: 添加了数据源文件相关文档

目录
--------------
### [控制台Dashboard](dashboard/dashboard.md)

* [资源统计](dashboard/resources.md)
* [应用统计](dashboard/deployments.md)
* [操作统计](dashboard/operations.md)

### [数据中心Datacenter](10.151.30.223/liyao.miao/yce-backend/tree/datacenter)

* [检查重名](datacenter/check.md)
* [添加组织](datacenter/create.md)
* [初始化创建](datacenter/init.md)
* [更新组织](datacenter/update.md)
* [删除组织](datacenter/delete.md)
* [管理组织列表](datacenter/list.md)

### [应用Deployment](10.151.30.223/liyao.miao/yce-backend/tree/deploy)

* [检查重名](deploy/check.md)
* [发布应用](deploy/create.md)
* [删除应用](deploy/delete.md)
* [应用详情](deploy/describe.md)
* [发布历史](deploy/history.md)
* [镜像搜索辅助](deploy/image.md)
* [初始化创建](deploy/init.md)
* [应用日志](deploy/log.md)
* [应用回滚](deploy/rollback.md)
* [滚动升级](deploy/rollingupdate.md)
* [扩容](deploy/scale.md)

### [绿色通道](10.151.30.223/liyao.miao/yce-backend/tree/EasyAccess)

* [绿色通道](EasyAccess/easyaccess.md)

### [错误Error](10.151.30.223/liyao.miao/yce-backend/tree/error)

* [错误码](error/error.md)

### [镜像image](10.151.30.223/liyao.miao/yce-backend/tree/image)

* [镜像](image/list.md)

### [日志log](10.151.30.223/liyao.miao/yce-backend/tree/log)

* [日志处理](log/log.md)

### [登录login](10.151.30.223/liyao.miao/yce-backend/tree/login)

* [登录](login/README.md)

### [注销logout](10.151.30.223/liyao.miao/yce-backend/tree/logout)

* [注销](logout/README.md)

### [组织namespace](10.151.30.223/liyao.miao/yce-backend/tree/namespace)

* [检查重名](namespace/check.md)
* [创建组织](namespace/create.md)
* [删除组织](namespace/delete.md)
* [创建初始化](namespace/init.md)
* [组织列表](namespace/list.md)
* [更新组织](namespace/update.md)

### [导航栏navList](10.151.30.223/liyao.miao/yce-backend/tree/navList)

* [导航栏](navList/README.md)

### [开放端口nodePort](10.151.30.223/liyao.miao/yce-backend/tree/NodePort)

* [检查重复](NodePort/check.md)
* [添加端口](NodePort/create.md)
* [端口列表](NodePort/list.md)

### [个人中心personal](10.151.30.223/liyao.miao/yce-backend/tree/personal)

### [镜像仓库registry](10.151.30.223/liyao.miao/yce-backend/tree/registry)

* [镜像仓库](registry/README.md)

### [服务及访问点service_endpoint](10.151.30.223/liyao.miao/yce-backend/tree/service_endpoint)

* [检查重名](service_endpoint/check_service%26endpoint.md)
* [创建访问点](service_endpoint/create_endpoint.md)
* [创建服务](service_endpoint/create_service.md)
* [删除服务](service_endpoint/delete_service.md)
* [删除访问点](service_endpoint/delete_endpoints.md)
* [服务列表](service_endpoint/extensions.md)
* [初始化访问点创建](service_endpoint/init_endpoint.md)
* [初始化服务创建](service_endpoint/init_service.md)

### [拓扑topoloty](10.151.30.223/liyao.miao/yce-backend/tree/topology)

* [应用拓扑](topology/README.md)

### [用户user](10.151.30.223/liyao.miao/yce-backend/tree/user)

* [创建用户](user/create.md)
* [检查重名](user/check.md)
* [删除用户](user/delete.md)
* [初始化创建](user/init.md)
* [用户列表](user/list.md)
* [更新用户](user/update.md)
* [检查旧密码](user/checkpassword.md)
* [普通用户更新密码](user/selfupdate.md)

### [模板template](10.151.30.223/liyao.miao/yce-backend/tree/template)

* [创建模板](template/create.md)
* [检查重名](template/check.md)
* [模板列表](template/list.md)
* [更新模板](template/update.md)
* [删除模板](template/delete.md)

### [中间件](10.151.30.223/liyao.miao/yce-backend/tree/middleware)

* [输入JSON校验](middleware/validation.md)

### [校验](10.151.30.223/liyao.miao/yce-backend/tree/validation)

* [校验](validation/validation.md)

### [数据源文件](10.151.30.223/liyao.miao/yce-backend/tree/master/datasource)

* [重名校验](datasource/check.md)
* [创建](datasource/create.md)
* [删除](datasource/delete.md)
* [列表](datasource/list.md)
* [详情](datasource/describe.md)
* [更新](datasource/update.md)

简要是用在发布应用时的列表：
* [简要](datasource/brief.md)


### 以下为旧版本, 无效///////////////////////////////////////////////////

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

####修改请谨慎

容器云对外API定义(第一版)
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-29

目录
--------------
### [控制台Dashboard](dashboard/dashboard.md)

* [资源统计](dashboard/resources.md)
* [应用统计](dashboard/deployments.md)
* [操作统计](dashboard/operations.md)

### [数据中心Datacenter](10.151.30.223/liyao.miao/yce-backend/tree/datacenter)

* [检查重名](datacenter/check.md) 
* [添加组织](datacenter/create.md)
* [初始化创建](datacenter/init.md)
* [更新组织](datacenter/update.md)
* [删除组织](datacenter/delete.md)
* [管理组织列表](datacenter/list.md)

### [应用Deployment](10.151.30.223/liyao.miao/yce-backend/tree/deploy)

* [检查重名](deploy/check.md)
* [发布应用](deploy/create.md)
* [删除应用](deploy/delete.md)
* [应用详情](deploy/describe.md)
* [发布历史](deploy/history.md)
* [镜像搜索辅助](deploy/image.md)
* [初始化创建](deploy/init.md)
* [应用日志](deploy/log.md)
* [应用回滚](deploy/rollback.md)
* [滚动升级](deploy/rollingupdate.md)
* [扩容](deploy/scale.md)

### [绿色通道](10.151.30.223/liyao.miao/yce-backend/tree/EasyAccess)

* [绿色通道](EasyAccess/easyaccess.md)

### [错误Error](10.151.30.223/liyao.miao/yce-backend/tree/error)

* [错误码](error/error.md)

### [镜像image](10.151.30.223/liyao.miao/yce-backend/tree/image)

* [镜像](image/list.md)

### [日志log](10.151.30.223/liyao.miao/yce-backend/tree/log)

* [日志处理](log/log.md)

### [登录login](10.151.30.223/liyao.miao/yce-backend/tree/login)

* [登录](login/README.md)

### [注销logout](10.151.30.223/liyao.miao/yce-backend/tree/logout)

* [注销](logout/README.md)

### [组织namespace](10.151.30.223/liyao.miao/yce-backend/tree/namespace)

* [检查重名](namespace/check.md)
* [创建组织](namespace/create.md)
* [删除组织](namespace/delete.md)
* [创建初始化](namespace/init.md)
* [组织列表](namespace/list.md)
* [更新组织](namespace/update.md)

### [导航栏navList](10.151.30.223/liyao.miao/yce-backend/tree/navList)

* [导航栏](navList/README.md)

### [开放端口nodePort](10.151.30.223/liyao.miao/yce-backend/tree/NodePort)

* [检查重复](NodePort/check.md)
* [添加端口](NodePort/create.md)
* [端口列表](NodePort/list.md)

### [个人中心personal](10.151.30.223/liyao.miao/yce-backend/tree/personal)

### [镜像仓库registry](10.151.30.223/liyao.miao/yce-backend/tree/registry)

* [镜像仓库](registry/README.md)

### [服务及访问点service_endpoint](10.151.30.223/liyao.miao/yce-backend/tree/service_endpoint)

* [检查重名](service_endpoint/check_service%26endpoint.md)
* [创建访问点](service_endpoint/create_endpoint.md)
* [创建服务](service_endpoint/create_service.md)
* [删除服务](service_endpoint/delete_service.md)
* [删除访问点](service_endpoint/delete_endpoints.md)
* [服务列表](service_endpoint/extensions.md)
* [初始化访问点创建](service_endpoint/init_endpoint.md)
* [初始化服务创建](service_endpoint/init_service.md)

### [拓扑topoloty](10.151.30.223/liyao.miao/yce-backend/tree/topology)

* [应用拓扑](topology/README.md)

### [用户user](10.151.30.223/liyao.miao/yce-backend/tree/user)

* [创建用户](user/create.md)
* [检查重名](user/check.md)
* [删除用户](user/delete.md)
* [初始化创建](user/init.md)
* [用户列表](user/list.md)
* [更新用户](user/update.md)
* [检查旧密码](user/checkpassword.md)
* [普通用户更新密码](user/selfupdate.md)

### [模板template](10.151.30.223/liyao.miao/yce-backend/tree/template)

* [创建模板](template/create.md)
* [检查重名](template/check.md)
* [模板列表](template/list.md)
* [更新模板](template/update.md)
* [删除模板](template/delete.md)

### [中间件](10.151.30.223/liyao.miao/yce-backend/tree/middleware)

* [输入JSON校验](middleware/validation.md)

### [校验](10.151.30.223/liyao.miao/yce-backend/tree/validation)

* [校验](validation/validation.md)

### 以下为旧版本, 无效///////////////////////////////////////////////////

容器云对外API定义(第一版)
==========================================================

### 组织
----------------------------------------------------------

#### 新建组织

```bash
POST /api/v1/organizations/  
```

#### 查询组织

查询列表:

```bash
GET /api/v1/organizations/
```

查询具体某个组织的细节
```bash
GET /api/v1/organizations/{orgId}
```

#### 修改某个组织

```bash
POST /api/v1/organizations/{orgId}

```

#### 查询某个组织下有关联的数据中心
```bash
GET /api/v1/organizations/{orgId}/datacenters
```

#### 删除某个组织

```bash
DELETE /api/v1/organizations/{orgId}
```

### 用户
----------------------------------------------------------

#### 新建用户

```bash
POST /api/v1/organizations/{orgId}/users
```

#### 查询用户: 用户名使用email, 不允许重复

查询用户列表

```bash
GET /api/v1/organizations/{orgId}/users
```

查询某个用户的信息

```bash
GET /api/v1/organizations/{orgId}/users/{userId}
```

#### 修改某个用户

```bash
POST /api/v1/organizations/{orgId}/users/{userId}
```

#### 删除某个用户

```bash
DELETE /api/v1/organizations/{orgId}/users/{userId}
```

登录

```bash
POST /api/v1/users/login
```

登出

```bash
POST /api/v1/users/{userId}/logout
```

修改密码

```bash
POST /api/v1/user/{userId}/password
```

### 数据中心表
----------------------------------------------------------

#### 新建数据中心

```bash
POST /api/v1/datacenters
```

#### 查询数据中心

查询数据中心列表

```bash
GET /api/v1/datacenters/
```

查询某个数据中心细节

```bash
GET /api/v1/datacenters/{dcId}
```

#### 修改某个数据中心

```bash
POST /api/v1/datacenters/{dcId}
```

#### 删除某个数据中心

```bash
DELETE /api/v1/datacenters/{dcId}
```


### 配额标准
----------------------------------------------------------

#### 新建配额标准

```bash
POST /api/v1/quotas/
```

#### 查询现有配额标准

查询现有配额列表

```bash
GET /api/v1/quotas/
```

查询现有某个配额的细节

```bash
GET /api/v1/quotas/{id}
```

#### 修改某个配额标准

```bash
POST /api/v1/quotas/{id}
```

#### 删除某个配额标准

```bash
DELETE /api/v1/quotas/{id}
```

### 数据中心配额: 某个组织在某个数据中心有多少配额
----------------------------------------------------------

#### 新建数据中心配额

```bash
POST /api/v1/organizations/{orgId}/dcquotas/
```

#### 查询某个组织下的配额列表(包括所关联的数据中心)

```bash
GET /api/v1/organizations/{orgId}/dcquotas/
```

#### 查询某个组织下的配额的详细信息

```bash
GET /api/v1/organizations/{orgId}/dcquotas/{id}
```

#### 修改某个组织下的某个配额的信息

```bash
POST /api/v1/organizations/{orgId}/dcquotas/{id}
```

#### 删除某个组织下的某个配额

```bash
DELETE /api/v1/organizations/{orgId}/dcquotas/{id}
```

### 云盘
----------------------------------------------------------

#### 新建云盘

```bash
POST /api/v1/organizations/{orgId}/rbds/
```

#### 查看云盘

查询列表:

```bash
GET /api/v1/organizations/{orgId}/rbds/
```

查询某个云盘的细节

```bash
GET /api/v1/organizations/{orgId}/rbds/{id}
```

#### 修改某个云盘的细节

```bash
POST /api/v1/organizations/{orgId}/rbds/{id}  //主要应用场景是云盘的扩容
```

#### 删除某个云盘

```bash
DELETE /api/v1/organizations/{orgId}/rbds/{id}
```

### 发布操作记录
----------------------------------------------------------

#### 新建发布操作

```bash
POST /api/v1/organizations/{orgId}/users/{userId}/deployments
```

#### 查询过去的发布操作(倒序)

查询列表:

```bash
GET /api/v1/organizations/{id}/users/{userId}/deployments
```

查询详细信息

```bash
GET /api/v1/organizations/{id}/users/{userId}/deployments
```


**发布操作表没有删除和修改操作,只能读取和追加.**


### 镜像
----------------------------------------------------------

#### 查询仓库里的镜像

查询列表：

```bash
GET /api/v1/registry/images
```
*暂时不按组织做租户*

### 搜索
----------------------------------------------------------

应用管理全文搜索：

```bash
POST /api/v1/search/deployments
```

*在应用管理页面支持按关键词搜索*
