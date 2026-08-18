# lysh-proj

基于 Spring Boot 3.x + JDBC + Druid + OceanBase/MySQL 的高基地业务管理系统骨架。

## 目录结构

- controller：控制层，提供 REST API
- service：业务服务层
- dao：数据访问层
- model：实体类
- config：数据源与配置类

## 已实现功能

- 高基地信息：单位完善/变更并提交区级审核，市区管理员免审维护
- 高基地申请材料：单位上传/修改/删除，管理端查看
- 基于区县、状态、单位维度的查询能力
- 高基地公告与企业白名单基础能力
- Druid 数据源接入配置

## 启动方式

1. 确保本地或目标环境具备 Java 17+
2. 根据实际 OceanBase/MySQL 地址修改 application.yml
3. 执行：

```bash
mvn spring-boot:run
```

## 主要接口

### 高基地信息

- POST /admin/site-info/create 市区管理员新增，免审核
- POST /admin/site-info/update 市区管理员修改，免审核
- POST /admin/site-info/delete?siteId= 删除高基地信息
- GET /admin/site-info/list 查询，支持 districtCode、status 过滤
- GET /admin/site-info/detail?siteId= 查询高基地信息详情
- POST /admin/site-info/review 区级审核，请求体 RecruitSiteInfoReviewReq
- POST /corp/site-info/create 单位新增，进入待审核
- POST /corp/site-info/update 单位修改，进入待审核
- GET /corp/site-info/mine?tyshxym= 查询本单位高基地信息

### 高基地申请材料

- GET /admin/site-apply-material/list?siteId= 管理端查看材料列表
- GET /admin/site-apply-material/detail?materialId= 管理端查看材料详情
- POST /admin/site-apply-material/delete?materialId= 管理端删除材料
- POST /corp/site-apply-material/create?tyshxym= 单位上传材料
- POST /corp/site-apply-material/update?tyshxym= 单位修改材料
- POST /corp/site-apply-material/delete?materialId=&tyshxym= 单位删除材料
- GET /corp/site-apply-material/list?siteId=&tyshxym= 单位查看材料列表
- GET /corp/site-apply-material/detail?materialId=&tyshxym= 单位查看材料详情

### 文件上传

- POST /admin/file-upload/upload 管理端上传文件，返回文件存储key
- POST /admin/file-upload/download 管理端按文件存储key下载
- POST /corp/file-upload/upload 企业端上传文件，返回文件存储key
- POST /corp/file-upload/download 企业端按文件存储key下载

文件统一上传到 `GJDbucket`。
