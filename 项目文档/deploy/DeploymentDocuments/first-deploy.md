###  YCE部署说明

#### 需要环境：

1. Kubernetes集群
2. MySQL
3. Redis
4. Docker镜像仓库及证书（img.reg.3g解析）
5. 同步镜像脚本（非必须）
6. 同步镜像Agent（非必须）

其中MySQL以裸Docker运行并挂卷。Redis根据json/yaml文件发布在Kubernetes命名空间yce下。

#### 步骤：

1. 准备用来部署redis的json/yaml文件（应用和服务）
2. 准备用来部署yce的json/yaml文件（应用和服务），其中需要确认环境变量：数据库地址DB_HOST、数据库用户DB_USER、数据库密码DB_PASS、数据库名DB_NAME、REDIS地址REDIS_HOST、是否QA环境QA、同步镜像AGENT地址SIAGENTHOST、同步镜像AGENT端口SIAGENTPORT
3. 在Kubernetes集群上创建命名空间yce
4. 依次创建redis和yce的应用和服务
5. 启动MySQL，并执行初始化SQL脚本
6. 以管理员身份登录系统创建组织和普通用户
7. 完成

#### 数据库初始表说明

* 包含了必须的表结构及初始值
|表名|说明|初始值|
|:--:|:--:|:--:|
|datacenter|数据中心|部署Kubernetes的基本信息(部署前要手动填)|
|quota|应用配额|4个不同的配额|
|deployment|应用操作记录||
|nodeport|nodeport|当前数据中心未被占用的端口30000~32767，以及被占用的32080端口|
|organization|组织|yce组织|
|template|模板||
|user|用户|admin用户|
|datasource|数据源||
|datasourcedeployment|数据源应用映射||
|option|应用操作类型，未用||
|quota|集群配额，未用||
|rbd|RBD配置，未用||


#### 备注：

* 命名空间yce的配额可以由管理员点击修改组织-选择配额-提交进行，也可以自行创建。


