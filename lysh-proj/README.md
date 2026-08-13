# lysh-proj

基于 Spring Boot 3.x + JDBC + Druid + OceanBase/MySQL 的高基地业务管理系统骨架。

## 目录结构

- controller：控制层，提供 REST API
- service：业务服务层
- dao：数据访问层
- model：实体类
- config：数据源与配置类

## 已实现功能

- 基地基础信息新增、修改、删除、查询
- 基地审核接口
- 基于区县维度的查询能力
- Druid 数据源接入配置

## 启动方式

1. 确保本地或目标环境具备 Java 17+
2. 根据实际 OceanBase/MySQL 地址修改 application.yml
3. 执行：

```bash
mvn spring-boot:run
```

## 主要接口

- POST /api/site-info 创建基地信息
- PUT /api/site-info 修改基地信息
- DELETE /api/site-info/{siteId} 删除基地信息
- GET /api/site-info/{siteId} 查询单条基地信息
- GET /api/site-info/district/{districtName} 按区县查询
- POST /api/site-info/{siteId}/review 审核基地信息
