<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

#### 修改请谨慎

容器云对外API定义(第一版)
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-29
修订说明: 添加了数据源文件相关文档

目录
--------------
### [控制台Dashboard](doc/apis/dashboard/dashboard.md)

* [资源统计](doc/apis/dashboard/resources.md)
* [应用统计](doc/apis/dashboard/deployments.md)
* [操作统计](doc/apis/dashboard/operations.md)

### [数据中心Datacenter](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/datacenter)

* [检查重名](doc/apis/datacenter/check.md)
* [添加组织](doc/apis/datacenter/create.md)
* [初始化创建](doc/apis/datacenter/init.md)
* [更新组织](doc/apis/datacenter/update.md)
* [删除组织](doc/apis/datacenter/delete.md)
* [管理组织列表](doc/apis/datacenter/list.md)

### [应用Deployment](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/deploy)

* [检查重名](doc/apis/deploy/check.md)
* [发布应用](doc/apis/deploy/create.md)
* [删除应用](doc/apis/deploy/delete.md)
* [应用详情](doc/apis/deploy/describe.md)
* [发布历史](doc/apis/deploy/history.md)
* [镜像搜索辅助](doc/apis/deploy/image.md)
* [初始化创建](doc/apis/deploy/init.md)
* [应用日志](doc/apis/deploy/log.md)
* [应用回滚](doc/apis/deploy/rollback.md)
* [滚动升级](doc/apis/deploy/rollingupdate.md)
* [扩容](doc/apis/deploy/scale.md)

### [绿色通道](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/EasyAccess)

* [绿色通道](doc/apis/EasyAccess/easyaccess.md)

### [错误Error](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/error)

* [错误码](doc/apis/error/error.md)

### [镜像image](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/image)

* [镜像](doc/apis/image/list.md)

### [日志log](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/log)

* [日志处理](doc/apis/log/log.md)

### [登录login](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/login)

* [登录](doc/apis/login/README.md)

### [注销logout](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/logout)

* [注销](doc/apis/logout/README.md)

### [组织namespace](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/namespace)

* [检查重名](doc/apis/namespace/check.md)
* [创建组织](doc/apis/namespace/create.md)
* [删除组织](doc/apis/namespace/delete.md)
* [创建初始化](doc/apis/namespace/init.md)
* [组织列表](doc/apis/namespace/list.md)
* [更新组织](doc/apis/namespace/update.md)

### [导航栏navList](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/navList)

* [导航栏](doc/apis/navList/README.md)

### [开放端口nodePort](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/NodePort)

* [检查重复](doc/apis/NodePort/check.md)
* [添加端口](doc/apis/NodePort/create.md)
* [端口列表](doc/apis/NodePort/list.md)

### [个人中心personal](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/personal)

### [镜像仓库registry](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/registry)

* [镜像仓库](doc/apis/registry/README.md)

### [服务及访问点service_endpoint](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/service_endpoint)

* [检查重名](doc/apis/service_endpoint/check_service%26endpoint.md)
* [创建访问点](doc/apis/service_endpoint/create_endpoint.md)
* [创建服务](doc/apis/service_endpoint/create_service.md)
* [删除服务](doc/apis/service_endpoint/delete_service.md)
* [删除访问点](doc/apis/service_endpoint/delete_endpoints.md)
* [服务列表](doc/apis/service_endpoint/extensions.md)
* [初始化访问点创建](doc/apis/service_endpoint/init_endpoint.md)
* [初始化服务创建](doc/apis/service_endpoint/init_service.md)

### [拓扑topoloty](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/topology)

* [应用拓扑](doc/apis/topology/README.md)

### [用户user](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/user)

* [创建用户](doc/apis/user/create.md)
* [检查重名](doc/apis/user/check.md)
* [删除用户](doc/apis/user/delete.md)
* [初始化创建](doc/apis/user/init.md)
* [用户列表](doc/apis/user/list.md)
* [更新用户](doc/apis/user/update.md)
* [检查旧密码](doc/apis/user/checkpassword.md)
* [普通用户更新密码](doc/apis/user/selfupdate.md)

### [模板template](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/template)

* [创建模板](doc/apis/template/create.md)
* [检查重名](doc/apis/template/check.md)
* [模板列表](doc/apis/template/list.md)
* [更新模板](doc/apis/template/update.md)
* [删除模板](doc/apis/template/delete.md)

### [中间件](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/middleware)

* [输入JSON校验](doc/apis/middleware/validation.md)

### [校验](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/validation)

* [校验](doc/apis/validation/validation.md)

### [数据源文件](10.151.30.223/liyao.miao/yce-backend/tree/master/doc/apis/datasource)

* [重名校验](doc/apis/datasource/check.md)
* [创建](doc/apis/datasource/create.md)
* [删除](doc/apis/datasource/delete.md)
* [列表](doc/apis/datasource/list.md)
* [详情](doc/apis/datasource/describe.md)
* [更新](doc/apis/datasource/update.md)

简要是用在发布应用时的列表：
* [简要](doc/apis/datasource/brief.md)


### 以下为旧版本, 无效///////////////////////////////////////////////////

<img src="http://kubernetes.io/kubernetes/img/warning.png" alt="WARNING" width="25" height="25">

####修改请谨慎

容器云对外API定义(第一版)
==============

作者: [maxwell92](https://github.com/maxwell92)

最后修订: 2016-11-29

目录
--------------
### [控制台Dashboard](doc/apis/dashboard/dashboard.md)

* [资源统计](doc/apis/dashboard/resources.md)
* [应用统计](doc/apis/dashboard/deployments.md)
* [操作统计](doc/apis/dashboard/operations.md)

### [数据中心Datacenter](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/datacenter)

* [检查重名](doc/apis/datacenter/check.md) 
* [添加组织](doc/apis/datacenter/create.md)
* [初始化创建](doc/apis/datacenter/init.md)
* [更新组织](doc/apis/datacenter/update.md)
* [删除组织](doc/apis/datacenter/delete.md)
* [管理组织列表](doc/apis/datacenter/list.md)

### [应用Deployment](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/deploy)

* [检查重名](doc/apis/deploy/check.md)
* [发布应用](doc/apis/deploy/create.md)
* [删除应用](doc/apis/deploy/delete.md)
* [应用详情](doc/apis/deploy/describe.md)
* [发布历史](doc/apis/deploy/history.md)
* [镜像搜索辅助](doc/apis/deploy/image.md)
* [初始化创建](doc/apis/deploy/init.md)
* [应用日志](doc/apis/deploy/log.md)
* [应用回滚](doc/apis/deploy/rollback.md)
* [滚动升级](doc/apis/deploy/rollingupdate.md)
* [扩容](doc/apis/deploy/scale.md)

### [绿色通道](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/EasyAccess)

* [绿色通道](doc/apis/EasyAccess/easyaccess.md)

### [错误Error](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/error)

* [错误码](doc/apis/error/error.md)

### [镜像image](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/image)

* [镜像](doc/apis/image/list.md)

### [日志log](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/log)

* [日志处理](doc/apis/log/log.md)

### [登录login](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/login)

* [登录](doc/apis/login/README.md)

### [注销logout](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/logout)

* [注销](doc/apis/logout/README.md)

### [组织namespace](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/namespace)

* [检查重名](doc/apis/namespace/check.md)
* [创建组织](doc/apis/namespace/create.md)
* [删除组织](doc/apis/namespace/delete.md)
* [创建初始化](doc/apis/namespace/init.md)
* [组织列表](doc/apis/namespace/list.md)
* [更新组织](doc/apis/namespace/update.md)

### [导航栏navList](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/navList)

* [导航栏](doc/apis/navList/README.md)

### [开放端口nodePort](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/NodePort)

* [检查重复](doc/apis/NodePort/check.md)
* [添加端口](doc/apis/NodePort/create.md)
* [端口列表](doc/apis/NodePort/list.md)

### [个人中心personal](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/personal)

### [镜像仓库registry](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/registry)

* [镜像仓库](doc/apis/registry/README.md)

### [服务及访问点service_endpoint](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/service_endpoint)

* [检查重名](doc/apis/service_endpoint/check_service%26endpoint.md)
* [创建访问点](doc/apis/service_endpoint/create_endpoint.md)
* [创建服务](doc/apis/service_endpoint/create_service.md)
* [删除服务](doc/apis/service_endpoint/delete_service.md)
* [删除访问点](doc/apis/service_endpoint/delete_endpoints.md)
* [服务列表](doc/apis/service_endpoint/extensions.md)
* [初始化访问点创建](doc/apis/service_endpoint/init_endpoint.md)
* [初始化服务创建](doc/apis/service_endpoint/init_service.md)

### [拓扑topoloty](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/topology)

* [应用拓扑](doc/apis/topology/README.md)

### [用户user](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/user)

* [创建用户](doc/apis/user/create.md)
* [检查重名](doc/apis/user/check.md)
* [删除用户](doc/apis/user/delete.md)
* [初始化创建](doc/apis/user/init.md)
* [用户列表](doc/apis/user/list.md)
* [更新用户](doc/apis/user/update.md)
* [检查旧密码](doc/apis/user/checkpassword.md)
* [普通用户更新密码](doc/apis/user/selfupdate.md)

### [模板template](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/template)

* [创建模板](doc/apis/template/create.md)
* [检查重名](doc/apis/template/check.md)
* [模板列表](doc/apis/template/list.md)
* [更新模板](doc/apis/template/update.md)
* [删除模板](doc/apis/template/delete.md)

### [中间件](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/middleware)

* [输入JSON校验](doc/apis/middleware/validation.md)

### [校验](10.151.30.223/liyao.miao/yce-backend/tree/doc/apis/validation)

* [校验](doc/apis/validation/validation.md)

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
