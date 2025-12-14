/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : tourism_system_update

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 13/11/2025 17:56:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accommodation
-- ----------------------------
DROP TABLE IF EXISTS `accommodation`;
CREATE TABLE `accommodation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店/民宿/客栈等',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scenic_id` bigint NULL DEFAULT NULL COMMENT '关联景点ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price_range` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '价格区间',
  `star_level` decimal(2, 1) NULL DEFAULT NULL COMMENT '评分',
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片列表，JSON格式存储多张图片URL',
  `features` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特色服务',
  `distance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '距景点距离',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scenic_id`(`scenic_id` ASC) USING BTREE,
  CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic_spot` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accommodation
-- ----------------------------
INSERT INTO `accommodation` VALUES (1, '紫禁城皇家酒店', '酒店', '北京市东城区景山前街8号', 1, '紫禁城皇家酒店位于故宫博物院东侧，是一家五星级豪华酒店。酒店设计融合了中国传统皇家风格与现代奢华元素，为宾客提供极致的住宿体验。', '010-66180808', '1200-3800', 4.8, '/img/1748616500926.jpg', '[\r\n  {\"url\":\"/img/1748616500926.jpg\",\"isMain\":true},\r\n  {\"url\":\"/img/accommodation/room1.jpg\",\"isMain\":false},\r\n  {\"url\":\"/img/accommodation/room2.jpg\",\"isMain\":false},\r\n  {\"url\":\"/img/accommodation/facility1.jpg\",\"isMain\":false}\r\n]', '免费WiFi,24小时前台,室内游泳池,健身中心,中西餐厅', '500米', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (2, '北京四合院民宿', '民宿', '北京市东城区交道口南大街45号', 1, '传统北京四合院改造的精品民宿，保留了老北京的建筑特色和文化韵味，每个房间都有不同主题，体验京城老味道。', '010-65128765', '680-1280', 4.6, '/img/1748616665832.jpg', '[\r\n  {\"url\":\"/img/1748616665832.jpg\",\"isMain\":true},\r\n  {\"url\":\"/img/accommodation/courtyard1.jpg\",\"isMain\":false},\r\n  {\"url\":\"/img/accommodation/courtyard2.jpg\",\"isMain\":false}\r\n]', '免费早餐,传统茶艺体验,四合院文化讲解,自行车租赁', '1.2公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (3, '故宫青年旅舍', '青旅', '北京市东城区五四大街12号', 1, '位于故宫附近的经济实惠青年旅舍，干净整洁，是背包客和年轻游客的理想选择。提供多人间和独立房间选择。', '010-65223366', '120-380', 4.2, '/img/accommodation/gugong_hostel.jpg', '[{\"url\":\"/img/accommodation/gugong_hostel.jpg\",\"isMain\":true}]', '公共厨房,行李寄存,免费市区地图,旅游咨询服务', '1.5公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (4, '长城脚下的公社', '度假村', '北京市怀柔区慕田峪长城景区附近', 2, '坐落于慕田峪长城脚下的度假村，由废弃小学改建而成，保留了原有建筑风格，融入现代设计元素，提供独特的住宿体验。', '010-61626688', '1580-2980', 4.5, '/img/1748616775441.jpg', '[{\"url\":\"/img/1748616775441.jpg\",\"isMain\":true}]', '观景露台,特色餐厅,免费接送长城服务,文化体验活动', '1公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (5, '长城客栈', '客栈', '北京市怀柔区水长城路18号', 2, '传统北方风格的农家客栈，热情好客的主人，地道的北方农家菜，让您在长城脚下感受淳朴的民风。', '010-61618899', '450-680', 4.3, '/img/accommodation/changcheng_inn.jpg', '[{\"url\":\"/img/accommodation/changcheng_inn.jpg\",\"isMain\":true}]', '农家饭,烧烤,免费停车,登长城向导服务', '800米', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (6, '长城山水民宿', '民宿', '北京市怀柔区慕田峪村56号', 2, '依山而建的特色民宿，每个房间都能欣赏到长城美景，装修典雅温馨，融入当地文化元素。', '010-61657788', '780-1380', 5.0, '/img/1748616557730.jpg', '[{\"url\":\"/img/1762677786745.jpeg\",\"isMain\":false},{\"url\":\"/img/1748616557730.jpg\",\"isMain\":true},{\"url\":\"/img/1762677784644.jpeg\",\"isMain\":false},{\"url\":\"/img/1762677788994.jpg\",\"isMain\":false}]', '观景阳台,手工艺课程,长城摄影指导,采摘体验', '1.5公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (7, '西湖雅园酒店', '酒店', '浙江省杭州市西湖区杨公堤28号', 3, '位于杨公堤的高档酒店，落地窗可直接观赏西湖美景，中式庭院设计，结合现代设施，尽显江南雅致。', '0571-87982233', '1080-2580', 4.8, '/img/1748616523565.jpg', '[{\"url\":\"/img/1748616523565.jpg\",\"isMain\":true}]', '湖景房,私家花园,中式下午茶,游船服务,健身房', '200米', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (8, '西湖边的院子', '民宿', '浙江省杭州市西湖区满觉陇路120号', 3, '位于满觉陇的江南风格民宿，小桥流水，竹林环绕，安静雅致，适合放松身心。', '0571-86546789', '680-1280', 4.7, '/img/1748616596201.jpg', '[{\"url\":\"/img/1748616596201.jpg\",\"isMain\":true}]', '茶室,古琴演奏,插花课程,私家厨师,自行车租赁', '500米', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (9, '湖畔青年旅舍', '青旅', '浙江省杭州市西湖区北山街84号', 3, '临湖而建的文艺青旅，书香气息浓厚，聚集了各地文艺青年，常有读书会、音乐分享等活动。', '0571-85234567', '120-350', 4.4, '/img/accommodation/xihu_hostel.jpg', '[{\"url\":\"/img/accommodation/xihu_hostel.jpg\",\"isMain\":true}]', '共享图书角,音乐角落,公共厨房,自助洗衣房,免费WiFi', '800米', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (10, '黄山悦榕庄', '酒店', '安徽省黄山市黄山区温泉镇汤口镇新建中路18号', 4, '融合徽派建筑风格与现代奢华的度假酒店，提供极致住宿体验，拥有温泉SPA和多种休闲设施。', '0559-5586888', '1680-5800', 4.9, '/img/1748616463211.jpg', '[{\"url\":\"/img/1748616463211.jpg\",\"isMain\":true}]', '私人温泉,徽派餐厅,黄山观景台,户外泳池,SPA中心,免费登山向导', '3公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (11, '老街客栈', '客栈', '安徽省黄山市黄山区汤口镇老街45号', 4, '位于汤口古镇老街的传统徽派客栈，木质结构，雕花窗棂，充满历史韵味，提供温馨舒适的住宿环境。', '0559-5581234', '380-680', 4.5, '/img/1748616804380.jpg', '[{\"url\":\"/img/1748616804380.jpg\",\"isMain\":true}]', '徽派早餐,古法泡茶,登山物资租赁,旅游咨询,接站服务', '4.5公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (12, '云端小院', '民宿', '安徽省黄山市黄山区黟县西递村78号', 4, '坐落于黟县西递村的传统徽派民居，小院幽静，竹林环抱，远离喧嚣，尽享山间宁静。', '0559-5156677', '580-980', 4.6, '/img/1748616728373.jpg', '[{\"url\":\"/img/1748616728373.jpg\",\"isMain\":true}]', '徽州菜私房菜,手工艺课程,免费班车,茶室,医疗包', '15公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (13, '漓江山水间酒店', '酒店', '广西壮族自治区桂林市阳朔县阳朔西街23号', 5, '位于阳朔西街的精品酒店，依江而建，客房阳台直面漓江美景，现代中式装修，舒适典雅。', '0773-8821888', '880-1980', 4.7, '/img/1748616638950.jpg', '[{\"url\":\"/img/1748616638950.jpg\",\"isMain\":true}]', '漓江景观房,户外泳池,中西自助早餐,免费自行车,乐器演奏', '1公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (14, '阳朔田园农舍', '民宿', '广西壮族自治区桂林市阳朔县高田镇兴坪古镇56号', 5, '位于兴坪古镇的特色民宿，四周是广袤的田野和壮观的喀斯特地貌，远离城市喧嚣，回归自然生活。', '0773-8786543', '450-780', 4.5, '/img/accommodation/guilin_farmstay.jpg', '[{\"url\":\"/img/accommodation/guilin_farmstay.jpg\",\"isMain\":true}]', '农家饭,果园采摘,钓鱼,篝火晚会,民族歌舞表演', '5公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');
INSERT INTO `accommodation` VALUES (15, '桂林青舍', '青旅', '广西壮族自治区桂林市象山区正阳路6号', 5, '位于桂林市中心的现代化青年旅舍，交通便利，设施齐全，是背包客和自由行游客的理想选择。', '0773-2825678', '100-300', 4.3, '/img/accommodation/guilin_hostel.jpg', '[{\"url\":\"/img/accommodation/guilin_hostel.jpg\",\"isMain\":true}]', '免费早餐,旅游信息咨询,行李寄存,洗衣服务,共享厨房', '3公里', '2025-05-30 17:50:11', '2025-11-09 16:35:23');

-- ----------------------------
-- Table structure for accommodation_review
-- ----------------------------
DROP TABLE IF EXISTS `accommodation_review`;
CREATE TABLE `accommodation_review`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `accommodation_id` bigint NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `rating` decimal(2, 1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `accommodation_id`(`accommodation_id` ASC) USING BTREE,
  CONSTRAINT `accommodation_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accommodation_review_ibfk_2` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accommodation_review
-- ----------------------------
INSERT INTO `accommodation_review` VALUES (1, 2, 1, '酒店环境优雅，服务周到，距离故宫步行只需几分钟，地理位置非常好！房间宽敞明亮，中式装修很有特色，早餐种类丰富，体验感极佳。', 5.0, '2025-05-15 10:30:00');
INSERT INTO `accommodation_review` VALUES (2, 3, 1, '房间干净整洁，前台服务热情专业，唯一不足是价格稍高，但考虑到地理位置和服务质量，还是很值得的。', 4.5, '2025-05-16 14:20:00');
INSERT INTO `accommodation_review` VALUES (3, 4, 1, '住宿体验很好，尤其喜欢酒店的中式风格设计，与故宫的文化氛围相得益彰。泳池和健身房设施一流，晚上泡个澡很舒服！', 5.0, '2025-05-17 20:15:00');
INSERT INTO `accommodation_review` VALUES (4, 2, 4, '住在长城脚下的感觉太棒了！清晨推开窗就能看到蜿蜒的长城，景色壮观。度假村设施完善，工作人员服务态度很好，晚上参加了篝火party，很有意思。', 5.0, '2025-05-18 09:40:00');
INSERT INTO `accommodation_review` VALUES (5, 3, 4, '环境不错，但价格偏高，感觉性价比不是特别高。接送长城服务很方便，餐厅的食物味道不错，但选择不多。', 4.0, '2025-05-19 16:50:00');
INSERT INTO `accommodation_review` VALUES (6, 4, 7, '酒店位置绝佳，房间阳台直面西湖，景色美不胜收。早上醒来就能看到雾气缭绕的湖面，非常诗意。服务也很到位，工作人员热情有礼。', 5.0, '2025-05-20 11:25:00');
INSERT INTO `accommodation_review` VALUES (7, 2, 7, '西湖雅园是我住过最美的酒店之一，江南园林式的设计很有韵味，客房宽敞舒适，下午茶也很精致。唯一遗憾的是周末人太多，有点吵。', 4.5, '2025-05-21 13:10:00');
INSERT INTO `accommodation_review` VALUES (8, 3, 10, '酒店环境超出预期，温泉SPA非常享受，缓解了一天登山的疲劳。餐厅的徽州菜做得地道美味，服务员都很专业友善。', 5.0, '2025-05-22 19:20:00');
INSERT INTO `accommodation_review` VALUES (9, 4, 10, '设施一流，服务周到，但价格确实不便宜。不过登山前后住这里很值得，特别是私人温泉，泡完整个人都轻松了！', 4.5, '2025-05-23 21:35:00');
INSERT INTO `accommodation_review` VALUES (10, 2, 13, '酒店位置好，就在西街上，出行方便。房间阳台可以看到漓江和喀斯特山峰，风景如画。房间干净舒适，服务热情，值得推荐！', 4.5, '2025-05-24 10:40:00');
INSERT INTO `accommodation_review` VALUES (11, 3, 13, '整体体验不错，但房间隔音稍差，西街晚上比较热闹，对睡眠质量有些影响。不过风景确实很美，早餐也不错。', 4.0, '2025-05-25 12:30:00');
INSERT INTO `accommodation_review` VALUES (13, 2, 6, '1', 5.0, '2025-10-07 11:46:22');

-- ----------------------------
-- Table structure for ai_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `ai_chat_message`;
CREATE TABLE `ai_chat_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `session_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会话ID',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色：user-用户，assistant-AI助手',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_session_id`(`session_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_role`(`role` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI聊天消息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_chat_message
-- ----------------------------
INSERT INTO `ai_chat_message` VALUES (1, 'scenic-rec-2-1762843694968', 'user', '有什么适合周末游玩的景点？', '2025-11-11 14:48:16');
INSERT INTO `ai_chat_message` VALUES (2, 'scenic-rec-2-1762843694968', 'user', '有什么适合周末游玩的景点？', '2025-11-11 14:48:21');
INSERT INTO `ai_chat_message` VALUES (3, 'scenic-rec-2-1762843694968', 'assistant', '看起来系统在搜索景点时出现了一些问题。我可以为您推荐一些常见的适合周末游玩的景点类型，或者您是否有特定的偏好？例如：\n\n1. **自然风光**：适合放松心情，爬山、赏花、湖泊等。\n2. **历史文化**：适合喜欢博物馆、古迹的朋友。\n3. **亲子游**：适合带孩子去游乐园或动物园。\n4. **城市漫步**：适合在城市中逛特色街区或公园。\n\n您更倾向于哪种类型？或者您有其他具体需求吗？我可以根据您的需求重新为您推荐！', '2025-11-11 14:48:22');
INSERT INTO `ai_chat_message` VALUES (4, 'scenic-rec-2-1762843694968', 'user', '有什么适合周末游玩的景点？', '2025-11-11 14:48:24');
INSERT INTO `ai_chat_message` VALUES (5, 'scenic-rec-2-1762843694968', 'assistant', '为了给您推荐最适合周末游玩的景点，我需要了解一些更多的信息，以便更精准地满足您的需求：\n\n1. **您的偏好**：您更喜欢自然风光、历史文化、主题乐园，还是其他类型的景点？\n2. **预算范围**：您对门票或整体花费有没有预算限制？（例如免费、经济型、中高端）\n3. **出行方式**：您是自驾游还是乘坐公共交通？\n4. **地区偏好**：您是否有特别想去的地区或城市？\n\n如果您暂时没有明确的想法，我可以先为您推荐一些热门的周末短途景点作为参考。您觉得怎么样？', '2025-11-11 14:48:26');
INSERT INTO `ai_chat_message` VALUES (6, 'scenic-rec-2-1762843694968', 'assistant', '为了更好地为您推荐适合周末游玩的景点，我需要了解您的偏好和需求，比如：\n\n1. **类型**：您喜欢自然风光、历史文化、亲子活动，还是其他类型？\n2. **预算**：您对门票或整体花费有具体要求吗？\n3. **距离**：您希望去附近的城市还是远一点的地方？\n4. **特殊需求**：是否需要带宠物、无障碍设施等？\n\n如果您暂时没有明确的需求，我可以为您推荐一些热门的周末游玩景点，比如：\n\n- **自然类**：爬山、赏花、湖边散步。\n- **文化类**：博物馆、古镇。\n- **亲子类**：游乐园、动物园。\n\n您觉得如何？或者您有其他想法吗？', '2025-11-11 14:48:30');
INSERT INTO `ai_chat_message` VALUES (7, 'scenic-rec-2-1762843694968', 'user', '有什么适合周末游玩的景点？', '2025-11-11 14:49:16');
INSERT INTO `ai_chat_message` VALUES (8, 'scenic-rec-2-1762843694968', 'assistant', '为了给您推荐适合周末游玩的景点，我将根据常见的需求为您推荐一些热门的周末短途旅行选择。如果您有更具体的偏好，可以随时告诉我，我会进一步调整推荐！\n\n### 1. **自然风光类**\n- **推荐理由**：适合放松心情，享受大自然。\n- **景点示例**：\n  - **北京香山公园**：秋季红叶，适合爬山和徒步。\n  - **杭州西湖**：湖光山色，适合骑行和游船。\n  - **九寨沟**：四季皆美，适合摄影和徒步。\n\n### 2. **历史文化类**\n- **推荐理由**：适合喜欢探索历史和文化的游客。\n- **景点示例**：\n  - **西安兵马俑**：世界文化遗产，感受秦朝历史。\n  - **苏州园林**：江南古典园林的代表，适合慢游。\n  - **平遥古城**：保存完好的明清古城，适合漫步。\n\n### 3. **亲子活动类**\n- **推荐理由**：适合家庭出游，孩子喜欢。\n- **景点示例**：\n  - **上海迪士尼乐园**：主题乐园，适合全家游玩。\n  - **广州长隆野生动物园**：近距离接触动物，适合亲子互动。\n  - **常州恐龙园**：恐龙主题乐园，孩子的最爱。\n\n### 4. **城市休闲类**\n- **推荐理由**：适合轻松的城市短途游。\n- **景点示例**：\n  - **成都宽窄巷子**：特色街区，适合品尝美食和拍照。\n  - **重庆洪崖洞**：夜景迷人，适合逛吃逛喝。\n  - **厦门鼓浪屿**：文艺小岛，适合散步和打卡。\n\n### 实用建议\n- **时间安排**：周末两天建议选择1-2个景点，避免行程太赶。\n- **预算参考**：门票价格从免费到几百元不等，可根据需求选择。\n- **交通**：自驾或高铁都很方便，提前规划路线。\n\n如果您对某个景点感兴趣，或者想了解更详细的信息（如开放时间、具体价格等），可以告诉我，我会为您查询！', '2025-11-11 14:49:49');
INSERT INTO `ai_chat_message` VALUES (9, 'scenic-rec-2-1762843810368', 'user', '推荐一些免费的景点', '2025-11-11 14:51:48');
INSERT INTO `ai_chat_message` VALUES (10, 'scenic-rec-2-1762843810368', 'assistant', '看来系统在搜索免费景点时遇到了问题。我会重新尝试为您推荐一些免费的景点，并确保查询顺利进行。看起来系统在查询免费景点时遇到了一些问题，可能是缺少必要的关键词或参数。我会尝试调整查询方式，为您推荐一些免费的景点。\n\n稍等片刻，我再试一次。我注意到查询过程中出现了一些问题，似乎系统对某些参数的要求较为严格。为了更好地帮助您，我会尝试调整搜索条件，或者您可以告诉我您更具体的需求，比如：\n\n1. **地区偏好**：您想去哪个城市或地区？\n2. **景点类型**：自然风光、历史文化还是其他类型？\n3. **其他需求**：是否适合亲子游？是否需要无障碍设施？\n\n如果您暂时没有特别偏好，我也可以为您推荐一些全国范围内的免费景点！', '2025-11-11 14:52:12');
INSERT INTO `ai_chat_message` VALUES (11, 'scenic-rec-2-1762844027830', 'user', '想去看自然风光', '2025-11-11 14:53:50');
INSERT INTO `ai_chat_message` VALUES (12, 'scenic-rec-2-1762844027830', 'assistant', '看起来在搜索自然风光景点时出现了一些技术问题。我马上为您重新尝试获取相关景点！看来系统出现了一些技术问题，暂时无法通过关键词搜索景点。不过，我可以为您手动推荐一些自然风光类的景点。以下是一些不错的选择：\n\n1. **黄山**（安徽）\n   - **特色**：以奇松、怪石、云海、温泉四绝著称。\n   - **价格**：约190元（旺季）。\n   - **建议游玩时间**：1-2天。\n\n2. **九寨沟**（四川）\n   - **特色**：彩林、叠瀑、翠海、雪峰，被誉为“童话世界”。\n   - **价格**：约169元（旺季）。\n   - **建议游玩时间**：1-2天。\n\n3. **张家界国家森林公园**（湖南）\n   - **特色**：独特的石英砂岩峰林地貌，电影《阿凡达》取景地。\n   - **价格**：约228元（旺季）。\n   - **建议游玩时间**：2天。\n\n4. **桂林漓江**（广西）\n   - **特色**：山水甲天下，乘船游览如画的山水风光。\n   - **价格**：约210元（含船票）。\n   - **建议游玩时间**：1天。\n\n5. **青海湖**（青海）\n   - **特色**：中国最大的咸水湖，夏季油菜花盛开时尤为壮观。\n   - **价格**：免费（景区内部分景点需收费）。\n   - **建议游玩时间**：1天。\n\n如果您对某个景点感兴趣，或者有其他需求（比如预算、季节等），可以告诉我，我会为您提供更详细的建议！', '2025-11-11 14:54:06');
INSERT INTO `ai_chat_message` VALUES (13, 'scenic-rec-2-1762844389651', 'user', '想去看自然风光', '2025-11-11 14:59:51');
INSERT INTO `ai_chat_message` VALUES (14, 'scenic-rec-2-1762844389651', 'assistant', '看来直接搜索“自然风光”没有找到匹配的景点。我可以帮您查看有哪些可用的景点分类，或者您可以告诉我更具体的关键词、地区或预算，这样我可以为您更精准地推荐。您是否想了解景点分类？或者有其他偏好？', '2025-11-11 14:59:57');
INSERT INTO `ai_chat_message` VALUES (15, 'scenic-rec-2-1762844549982', 'user', '推荐一些免费的景点', '2025-11-11 15:02:31');
INSERT INTO `ai_chat_message` VALUES (16, 'scenic-rec-2-1762844549982', 'assistant', '为您找到一个免费的景点推荐：\n\n### 1. **西湖**\n- **📍 位置**：浙江省杭州市西湖区\n- **💰 门票**：免费\n- **🏷️ 分类**：自然风光\n- **⏰ 开放时间**：全天开放\n- **📝 简介**：西湖位于浙江省杭州市西面，是中国大陆首批国家重点风景名胜区之一，有“人间天堂”的美誉。\n\n如果您对西湖感兴趣，可以告诉我，我可以为您提供更详细的景点信息！或者您也可以告诉我其他需求，比如特定地区或类型的免费景点，我会继续为您推荐。', '2025-11-11 15:02:38');
INSERT INTO `ai_chat_message` VALUES (17, 'scenic-rec-2-1762844729409', 'user', '有什么适合周末游玩的景点？', '2025-11-11 15:05:30');
INSERT INTO `ai_chat_message` VALUES (18, 'scenic-rec-2-1762844729409', 'assistant', '看来需要更具体的信息来为您推荐适合周末游玩的景点。为了更好地帮助您，我想了解：\n\n1. **您偏好什么类型的景点？**（例如：自然风光、历史文化、主题乐园等）\n2. **您的预算是多少？**（免费、经济型、高端等）\n3. **您计划去哪里？**（具体城市或地区，或者不限地区）\n\n或者，我可以为您展示所有可选的景点分类，方便您选择感兴趣的类型。您觉得如何？', '2025-11-11 15:05:38');
INSERT INTO `ai_chat_message` VALUES (19, 'scenic-rec-2-1762844729409', 'user', '自然风光', '2025-11-11 15:05:48');
INSERT INTO `ai_chat_message` VALUES (20, 'scenic-rec-2-1762844729409', 'assistant', '好的！自然风光的景点非常适合周末放松身心。我会为您推荐一些风景优美、适合短途游玩的自然景点。请您稍等，我来查询一下相关信息。\r\n\r\n（正在搜索适合周末游玩的自然风光景点……）\r\n\r\n\r\n\0', '2025-11-11 15:05:51');
INSERT INTO `ai_chat_message` VALUES (21, 'scenic-rec-2-1762844877696', 'user', '想去看自然风光', '2025-11-11 15:08:00');
INSERT INTO `ai_chat_message` VALUES (22, 'scenic-rec-2-1762844877696', 'assistant', '目前没有找到直接匹配\"自然风光\"的景点，可能是关键词范围太广了。我可以帮您尝试以下方式：\n\n1. **细化关键词**：比如\"山水\"、\"湖泊\"、\"森林公园\"等。\n2. **按地区筛选**：您是否有想去的地方（如云南、四川等）？\n3. **查看所有分类**：我可以列出景点分类，帮您更精准地选择。\n\n您更倾向于哪种方式？或者有其他具体需求吗？', '2025-11-11 15:08:07');
INSERT INTO `ai_chat_message` VALUES (23, 'scenic-rec-2-1762844876976', 'user', '想去看自然风光', '2025-11-11 15:28:04');
INSERT INTO `ai_chat_message` VALUES (24, 'scenic-rec-2-1762844876976', 'assistant', '我为您找到一个非常适合欣赏自然风光的景点：\n\n### 1. **桂林山水**\n- **📍 位置**：广西壮族自治区桂林市象山区\n- **💰 门票**：120元\n- **⏰ 开放时间**：8:00-17:30\n- **📝 简介**：桂林山水以“山青、水秀、洞奇、石美”四大特点闻名，是漓江景区的精华所在，非常适合喜欢自然风光的游客。\n\n如果您对这个景点感兴趣，我可以为您提供更详细的信息，或者您也可以告诉我其他需求，比如预算、时间安排等，我可以为您推荐更多合适的景点！', '2025-11-11 15:28:21');

-- ----------------------------
-- Table structure for ai_chat_session
-- ----------------------------
DROP TABLE IF EXISTS `ai_chat_session`;
CREATE TABLE `ai_chat_session`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会话ID',
  `session_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会话唯一标识',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '新对话' COMMENT '会话标题',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `session_id`(`session_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_session_id`(`session_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI聊天会话表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_chat_session
-- ----------------------------
INSERT INTO `ai_chat_session` VALUES (1, 'scenic-rec-2-1762842758003', 2, 'AI景点推荐', '2025-11-11 14:32:38', '2025-11-11 14:32:38');
INSERT INTO `ai_chat_session` VALUES (2, 'scenic-rec-2-1762842857277', 2, 'AI景点推荐', '2025-11-11 14:34:17', '2025-11-11 14:34:17');
INSERT INTO `ai_chat_session` VALUES (3, 'scenic-rec-2-1762842938389', 2, 'AI景点推荐', '2025-11-11 14:35:38', '2025-11-11 14:35:38');
INSERT INTO `ai_chat_session` VALUES (4, 'scenic-rec-2-1762843102298', 2, 'AI景点推荐', '2025-11-11 14:38:22', '2025-11-11 14:38:22');
INSERT INTO `ai_chat_session` VALUES (5, 'scenic-rec-2-1762843154874', 2, 'AI景点推荐', '2025-11-11 14:39:15', '2025-11-11 14:39:15');
INSERT INTO `ai_chat_session` VALUES (6, 'scenic-rec-2-1762843185956', 2, 'AI景点推荐', '2025-11-11 14:39:46', '2025-11-11 14:39:46');
INSERT INTO `ai_chat_session` VALUES (7, 'scenic-rec-2-1762843207908', 2, 'AI景点推荐', '2025-11-11 14:40:08', '2025-11-11 14:40:08');
INSERT INTO `ai_chat_session` VALUES (8, 'scenic-rec-2-1762843222893', 2, 'AI景点推荐', '2025-11-11 14:40:23', '2025-11-11 14:40:23');
INSERT INTO `ai_chat_session` VALUES (9, 'scenic-rec-2-1762843694968', 2, 'AI景点推荐', '2025-11-11 14:48:15', '2025-11-11 14:49:49');
INSERT INTO `ai_chat_session` VALUES (10, 'scenic-rec-2-1762843810368', 2, 'AI景点推荐', '2025-11-11 14:50:10', '2025-11-11 14:52:12');
INSERT INTO `ai_chat_session` VALUES (11, 'scenic-rec-2-1762844027830', 2, 'AI景点推荐', '2025-11-11 14:53:48', '2025-11-11 14:54:06');
INSERT INTO `ai_chat_session` VALUES (12, 'scenic-rec-2-1762844389651', 2, 'AI景点推荐', '2025-11-11 14:59:50', '2025-11-11 14:59:57');
INSERT INTO `ai_chat_session` VALUES (13, 'scenic-rec-2-1762844549982', 2, 'AI景点推荐', '2025-11-11 15:02:30', '2025-11-11 15:02:38');
INSERT INTO `ai_chat_session` VALUES (14, 'scenic-rec-2-1762844729409', 2, 'AI景点推荐', '2025-11-11 15:05:29', '2025-11-11 15:05:51');
INSERT INTO `ai_chat_session` VALUES (15, 'scenic-rec-2-1762844876976', 2, 'AI景点推荐', '2025-11-11 15:07:57', '2025-11-11 15:28:21');
INSERT INTO `ai_chat_session` VALUES (16, 'scenic-rec-2-1762844877696', 2, 'AI景点推荐', '2025-11-11 15:07:58', '2025-11-11 15:08:07');
INSERT INTO `ai_chat_session` VALUES (17, 'scenic-rec-2-1762846315398', 2, 'AI景点推荐', '2025-11-11 15:31:55', '2025-11-11 15:31:55');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `guide_id` bigint NULL DEFAULT NULL COMMENT '攻略ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `guide_id`(`guide_id` ASC) USING BTREE,
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`guide_id`) REFERENCES `travel_guide` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (3, 3, 1, '2025-05-14 14:02:00');
INSERT INTO `collection` VALUES (4, 3, 4, '2025-05-14 14:03:00');
INSERT INTO `collection` VALUES (5, 4, 1, '2025-05-14 14:04:00');
INSERT INTO `collection` VALUES (6, 4, 2, '2025-05-14 14:05:00');
INSERT INTO `collection` VALUES (14, 6, 8, '2025-06-19 21:55:57');
INSERT INTO `collection` VALUES (18, 2, 4, '2025-06-22 14:05:14');
INSERT INTO `collection` VALUES (21, 2, 1, '2025-10-07 11:45:29');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `scenic_id` bigint NULL DEFAULT NULL COMMENT '景点ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `rating` int NULL DEFAULT NULL COMMENT '评分(1-5)',
  `likes` int NULL DEFAULT 0 COMMENT '点赞数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `scenic_id`(`scenic_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`scenic_id`) REFERENCES `scenic_spot` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2, 1, '故宫真的很壮观，历史感很强，值得一去！', 5, 15, '2025-05-14 12:00:00');
INSERT INTO `comment` VALUES (3, 4, 2, '长城很雄伟，爬起来有点累，但风景绝佳！', 5, 15, '2025-05-14 12:02:00');
INSERT INTO `comment` VALUES (4, 2, 3, '西湖真的名不虚传，太美了，而且免费开放。', 5, 20, '2025-05-14 12:03:00');
INSERT INTO `comment` VALUES (5, 3, 4, '黄山的日出非常壮观，住山上看日出是绝佳体验。', 5, 18, '2025-05-14 12:04:00');
INSERT INTO `comment` VALUES (6, 4, 5, '桂林山水甲天下，确实名不虚传！', 5, 26, '2025-05-14 12:05:00');
INSERT INTO `comment` VALUES (9, 8, 1, 'OK', 5, 1, '2025-06-20 21:37:16');
INSERT INTO `comment` VALUES (10, 8, 1, '111', 5, 2, '2025-06-20 21:45:45');

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `comment_id` bigint NULL DEFAULT NULL COMMENT '评论ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_comment`(`user_id` ASC, `comment_id` ASC) USING BTREE,
  INDEX `comment_id`(`comment_id` ASC) USING BTREE,
  CONSTRAINT `comment_like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_like_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论点赞关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES (9, 8, 10, '2025-06-20 21:45:47');
INSERT INTO `comment_like` VALUES (12, 2, 1, '2025-10-07 11:46:11');
INSERT INTO `comment_like` VALUES (13, 2, 9, '2025-10-07 11:46:13');
INSERT INTO `comment_like` VALUES (14, 2, 10, '2025-10-07 11:46:14');
INSERT INTO `comment_like` VALUES (15, 2, 6, '2025-11-09 20:28:05');

-- ----------------------------
-- Table structure for scenic_category
-- ----------------------------
DROP TABLE IF EXISTS `scenic_category`;
CREATE TABLE `scenic_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父分类ID，0表示一级分类',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序序号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景点分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scenic_category
-- ----------------------------
INSERT INTO `scenic_category` VALUES (1, '自然风光', '包括山水、湖泊、瀑布等自然景观', '/img/category/nature.png', 0, 1, '2025-05-29 15:31:47', '2025-05-29 15:31:47');
INSERT INTO `scenic_category` VALUES (2, '历史文化', '包括古迹、博物馆、历史遗址等', '/img/category/history.png', 0, 2, '2025-05-29 15:31:47', '2025-05-29 15:31:47');
INSERT INTO `scenic_category` VALUES (3, '主题公园', '各类主题乐园、游乐场等', '/img/category/theme.png', 0, 3, '2025-05-29 15:31:47', '2025-05-29 15:31:47');
INSERT INTO `scenic_category` VALUES (4, '城市地标', '城市中的标志性建筑和景点', '/img/category/landmark.png', 0, 4, '2025-05-29 15:31:47', '2025-05-29 15:31:47');
INSERT INTO `scenic_category` VALUES (5, '乡村民俗', '乡村风光、民俗文化体验地', '/img/category/rural.png', 0, 5, '2025-05-29 15:31:47', '2025-05-29 15:31:47');

-- ----------------------------
-- Table structure for scenic_collection
-- ----------------------------
DROP TABLE IF EXISTS `scenic_collection`;
CREATE TABLE `scenic_collection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `scenic_id` bigint NOT NULL COMMENT '景点ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_scenic`(`user_id` ASC, `scenic_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_scenic_id`(`scenic_id` ASC) USING BTREE,
  CONSTRAINT `scenic_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `scenic_collection_ibfk_2` FOREIGN KEY (`scenic_id`) REFERENCES `scenic_spot` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景点收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic_collection
-- ----------------------------
INSERT INTO `scenic_collection` VALUES (9, 6, 4, '2025-06-19 21:37:42');
INSERT INTO `scenic_collection` VALUES (10, 6, 1, '2025-06-19 21:38:51');
INSERT INTO `scenic_collection` VALUES (13, 2, 2, '2025-06-21 15:19:16');
INSERT INTO `scenic_collection` VALUES (14, 2, 3, '2025-06-21 15:19:19');
INSERT INTO `scenic_collection` VALUES (18, 2, 4, '2025-06-22 13:33:08');
INSERT INTO `scenic_collection` VALUES (23, 2, 5, '2025-11-11 00:04:48');

-- ----------------------------
-- Table structure for scenic_spot
-- ----------------------------
DROP TABLE IF EXISTS `scenic_spot`;
CREATE TABLE `scenic_spot`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '景点ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '景点描述',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地理位置',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '票价',
  `opening_hours` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开放时间',
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片URL',
  `image_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片列表，JSON格式存储，示例：[{\"url\":\"/img/scenic1.jpg\",\"isMain\":true},{\"url\":\"/img/scenic2.jpg\",\"isMain\":false}]',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `category_id` bigint NULL DEFAULT NULL COMMENT '分类ID',
  `longitude` decimal(10, 6) NULL DEFAULT NULL,
  `latitude` decimal(10, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景点信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scenic_spot
-- ----------------------------
INSERT INTO `scenic_spot` VALUES (1, '故宫博物院', '故宫博物院位于北京市中心，是明清两代的皇家宫殿，世界上现存规模最大、保存最为完整的木质结构古建筑之一。', '北京市 - 北京市 - 昌平区', 60.00, '8:30-17:00（周一闭馆）', '/img/1748616033437.jpg', NULL, '2025-05-14 11:00:00', '2025-06-21 22:18:07', 2, 116.397029, 39.917839);
INSERT INTO `scenic_spot` VALUES (2, '长城', '长城是中国古代的伟大防御工程，也是世界上最伟大的建筑之一，被列为世界文化遗产。', '北京市怀柔区', 45.00, '8:00-17:00', '/img/1748616061193.jpg', NULL, '2025-05-14 11:01:00', '2025-06-21 22:22:51', 2, 116.016802, 40.356188);
INSERT INTO `scenic_spot` VALUES (3, '西湖', '西湖位于浙江省杭州市西面，是中国大陆首批国家重点风景名胜区之一，有\"人间天堂\"的美誉。', '浙江省杭州市西湖区', 0.00, '全天开放', '/img/1748616086868.jpg', NULL, '2025-05-14 11:02:00', '2025-06-21 22:52:17', 1, 120.158818, 30.256583);
INSERT INTO `scenic_spot` VALUES (4, '黄山', '黄山位于安徽省南部，是中国十大名山之一，以奇松、怪石、云海、温泉\"四绝\"著称于世。', '安徽省黄山市', 190.00, '6:30-16:30', '/img/1748616133671.jpg', NULL, '2025-05-14 11:03:00', '2025-06-22 09:22:27', 1, 118.160164, 30.139322);
INSERT INTO `scenic_spot` VALUES (5, '桂林山水', '桂林山水是指桂林漓江景区的山水风光，以\"山青、水秀、洞奇、石美\"四大特点著称。', '广西壮族自治区 - 桂林市 - 象山区', 120.00, '8:00-17:30', '/img/1748616162313.jpg', '[{\"url\":\"/img/1748616162313.jpg\",\"isMain\":true},{\"url\":\"/img/1762788560242.jpeg\",\"isMain\":false},{\"url\":\"/img/1762788563440.jpg\",\"isMain\":false},{\"url\":\"/img/1762788567701.jpg\",\"isMain\":false}]', '2025-05-14 11:04:00', '2025-11-10 23:29:30', 1, 110.374276, 25.289384);
INSERT INTO `scenic_spot` VALUES (8, '兵马俑博物馆', '秦始皇兵马俑博物馆是世界上最大的地下军事博物馆，展示了秦朝的军事力量和古代工艺水平，被誉为\"世界第八大奇迹\"。', '陕西省西安市临潼区', 150.00, '8:30-17:00', '/img/1763008359254.jpeg', '[{\"url\":\"/img/1763008361276.jpeg\",\"isMain\":false},{\"url\":\"/img/1763008359254.jpeg\",\"isMain\":true}]', '2025-05-14 11:05:00', '2025-11-13 12:32:43', 2, 109.276764, 34.384027);
INSERT INTO `scenic_spot` VALUES (9, '大雁塔', '大雁塔是西安的标志性建筑，建于唐代，是一座四方形砖塔，塔内保存着佛教经典和艺术品。', '陕西省西安市雁塔区', 50.00, '9:00-17:00', '/img/1763008341186.jpeg', '[{\"url\":\"/img/1763008341186.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008344160.jpg\",\"isMain\":false}]', '2025-05-14 11:06:00', '2025-11-13 12:32:24', 2, 109.229861, 34.227286);
INSERT INTO `scenic_spot` VALUES (10, '张家界大峡谷', '张家界大峡谷以其独特的地质地貌、清澈的溪流和茂密的森林著称，是探险爱好者的天堂。', '湖南省张家界市永定区', 100.00, '8:00-17:00', '/img/scenic/zhangjiajie_canyon.jpg', NULL, '2025-05-14 11:07:00', '2025-05-14 11:07:00', 1, 110.479865, 29.117188);
INSERT INTO `scenic_spot` VALUES (11, '三亚亚龙湾', '亚龙湾是三亚最著名的海滨度假区，拥有洁白的沙滩、清澈的海水和丰富的水上活动。', '海南省三亚市吉阳区', 0.00, '全天开放', '/img/1763008326702.jpeg', '[{\"url\":\"/img/1763008326702.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008328458.jpeg\",\"isMain\":false}]', '2025-05-14 11:08:00', '2025-11-13 12:32:09', 1, 109.506127, 18.246722);
INSERT INTO `scenic_spot` VALUES (12, '鼓浪屿', '鼓浪屿是厦门的一个著名岛屿，以其独特的建筑风格、优美的自然风光和丰富的文化底蕴而闻名。', '福建省厦门市思明区', 50.00, '全天开放', '/img/1763008313529.jpeg', '[{\"url\":\"/img/1763008313529.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008315279.jpeg\",\"isMain\":false}]', '2025-05-14 11:09:00', '2025-11-13 12:31:56', 1, 118.058065, 24.447684);
INSERT INTO `scenic_spot` VALUES (13, '苏州园林', '苏州园林是中国古典园林的代表，以其精妙的设计、优美的景观和深厚的文化内涵而享誉世界。', '江苏省苏州市姑苏区', 70.00, '7:30-17:00', '/img/1763008296686.jpg', '[{\"url\":\"/img/1763008296686.jpg\",\"isMain\":true},{\"url\":\"/img/1763008298506.jpeg\",\"isMain\":false}]', '2025-05-14 11:10:00', '2025-11-13 12:31:39', 2, 120.595551, 31.298886);
INSERT INTO `scenic_spot` VALUES (14, '泰山', '泰山是中国五岳之首，以其雄伟的山势、悠久的历史和丰富的文化遗产而著称，是登山爱好者的圣地。', '山东省泰安市泰山区', 125.00, '6:00-18:00', '/img/1763008282952.jpeg', '[{\"url\":\"/img/1763008282952.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008285000.jpg\",\"isMain\":false}]', '2025-05-14 11:11:00', '2025-11-13 12:31:25', 1, 117.109255, 36.254434);
INSERT INTO `scenic_spot` VALUES (15, '九寨沟', '九寨沟以其独特的喀斯特地貌、五彩缤纷的湖泊和壮观的瀑布而闻名，被誉为\"人间仙境\"。', '四川省阿坝州九寨沟县', 220.00, '8:00-17:00', '/img/1763008255329.jpeg', '[{\"url\":\"/img/1763008255329.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008257387.jpg\",\"isMain\":false}]', '2025-05-14 11:12:00', '2025-11-13 12:31:03', 1, 104.041288, 33.267540);
INSERT INTO `scenic_spot` VALUES (16, '稻城亚丁', '稻城亚丁是中国最后的香格里拉，以其原始的自然风光、神圣的宗教文化和独特的地理位置而著称。', '四川省甘孜州稻城县', 150.00, '7:00-18:00', '/img/1763008238147.jpeg', '[{\"url\":\"/img/1763008238147.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008240013.jpeg\",\"isMain\":false}]', '2025-05-14 11:13:00', '2025-11-13 12:30:40', 1, 100.304635, 27.929753);
INSERT INTO `scenic_spot` VALUES (17, '丽江古城', '丽江古城是纳西族的文化中心，以其独特的建筑风格、浓厚的民族风情和悠久的历史文化而著称。', '云南省丽江市古城区', 80.00, '8:00-17:00', '/img/scenic/lijiang_ancient_town.jpg', NULL, '2025-05-14 11:14:00', '2025-05-14 11:14:00', 5, 100.235413, 26.872286);
INSERT INTO `scenic_spot` VALUES (18, '武夷山', '武夷山是中国著名的风景名胜区，以其秀丽的山水、深厚的文化底蕴和丰富的生物资源而著称。', '福建省南平市武夷山市', 140.00, '8:00-17:00', '/img/1763008219654.jpeg', '[{\"url\":\"/img/1763008219654.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008221996.jpeg\",\"isMain\":false}]', '2025-05-14 11:15:00', '2025-11-13 12:30:22', 1, 118.073822, 27.741052);
INSERT INTO `scenic_spot` VALUES (19, '凤凰古城', '凤凰古城是湘西的一颗明珠，以其独特的建筑风格、浓厚的民族风情和悠久的历史文化而著称。', '湖南省湘西州凤凰县', 60.00, '全天开放', '/img/1763008202066.jpg', '[{\"url\":\"/img/1763008202066.jpg\",\"isMain\":true},{\"url\":\"/img/1763008204409.jpg\",\"isMain\":false}]', '2025-05-14 11:16:00', '2025-11-13 12:30:05', 5, 109.603917, 28.254595);
INSERT INTO `scenic_spot` VALUES (20, '莫高窟', '莫高窟是中国古代艺术的宝库，拥有大量的佛教壁画和雕塑，是世界文化遗产。', '甘肃省酒泉市瓜州县', 200.00, '9:00-17:00', '/img/1763008186359.jpeg', '[{\"url\":\"/img/1763008186359.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008188459.jpg\",\"isMain\":false}]', '2025-05-14 11:17:00', '2025-11-13 12:29:49', 2, 94.790589, 40.044814);
INSERT INTO `scenic_spot` VALUES (21, '布达拉宫', '布达拉宫是西藏的象征，以其宏伟的建筑、深厚的宗教文化和悠久的历史而著称，是世界文化遗产。', '西藏自治区拉萨市城关区', 100.00, '9:00-16:00', '/img/1763008168440.jpg', '[{\"url\":\"/img/1763008168440.jpg\",\"isMain\":true},{\"url\":\"/img/1763008173682.jpeg\",\"isMain\":false}]', '2025-05-14 11:18:00', '2025-11-13 12:29:34', 2, 91.132212, 29.657458);
INSERT INTO `scenic_spot` VALUES (22, '千岛湖', '千岛湖是中国最大的人工湖，以其独特的岛屿风光、清澈的湖水和丰富的水上活动而著称。', '浙江省杭州市淳安县', 120.00, '8:00-17:00', '/img/1763008152432.jpeg', '[{\"url\":\"/img/1763008152432.jpeg\",\"isMain\":true},{\"url\":\"/img/1763008154791.jpeg\",\"isMain\":false}]', '2025-05-14 11:19:00', '2025-11-13 12:29:16', 1, 119.041773, 29.599048);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scenic_id` bigint NOT NULL,
  `ticket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '门票名称',
  `price` decimal(10, 2) NOT NULL,
  `discount_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠价格',
  `ticket_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '门票类型(成人票/儿童票/学生票等)',
  `valid_period` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有效期',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `stock` int NULL DEFAULT NULL COMMENT '剩余数量',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 1-可预订, 0-不可预订',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scenic_id`(`scenic_id` ASC) USING BTREE,
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic_spot` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1, 1, '故宫博物院-成人票', 80.00, 60.00, '成人票', '购买后30天内有效', '故宫博物院标准成人票，含基本参观项目，不包含珍宝馆、钟表馆等特殊展厅', 994, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (2, 1, '故宫博物院-学生票', 60.00, 40.00, '学生票', '购买后30天内有效，需出示有效学生证', '故宫博物院学生优惠票，含基本参观项目，不包含珍宝馆、钟表馆等特殊展厅', 497, 1, '2025-05-30 11:18:59', '2025-05-31 02:21:21');
INSERT INTO `ticket` VALUES (3, 1, '故宫博物院-特惠套票', 120.00, 100.00, '特惠套票', '购买后30天内有效', '故宫博物院特惠套票，含基本参观项目及珍宝馆、钟表馆特殊展厅', 298, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (4, 2, '八达岭长城-成人票', 60.00, 45.00, '成人票', '仅限当天使用', '长城八达岭段成人标准门票，含往返缆车', 1500, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (5, 2, '八达岭长城-儿童票', 30.00, 25.00, '儿童票', '仅限当天使用，1.2米以下儿童免票', '长城八达岭段儿童优惠门票，含往返缆车', 498, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (6, 2, '八达岭长城-老人票', 30.00, 25.00, '老人票', '仅限当天使用，需出示老年证', '长城八达岭段老人优惠门票，含往返缆车', 299, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (7, 3, '西湖景区-联票', 80.00, 70.00, '联票', '购买后7天内有效', '西湖景区联票，包含断桥、雷峰塔、三潭印月等景点', 1999, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (8, 3, '西湖游船票-成人', 60.00, 55.00, '成人票', '购买后当天有效', '西湖游船标准票，含环湖游船服务', 999, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (9, 3, '西湖游船票-儿童', 30.00, 25.00, '儿童票', '购买后当天有效，1.2米以下儿童免票', '西湖游船儿童票，含环湖游船服务', 500, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (10, 4, '黄山风景区-成人票', 230.00, 190.00, '成人票', '购买后2天内有效', '黄山风景区成人门票，不含缆车费用', 800, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (11, 4, '黄山风景区-学生票', 160.00, 115.00, '学生票', '购买后2天内有效，需出示有效学生证', '黄山风景区学生优惠票，不含缆车费用', 400, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (12, 4, '黄山风景区-两日游套票', 350.00, 320.00, '套票', '购买后7天内有效，连续两天使用', '黄山风景区两日游套票，含山上住宿一晚，不含缆车费用', 200, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (13, 5, '漓江精华游-成人票', 220.00, 180.00, '成人票', '购买后15天内有效', '漓江精华段竹筏漂流，含接送服务', 600, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (14, 5, '漓江精华游-儿童票', 120.00, 100.00, '儿童票', '购买后15天内有效，1.2米以下儿童免票', '漓江精华段竹筏漂流儿童票，含接送服务', 299, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');
INSERT INTO `ticket` VALUES (15, 5, '桂林山水一日游套票', 280.00, 250.00, '套票', '购买后15天内有效', '含漓江精华段漂流、象山公园、七星公园等景点门票，含午餐和接送服务', 200, 1, '2025-05-30 11:18:59', '2025-05-30 11:18:59');

-- ----------------------------
-- Table structure for ticket_order
-- ----------------------------
DROP TABLE IF EXISTS `ticket_order`;
CREATE TABLE `ticket_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL,
  `ticket_id` bigint NOT NULL,
  `quantity` int NOT NULL COMMENT '购买数量',
  `visitor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游客姓名',
  `visitor_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游客手机号',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `visit_date` date NOT NULL COMMENT '游玩日期',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `status` tinyint NULL DEFAULT 0 COMMENT '0-待支付, 1-已支付, 2-已取消, 3-已退款, 4-已完成',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `ticket_id`(`ticket_id` ASC) USING BTREE,
  CONSTRAINT `ticket_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_order_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ticket_order
-- ----------------------------
INSERT INTO `ticket_order` VALUES (1, 'ORD202505151001', 2, 1, 2, '张三', '13712345678', '110101199001011234', '2025-06-01', 120.00, 4, '2025-05-15 10:30:00', 'ALIPAY', '2025-05-15 10:01:00', '2025-05-15 10:30:00');
INSERT INTO `ticket_order` VALUES (2, 'ORD202505151002', 3, 4, 3, '李四', '13812345679', '310101199102023456', '2025-06-05', 135.00, 1, '2025-05-15 11:15:00', 'WECHAT', '2025-05-15 11:02:00', '2025-05-15 11:15:00');
INSERT INTO `ticket_order` VALUES (3, 'ORD202505151003', 4, 10, 1, '王五', '13912345670', '440101199203034567', '2025-06-10', 190.00, 0, NULL, NULL, '2025-05-15 14:05:00', '2025-05-15 14:05:00');
INSERT INTO `ticket_order` VALUES (4, 'ORD202505151004', 2, 7, 2, '张三', '13712345678', '110101199001011234', '2025-06-15', 140.00, 3, '2025-05-15 15:30:00', 'ALIPAY', '2025-05-15 15:10:00', '2025-05-15 16:20:00');
INSERT INTO `ticket_order` VALUES (5, 'ORD202505151005', 3, 13, 1, '李四', '13812345679', '310101199102023456', '2025-06-20', 180.00, 2, NULL, NULL, '2025-05-15 16:30:00', '2025-05-15 16:45:00');
INSERT INTO `ticket_order` VALUES (6, '20250530114026df64', 2, 2, 2, 'jx', '13456789991', '320821200104093911', '2025-05-29', 80.00, 1, '2025-05-30 11:40:33', 'WECHAT', NULL, NULL);
INSERT INTO `ticket_order` VALUES (8, '2025053111515351c2', 2, 8, 1, '测试', '13123456789', '', '2025-05-30', 55.00, 3, '2025-05-30 12:07:33', 'ALIPAY', '2025-05-30 11:52:53', '2025-05-30 12:06:44');
INSERT INTO `ticket_order` VALUES (9, '20250530121135b910', 2, 1, 1, 'ces', '15252393500', '', '2025-05-29', 60.00, 1, '2025-05-30 12:12:00', 'ALIPAY', '2025-05-30 12:11:35', '2025-05-30 12:12:00');
INSERT INTO `ticket_order` VALUES (10, '202505301212522f0a', 2, 6, 1, 'ces', '13123456789', '', '2025-06-04', 25.00, 1, '2025-05-30 12:13:17', 'ALIPAY', '2025-05-30 12:12:52', '2025-05-30 12:13:17');
INSERT INTO `ticket_order` VALUES (11, '202505301116277781', 2, 8, 1, 'ces', '13456789987', '', '2025-05-29', 55.00, 4, '2025-05-30 12:19:36', 'ALIPAY', '2025-05-30 12:16:27', '2025-05-30 12:18:35');
INSERT INTO `ticket_order` VALUES (12, '20250530231406b2a1', 2, 5, 1, '张三', '13712345678', '', '2025-05-30', 25.00, 0, NULL, NULL, '2025-05-30 23:14:06', NULL);
INSERT INTO `ticket_order` VALUES (13, '20250531022028b885', 2, 3, 1, '张三', '13712345678', '', '2025-05-30', 100.00, 1, '2025-05-31 02:20:33', 'BANK_CARD', '2025-05-31 02:20:28', '2025-05-31 02:20:32');
INSERT INTO `ticket_order` VALUES (14, '20250619220133c698', 6, 1, 1, 'ftfx', '13123456789', '', '2025-06-19', 60.00, 1, '2025-06-19 22:01:37', 'BANK_CARD', '2025-06-19 22:01:33', '2025-06-19 22:01:37');
INSERT INTO `ticket_order` VALUES (15, '202506202136402346', 8, 2, 1, 'test', '13123456789', '', '2025-06-20', 40.00, 0, NULL, NULL, '2025-06-20 21:36:40', NULL);
INSERT INTO `ticket_order` VALUES (16, '202506202145278b4a', 8, 5, 1, 'test', '13345612344', '', '2025-06-20', 25.00, 1, '2025-06-20 21:45:30', 'BANK_CARD', '2025-06-20 21:45:27', '2025-06-20 21:45:30');
INSERT INTO `ticket_order` VALUES (17, '202506211513181e99', 2, 1, 1, '张三', '13712345678', '', '2025-06-21', 60.00, 0, NULL, NULL, '2025-06-21 15:13:18', NULL);
INSERT INTO `ticket_order` VALUES (18, '202506221747013f2f', 2, 1, 1, '张三', '13712345678', '', '2025-06-22', 60.00, 0, NULL, NULL, '2025-06-22 17:47:01', NULL);
INSERT INTO `ticket_order` VALUES (19, '20250622213340e68c', 2, 1, 1, '张三', '13712345678', '', '2025-06-22', 60.00, 1, '2025-06-22 21:33:44', 'BANK_CARD', '2025-06-22 21:33:40', '2025-06-22 21:33:43');
INSERT INTO `ticket_order` VALUES (20, '20250704170235ea25', 2, 3, 1, '张三', '13712345678', '', '2025-07-04', 100.00, 4, '2025-07-04 17:02:40', 'BANK_CARD', '2025-07-04 17:02:35', '2025-07-04 17:02:40');
INSERT INTO `ticket_order` VALUES (21, '20250704170629427e', 2, 7, 1, '张三', '13712345678', '', '2025-07-04', 70.00, 0, NULL, NULL, '2025-07-04 17:06:29', NULL);
INSERT INTO `ticket_order` VALUES (22, '202507041707183f94', 2, 7, 1, '张三', '13712345678', '', '2025-07-04', 70.00, 2, NULL, NULL, '2025-07-04 17:07:18', '2025-07-04 17:07:20');
INSERT INTO `ticket_order` VALUES (23, '20251007114545b904', 2, 14, 1, '张三', '13712345678', '', '2025-10-07', 100.00, 1, '2025-10-07 11:45:49', 'WECHAT', '2025-10-07 11:45:45', '2025-10-07 11:45:48');
INSERT INTO `ticket_order` VALUES (24, '2025111019413406e0', 2, 1, 4, '张三', '13712345678', '', '2025-11-10', 240.00, 2, NULL, NULL, '2025-11-10 19:41:34', '2025-11-10 19:41:37');
INSERT INTO `ticket_order` VALUES (25, '202511101945529d0f', 2, 1, 1, '张三', '13712345678', '', '2025-11-10', 60.00, 0, NULL, NULL, '2025-11-10 19:45:52', NULL);
INSERT INTO `ticket_order` VALUES (26, '2025111019460435b2', 2, 1, 1, '张三', '13712345678', '', '2025-11-10', 60.00, 2, NULL, NULL, '2025-11-10 19:46:04', '2025-11-10 19:46:11');

-- ----------------------------
-- Table structure for travel_guide
-- ----------------------------
DROP TABLE IF EXISTS `travel_guide`;
CREATE TABLE `travel_guide`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '攻略ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `user_id` bigint NULL DEFAULT NULL COMMENT '作者ID',
  `cover_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图片',
  `views` int NULL DEFAULT 0 COMMENT '浏览量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `travel_guide_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '旅游攻略表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of travel_guide
-- ----------------------------
INSERT INTO `travel_guide` VALUES (1, '北京三日游完全攻略', '<h2><strong>北京三日游完全攻略</strong></h2><p>第一天：故宫 + 天安门广场 + 王府井</p><p>上午参观故宫博物院，下午游览天安门广场，晚上可以去王府井逛街品尝小吃。</p><p>第二天：长城 + 颐和园1</p><p>上午前往八达岭长城，下午游览颐和园，感受皇家园林的魅力。</p><p> 第三天：798艺术区 + 南锣鼓巷</p><p>上午参观798艺术区，感受现代艺术氛围，下午游览南锣鼓巷，体验老北京胡同文化。</p>', 2, '/img/1748616360745.jpg', 1297, '2025-05-14 13:00:00', '2025-11-13 16:28:06');
INSERT INTO `travel_guide` VALUES (2, '杭州西湖一日游', '<p>杭州西湖一日游</p><p>上午：断桥残雪 + 白堤</p><p>从断桥开始，沿着白堤漫步，欣赏西湖美景。</p><p>中午：楼外楼用餐</p><p>在楼外楼品尝正宗杭帮菜，如西湖醋鱼等特色美食。</p><p>下午：雷峰塔 + 三潭印月</p><p>参观雷峰塔，乘船游览三潭印月，感受\"西湖十景\"的魅力。</p>', 3, '/img/1748616297105.jpg', 987, '2025-05-14 13:01:00', '2025-11-09 20:12:29');
INSERT INTO `travel_guide` VALUES (3, '黄山二日游攻略', '<h3>黄山二日游攻略</h3><p><br></p><p>第一天：云谷寺 → 白鹅岭 → 北海景区 → 光明顶</p><p>上午从云谷寺进山，经白鹅岭到达北海景区，下午登顶光明顶，晚上入住山顶酒店。</p><p><br></p><p>第二天：观日出 → 西海大峡谷 → 排云亭 → 温泉</p><p>清晨观赏日出，上午游览西海大峡谷，下午经排云亭下山，可以在山脚的温泉放松身心。</p>', 4, '/img/1748616271030.jpg', 1108, '2025-05-14 13:02:00', '2025-11-09 20:13:25');
INSERT INTO `travel_guide` VALUES (4, '桂林山水精华三日游', '<p>桂林山水精华三日游</p><p><br></p><p>第一天：象山公园 + 七星公园</p><p>游览市区内的象山公园和七星公园，感受桂林市区的山水之美。</p><p><br></p><p> 第二天：漓江精华段漂流</p><p>从桂林乘船至阳朔，欣赏漓江两岸的壮丽风光，这是桂林最精华的景观。</p><p><br></p><p>第三天：阳朔西街 + 十里画廊</p><p>上午游览阳朔西街，下午骑行或乘车游览十里画廊，欣赏田园风光。</p>', 2, '/img/1748616225252.jpg', 907, '2025-05-14 13:03:00', '2025-11-13 16:28:12');
INSERT INTO `travel_guide` VALUES (8, '111', '<p>111</p>', NULL, '/img/1748628603522.jpg', 11, '2025-05-31 02:10:05', '2025-11-11 00:04:57');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码(加密存储)',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'USER' COMMENT '角色code',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `uk_email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '管理员', 'admin@tourism.com', '13800138000', 'ADMIN', '/img/1748599714053.jpg', 1, '2025-05-14 10:00:00', '2025-10-07 11:44:35', '女');
INSERT INTO `user` VALUES (2, 'zhangsan', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '张三', 'zhangsan@example.com', '13712345678', 'USER', '/img/1762790617697.jpg', 1, '2025-05-14 10:01:00', '2025-11-11 00:03:38', '男');
INSERT INTO `user` VALUES (3, 'lisi', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '李四', 'lisi@example.com', '13812345679', 'USER', '/img/avatar/user2.png', 1, '2025-05-14 10:02:00', '2025-05-14 10:02:00', '女');
INSERT INTO `user` VALUES (4, 'wangwu', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '王五', 'wangwu@example.com', '13912345670', 'USER', '/img/avatar/user3.png', 1, '2025-05-14 10:03:00', '2025-05-14 10:03:00', '男');
INSERT INTO `user` VALUES (5, 'w11', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '111', '11111@qq.com', '', 'USER', NULL, 1, '2025-05-31 01:45:50', '2025-10-07 11:44:52', '男');
INSERT INTO `user` VALUES (6, '1796145677', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', NULL, '1796145611@qq.com', NULL, 'USER', NULL, 1, '2025-06-19 21:11:58', '2025-10-07 11:44:44', NULL);
INSERT INTO `user` VALUES (7, '1796145611', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '', '179614561108@qq.com', NULL, 'USER', NULL, 1, '2025-06-20 21:30:42', '2025-10-07 11:44:45', NULL);
INSERT INTO `user` VALUES (8, '12345', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '', '1796145608@qq.com', '', 'USER', NULL, 1, '2025-06-20 21:35:46', '2025-10-07 11:44:45', '男');
INSERT INTO `user` VALUES (9, '1796145648Stp', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', 'ftfx', '1796145648@qq.com', '', 'USER', '/img/1750598348943.jpg', 1, '2025-06-20 21:49:00', '2025-10-07 11:44:48', '男');
INSERT INTO `user` VALUES (10, '1796145644kpD', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '', '1796145644@qq.com', NULL, 'USER', NULL, 1, '2025-06-21 11:23:14', '2025-10-07 11:44:48', NULL);
INSERT INTO `user` VALUES (11, 'test001', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', '', '1796145612@qq.com', '', 'USER', NULL, 1, '2025-06-21 11:23:31', '2025-10-07 11:44:51', NULL);
INSERT INTO `user` VALUES (12, 'test000', '$2a$10$iul6jocLsH.A4gN1QUpgDexDq6KO89syHjUkRD3NbA1L6CTVrNRMO', 'test111', '123456@QQ.COM', '', 'USER', NULL, 1, '2025-07-19 15:17:29', '2025-10-07 11:44:53', NULL);

SET FOREIGN_KEY_CHECKS = 1;
