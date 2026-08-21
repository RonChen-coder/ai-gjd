# 高基地项目编码规范（codestyle）

> 本规范依据 `excample` 目录中的示例代码整理，新代码需严格遵循。

## 1. 通用命名与框架约束

### 1.1 文件命名规则
- 所有业务文件必须以 `Recruit` 开头。
- 分层后缀：model 用 `RecruitXxx`，entity 用 `RecruitXxxEntity`，BPO 接口用 `RecruitXxxBPO`，实现类用 `RecruitXxxBPOImpl`。
- 控制器按使用方区分：`RecruitXxxAdminController`（市区管理员）、`RecruitXxxCorpController`（基地/单位）。

### 1.2 controller 层 URL 命名规范
- 市区管理员使用：URL 前缀默认 `/admin`。
- 基地/单位使用：URL 前缀默认 `/corp`。
- 接口尽量只使用 POST、GET；参数不要用 PathVariable 形式传参，使用 `@RequestBody` 或 `@RequestParam`。
- 列表接口统一返回 `AjaxResult.PAGE(pageResult)`。

### 1.3 方法命名
- 方法要求注释完整，说明用途、入参和返回值。
- 使用驼峰命名规则。

### 1.4 框架约束
- 禁止使用阿里的 FastJson。
- 日期类型统一使用 `java.util.Date`。
- 数据库操作使用内部框架 `DBUtils`、`QueryBuilder`，不手写 JdbcTemplate/MyBatis 等。

## 2. model 层写法

- 包名：`xxx.model`。
- 类必须实现 `com.wondersgroup.wdls.core.domain.vo.ValueObject` 接口。
- 纯 POJO：`private` 字段 + 无参构造（需要时可提供全参构造）+ getter/setter。
- 字段与 entity 字段一一对应，使用驼峰命名。
- 类注释说明模型用途或对应表。
- 列表查询请求模型（如 `RecruitXxxQueryReq`）必须携带 `PageParam pageParam` 用于分页。

示例（RecruitGJDFileModel）：

```java
public class RecruitGJDFileModel implements ValueObject {
    private String name;
    private byte[] bytes;
    private String contentType;

    public RecruitGJDFileModel() {
    }

    public RecruitGJDFileModel(String name, byte[] bytes, String contentType) {
        this.name = name;
        this.bytes = bytes;
        this.contentType = contentType;
    }

    // getter / setter
}
```

## 3. entity 层写法

- 包名：`xxx.entity`。
- 类加 `@Entity`、`@Table(name = "表名", schema = "WSBS")`，并实现 `ValueObject` 接口。
- 主键写法：`@Id` + `@GeneratedValue(generator = "SEQ_...")` + `@SequenceGenerator(...)` + `@Column(name = "xxx_id")`。
- 普通字段写法：`@Basic` + `@Column(name = "snake_case")`。
- 字段驼峰命名，日期用 `java.util.Date`，getter/setter 完整。
- 类注释说明对应的表名。

示例（RecruitSiteNoticeEntity）：

```java
@Entity
@Table(name = "RECRUIT_SITE_NOTICE", schema = "WSBS")
public class RecruitSiteNoticeEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_NOTICE")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_NOTICE", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_NOTICE")
    @Column(name = "notice_id")
    private Long noticeId;

    @Basic
    @Column(name = "notice_title")
    private String noticeTitle;

    // 其余字段与 getter/setter
}
```

## 4. 实现类（BPOImpl）写法

- 类加 `@Service`，实现 `RecruitXxxBPO` 接口，类注释说明业务职责。
- 用 `private static final String` 定义状态常量，用 `COLUMNS` 定义查询列名，查询禁止 `SELECT *`。
- 必填参数校验后抛 `BusinessException("xxx不能为空")`。
- 新增：`DBUtils.execSql("INSERT INTO wsbs.XXX ... VALUES (wsbs.SEQ_XXXX.NEXTVAL, ?, ...)", ...)`，插入后用 `DBUtils.getString("SELECT wsbs.SEQ_XXXX.CURRVAL FROM DUAL")` 回填主键。
- 修改：先 `findById` 查询旧数据，空字段用旧值兜底，更新 `updatedAt = new Date()` 后再执行 UPDATE。
- 查询：单条用 `DBUtils.get(...)`，多条用 `DBUtils.query(...)`，均传入 `COLUMNS` 和 `Entity.class`。
- 实体转模型使用私有 `toModel` / `toModels` 逐字段转换。
- 越权场景抛 `BusinessException("数据越权")` 或 `BusinessException("越权操作")`。
- 修改、审核等操作需要调用行为日志记录器（如 `BehaviorLogRecorder`），记录操作人、角色和字段前后值。

### 4.1 企业操作人获取

- 企业操作人统一通过 `ShrsContextUtils` 获取，禁止从前端入参读取：
  - `ShrsContextUtils.getOrganId()`：当前企业 cid。
  - `ShrsContextUtils.getOrganName()`：当前企业名称。
- 新增/修改时操作人字段直接取上下文，例如 `uploaderName = ShrsContextUtils.getOrganName()`、`uploaderId = ShrsContextUtils.getOrganId()`。
- 企业数据权限校验：`ShrsContextUtils.getOrganId()` 与请求 cid 或数据归属 cid 不一致时抛越权异常。

### 4.2 管理员操作获取

- 管理员操作人统一通过 `ShrsContextUtils` 获取：
  - `ShrsContextUtils.getUserId()`：当前登录管理员用户ID，用于审核人、创建人等。
  - `ShrsContextUtils.getDistrictCode()`：当前管理员属地区编码。
- `"00"` 表示市级管理员，可操作全部区数据；区级管理员只能操作本区数据，否则抛 `BusinessException("数据越权")`。
- 管理员行为日志角色写 `"管理员"` / `"区级管理员"`。

## 5. list 查询必须分页

- 所有列表查询禁止返回裸 `List`，统一返回 `PageResult<T>`。
- 请求模型携带 `PageParam pageParam`，为空时使用 `new PageParam()`。
- 使用 `QueryBuilder` 分页查询：

```java
PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteInfoList");
queryBuilder.parseFilter("tyshxym", req.getTyshxym());
queryBuilder.parseFilter("status", req.getStatus());
PageResult<RecruitSiteInfo> pageResult = queryBuilder.getPage(pageParam, RecruitSiteInfo.class);
```

- 控制器列表接口返回 `AjaxResult.PAGE(pageResult)`。
- 列表 SQL 配置在 `gjd.sql.xml` 对应 namespace 下，动态条件使用 `@字段{and a.字段 = :字段}` 或 like 写法，并带 `ORDER BY ... DESC`。
        
