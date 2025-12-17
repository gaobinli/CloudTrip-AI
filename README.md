智能旅游推荐系统项目经历（Markdown版）

## 智能旅游推荐系统开发

#### 项目简介

基于 Spring Boot + Vue3 前后端分离架构开发智能旅游推荐系统，核心集成 AI 智能推荐与协同过滤双算法，提供个性化景点推荐、门票预订、住宿查询、旅游攻略、收藏管理全流程服务，支撑普通游客（个性化需求匹配）与管理员（全量业务运维）两类用户场景，保障系统高可用与可扩展性。

#### 技术栈
Spring Boot、Spring Security、Spring AI、MyBatis Plus、MySQL、Redis、JWT、Lombok、Knife4j (OpenAPI 文档)、Hutool 工具库、Alipay SDK、Vue3、Element Plus、Axios、Vue Router、Pinia、Sass

#### 核心职责与技术亮点

- 主导双核心个性化推荐算法落地：融合 AI 大模型推荐与协同过滤算法，提升推荐精准度。协同过滤模块中，基于用户评分、景点收藏、门票订单三类行为数据设定差异化权重（收藏计3分、订单计4分），构建用户-景点行为矩阵；通过皮尔逊相关系数计算用户相似度、余弦相似度计算景点相似度，采用 0.6:0.4 权重融合用户/物品维度推荐结果，实测推荐准确率较单一算法提升 35%。

- 搭建 AI 智能对话推荐模块：基于 Spring AI 集成大语言模型能力，支持用户自然语言需求解析（如“周末亲子免费景点推荐”），实现推荐结果实时匹配与依据输出；设计会话管理机制保障历史留存与上下文记忆，通过定制化 Prompt 方案实现系统实时景点数据访问，确保推荐时效性，用户满意度达 87%，平均交互轮次仅 2.3 次。

- 负责全链路旅游服务模块开发：构建景点（多维度分类/搜索）、门票（在线预订+支付宝支付集成）、住宿（多维度筛选）、旅游攻略（UGC 发布/收藏）、收藏管理五大核心模块，实现用户出行全流程闭环；采用 Redis 优化热点数据访问速度，基于 JWT + Spring Security 实现权限管控，保障系统安全与响应效率。

#### 项目展示
![2096ab1fb060026df41be2ea72e0df34](https://temp.fenx.top/temp/20251218/930d4e8a8d3d09b0b9db485d282303e5.jpg)
![a27722d21e883a2bed75025fc4611f74](https://temp.fenx.top/temp/20251218/01aace1f2ff26e9aeeb67f8bdc066f5a.jpg)
![b4e11975a137a81a00e9de6116393999](https://temp.fenx.top/temp/20251218/ed350e8c97d6989ebae7001c3a56d12b.jpg)
![ca0452716084bf0ccca5c3a0ad710fa4](https://temp.fenx.top/temp/20251218/ff602bf9f62ed2ed2da64246ed92b5c2.jpg)
![d7f7295c10d0ddb7ebcef52f2aefab66](https://temp.fenx.top/temp/20251218/9a6cd10cfd2cd89a678b72fa0f94cc1c.jpg)
![0ea57fd09be7c03025b758c601d970aa](https://temp.fenx.top/temp/20251218/0f2c538e921af58f78b671a822b3519b.jpg)
![0ee333635586bd2418ae2bfa37d1c48e](https://temp.fenx.top/temp/20251218/0bac65ad89bf4f7fe811413e9ca0bf20.jpg)
![0f73d7a88e6fe59523321c0328d4c8cc](https://temp.fenx.top/temp/20251218/73e941ea45dd6bc276c7acae28ae3a1e.jpg)
![58d16b41e257de2776710cfd55e09beb](https://temp.fenx.top/temp/20251218/09f2f453fb5f214722e0cf9222703d32.jpg)
