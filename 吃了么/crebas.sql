/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/6 8:24:36                            */
/*==============================================================*/

create database chileme;
use chileme;

drop table if exists Customer;

drop table if exists Dish;

drop table if exists OrderItem;

drop table if exists Orders;

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer
(
   username             varchar(32) not null,
   password             varchar(32) not null,
   email                varchar(32),
   primary key (username)
);

/*==============================================================*/
/* Table: Dish                                                  */
/*==============================================================*/
create table Dish
(
   dishid               int not null,
   dishname             varchar(128),
   price                float,
   description          varchar(256),
   imgurl               varchar(1024),
   discount             float,
   primary key (dishid)
);

/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
create table OrderItem
(
   dishid               int not null,
   orderid              varchar(64) not null,
   count                int,
   finalprice           float,
   primary key (dishid, orderid)
);

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders
(
   orderid              varchar(64) not null,
   username             varchar(32),
   time                 datetime,
   count                int,
   totalprice           float,
   paystatus            varchar(16),
   address              varchar(64),
   tel                  varchar(16),
   primary key (orderid)
);

alter table OrderItem add constraint FK_OrderItem foreign key (orderid)
      references Orders (orderid) on delete restrict on update restrict;

alter table OrderItem add constraint FK_OrderItem2 foreign key (dishid)
      references Dish (dishid) on delete restrict on update restrict;

alter table Orders add constraint FK_Relationship_1 foreign key (username)
      references Customer (username) on delete restrict on update restrict;

insert into Customer values ('admin','admin','admin@admin.com');
insert into Customer values ('test','test','test@test.com');

insert into Dish values (1, '517轰大餐', 52, '套餐－澳洲黑胡椒鸡腿原味咖喱饭+BBQ翅根1对+可口可乐1听', 'https://fuss10.elemecdn.com/c/37/1c22958f35a36e22bdea71f34f92ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (2, '墨西哥香辣鸡腿红咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/f/ff/77ec2ad1785e5d89677e6bc23c181jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (3, '墨西哥香辣鸡腿绿咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/e/73/11c86c8d0989362c5e3861a06aa11jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (4, '蒜香炭烤乳猪排原味咖喱饭', 26, '咖喱饭－炭烤的粗犷融合乳猪的细嫩，搭配18种香料熬制的日本原味梦咖喱，多汁美味！', 'https://fuss10.elemecdn.com/2/ac/ecc5de70c93723796c8ddc91b7ef2jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (5, '蒜香炭烤乳猪排轰辣咖喱饭', 26, '咖喱饭－炭烤的粗犷融合乳猪的细嫩，搭配牛肉与辛香料混合熬制的辛口咖喱，多汁美味！', 'https://fuss10.elemecdn.com/8/27/88240a25424cc3d3f5b3767b68dadjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (6, '巴蜀藤椒鸡腿原味咖喱饭', 26, '咖喱饭－藤椒长时间腌制带来独特麻辣，搭配18种香料熬制的日本原味梦咖喱，不尝尝么？', 'https://fuss10.elemecdn.com/8/3d/002c5c2d4244a2865752b6baae44ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (7, '巴蜀藤椒鸡腿轰辣咖喱饭', 26, '咖喱饭－藤椒长时间腌制带来独特麻辣，搭配牛肉与辛香料混合熬制的辛口咖喱，不尝尝么？', 'https://fuss10.elemecdn.com/b/2d/35ce368225199dacb0c812449cf5fjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (8, '巴蜀藤椒鸡腿红咖喱饭', 26, '咖喱饭－藤椒长时间腌制带来独特麻辣，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，不尝尝么？', 'https://fuss10.elemecdn.com/a/6b/73f20893ae2a0499f00290f13b3c9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (9, '日式照烧鸡排原味咖喱饭', 29, '咖喱饭－18种独特香料与苹果融合成柔和且充满层次的风味，承袭近半世纪的梦咖喱之味。', 'https://fuss10.elemecdn.com/9/d8/d488de003e232c07f2d2706cf8927jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (10, '美式奥尔良鸡腿原味咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配18种香料熬制的日本原味梦咖喱，一口就满足！', 'https://fuss10.elemecdn.com/7/c6/2774191f1f23771aedf2aa5435351jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (11, '蒜香火烤嫩鸡排原味咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配18种香料熬制的日本原味梦咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/4/4f/3a6f94fb2dc537e2db182df62c6d0jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (12, '日式照烧鸡排轰辣咖喱饭', 29, '咖喱饭－日本辛口咖喱，融合牛肉与辛香料的独特辛辣，推荐尝试。', 'https://fuss10.elemecdn.com/2/29/42457c00afce5b4680d5e07d0994ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (13, '蒜香火烤嫩鸡排轰辣咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配牛肉与辛香料混合熬制的辛口咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/1/b9/7161cacc050bfc73972322251a3bcjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (14, '澳洲黑胡椒鸡腿原味咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配18种香料熬制的日本原味梦咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/7/45/8e877f853f46ebc1ae85871106312jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (15, '维他柠檬茶', 4, '缤纷酷饮－250ml维他柠檬茶', 'https://fuss10.elemecdn.com/6/99/aa0a0704d0c4c0fe5098d2de35763jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (16, '照烧鸡肉丸', 7, '加餐主力－日式照烧酱烤入扎实的鸡肉丸子，肉吃不够？再来一串！', 'https://fuss10.elemecdn.com/9/b6/99c5895e53976b95511c91b8848abjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (17, '巴西BBQ翅根（1对）', 8, '加餐主力－舌尖也要跳舞！BBQ南美风情烧烤翅根，体会到扑面香气与火辣热情了么？', 'https://fuss10.elemecdn.com/b/d6/135927cc97e00540d9d12fa1ad670jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (18, '日式照烧鸡排', 11, '加餐主力－照烧酱完整地包覆着厚实又有弹性的鸡排，味道醇厚，难以抵挡！', 'https://fuss10.elemecdn.com/0/e5/131a100ef4249ba13bc9fee6291e9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (19, '黑椒妙趣餐', 42, '套餐－澳洲黑胡椒鸡腿原味咖喱饭+可口可乐1听', 'https://fuss10.elemecdn.com/b/3f/612307df9d97b56969ff8310a10fejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (20, '蒜香火烤嫩鸡排原味咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配18种香料熬制的日本原味梦咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/4/4f/3a6f94fb2dc537e2db182df62c6d0jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (21, '蒜香火烤嫩鸡排轰辣咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配牛肉与辛香料混合熬制的辛口咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/1/b9/7161cacc050bfc73972322251a3bcjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (22, '巴西BBQ翅根原味咖喱饭', 26, '咖喱饭－拉美风情BBQ烧烤翅根，搭配18种香料熬制的日本原味梦咖喱，让你舌尖也跳舞！', 'https://fuss10.elemecdn.com/9/cd/79f07ba17fbb16e5b06fe56e7e322jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (23, '巴西BBQ翅根轰辣咖喱饭', 26, '咖喱饭－拉美风情BBQ烧烤翅根，搭配牛肉与辛香料混合熬制的辛口咖喱，让你舌尖也跳舞！', 'https://fuss10.elemecdn.com/6/2b/dc5d6ff6bc1a28d29bf45105cca7djpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (24, '巴西BBQ翅根红咖喱饭', 26, '咖喱饭－拉美风情BBQ烧烤翅根，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，让你舌尖也跳舞！', 'https://fuss10.elemecdn.com/3/85/14d5c0fdf05676e46e45f8c262068jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (25, '日式照烧鸡排原味咖喱饭', 29, '咖喱饭－18种独特香料与苹果融合成柔和且充满层次的风味，承袭近半世纪的梦咖喱之味。', 'https://fuss10.elemecdn.com/9/d8/d488de003e232c07f2d2706cf8927jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (26, '日式照烧鸡排轰辣咖喱饭', 29, '咖喱饭－日本辛口咖喱，融合牛肉与辛香料的独特辛辣，推荐尝试。', 'https://fuss10.elemecdn.com/2/29/42457c00afce5b4680d5e07d0994ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (27, '日式照烧鸡排红咖喱饭', 29, '咖喱饭－香味浓郁，鲜辣刺激，来自泰国辣椒与虾酱的结合，再加入椰浆柔化辣度。', 'https://fuss10.elemecdn.com/a/54/7d52800d16a1d597a50e229372dbejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (28, '澳洲黑胡椒鸡腿原味咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配18种香料熬制的日本原味梦咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/7/45/8e877f853f46ebc1ae85871106312jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (29, '澳洲黑胡椒鸡腿轰辣咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配牛肉与辛香料混合熬制的辛口咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/b/52/92ae12ff8db514806317c65612cdfjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (30, '澳洲黑胡椒鸡腿绿咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/e/24/c6e1754b66c70af8676087718346ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (31, '澳洲黑胡椒鸡腿红咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/3/16/bacd7a47f86db0f0f23e1644e9727jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (32, '美式奥尔良鸡腿原味咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配18种香料熬制的日本原味梦咖喱，一口就满足！', 'https://fuss10.elemecdn.com/7/c6/2774191f1f23771aedf2aa5435351jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (33, '美式奥尔良鸡腿轰辣咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配牛肉与辛香料混合熬制的辛口咖喱，一口就满足！', 'https://fuss10.elemecdn.com/b/d7/8a4bf1ed943386d544c13de40c9eejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (34, '美式奥尔良鸡腿绿咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，一口就满足！', 'https://fuss10.elemecdn.com/1/c0/cbc399323b13310a271f0877271b5jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (35, '美式奥尔良鸡腿红咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，一口就满足！', 'https://fuss10.elemecdn.com/3/02/b43ba04d1893b7b349081e2a6e706jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (36, '法式鸡胸肉卷原味咖喱饭', 26, '咖喱饭－18种独特香料与苹果融合成柔和且充满层次的风味，承袭近半世纪的梦咖喱之味。', 'https://fuss10.elemecdn.com/7/76/c75ed03eda11b52f31f6ad45fd906jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (37, '法式鸡胸肉卷轰辣咖喱饭', 26, '咖喱饭－日本辛口咖喱，融合牛肉与辛香料的独特辛辣，推荐尝试。', 'https://fuss10.elemecdn.com/7/60/cd2d27bcacca65a428c379678eca8jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (38, '法式鸡胸肉卷红咖喱饭', 26, '咖喱饭－香味浓郁，鲜辣刺激，来自泰国辣椒与虾酱的结合，再加入椰浆柔化辣度。', 'https://fuss10.elemecdn.com/4/2f/fe3e24315edd4ee61edce4c2d183cjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (39, '轰棒槌', 6, '加餐主力－能量健康玉米棒，甜甜糯糯！', 'https://fuss10.elemecdn.com/0/1b/05eb5501bd689af823ec26e9c2baejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (40, '美式奥尔良鸡腿', 11, '加餐主力－回味舌尖，让我们一起漾在浪漫美式情怀的奥尔良味道中！', 'https://fuss10.elemecdn.com/4/d4/0845ec1b0daa75bbf4aa239af4104jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (41, '巴西BBQ翅根（1对）', 8, '加餐主力－舌尖也要跳舞！BBQ南美风情烧烤翅根，体会到扑面香气与火辣热情了么？', 'https://fuss10.elemecdn.com/b/d6/135927cc97e00540d9d12fa1ad670jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (42, '轰咖大白饭', 3, '米饭－精选好米。', 'https://fuss10.elemecdn.com/5/fc/46aa6107948daeb60de965f57db26jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (43, '法式鸡胸肉卷', 9, '加餐主力－法式香料腌制鸡胸肉搭配时蔬，谁说肉卷不多情，cest la vie ！', 'https://fuss10.elemecdn.com/2/ef/43bb93318218350fd6a762325f353jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (44, '照烧鸡肉丸', 7, '加餐主力－日式照烧酱烤入扎实的鸡肉丸子，肉吃不够？再来一串！', 'https://fuss10.elemecdn.com/9/b6/99c5895e53976b95511c91b8848abjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (45, '澳洲黑胡椒鸡腿', 11, '加餐主力－黑椒与鸡腿的联袂出演，用心给你好味道！', 'https://fuss10.elemecdn.com/4/b5/8531bb74d524119bba562e4d3609fjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (46, '墨西哥香辣鸡腿', 11, '加餐主力－这般炫酷叼炸天的鸡腿，香辣入味，肉味浓郁，能吃到绝壁是上辈子拯救了银河系！', 'https://fuss10.elemecdn.com/3/da/0610aaf981df727eb4d982b00ab59jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (47, '日式照烧鸡排', 11, '加餐主力－照烧酱完整地包覆着厚实又有弹性的鸡排，味道醇厚，难以抵挡！', 'https://fuss10.elemecdn.com/0/e5/131a100ef4249ba13bc9fee6291e9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (48, '蒜香火烤嫩鸡排', 9, '加餐主力－以蒜香点缀小火慢烤的鲜嫩鸡排，享受，就从这里开始！', 'https://fuss10.elemecdn.com/b/ba/1c763fd32d72296596e027d2d914ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (49, '麻辣鸭脖', 15, '加餐主力－麻辣入味，速速来啃~', 'https://fuss10.elemecdn.com/3/aa/4d0c215d2974b2898090d7d0b4782jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (50, '筋津有味', 17, '加餐主力－碳烤半筋半肉黄金鸡腰肉，有筋道的嚼感，有解馋的抚慰感，再来一份？(200g)', 'https://fuss10.elemecdn.com/9/81/f62e69bcb8fabd111e147212afec4jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (51, '巴蜀藤椒鸡腿', 9, '加餐主力－藤椒长时间腌制带来独特的辣与微微的麻，好巧，师兄，尝尝新品吧！', 'https://fuss10.elemecdn.com/3/6e/4a4665287f74d8ee8d69d3b3c3992jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (52, '蒜香炭烤乳猪排', 9, '加餐主力－炭火烧烤的粗犷风格与乳猪的细嫩口感交织而成的美味！', 'https://fuss10.elemecdn.com/7/d4/269a58c2b2caac6c5a58fb563b147jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (53, '盐水毛豆', 6, '加餐主力－颗粒饱满，小食好配。', 'https://fuss10.elemecdn.com/2/f6/ebd870206e10f26d6907527bc7670jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (54, '统一冰糖雪梨', 4, '缤纷酷饮－500ml瓶装统一冰糖雪梨', 'https://fuss10.elemecdn.com/e/a7/f51314089f4e0794a9a248fe0c982jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (55, '维他柠檬茶', 4, '缤纷酷饮－250ml维他柠檬茶', 'https://fuss10.elemecdn.com/6/99/aa0a0704d0c4c0fe5098d2de35763jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (56, '可口可乐', 4, '缤纷酷饮－330ml听装可乐', 'https://fuss10.elemecdn.com/a/3e/ffac0c26dba31e6ecbb72c63cf278jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (57, '雪碧', 4, '缤纷酷饮－330ml听装雪碧', 'https://fuss10.elemecdn.com/f/72/4e5d8bfa0f56eed767d1f11caaa14jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (58, '加多宝', 5, '缤纷酷饮－310ml听装加多宝', 'https://fuss10.elemecdn.com/d/55/a67fc02a2d35efe3abe14453b4271jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (59, '小茗同学', 6, '缤纷酷饮－480ml瓶装小茗同学', 'https://fuss10.elemecdn.com/4/53/cfc093a0775766492b894ee847351jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (60, '低糖三得利乌龙茶', 3, '缤纷酷饮－500ml瓶装乌龙茶', 'https://fuss10.elemecdn.com/d/9b/2ebfe18113b74b0623377a2576960jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (61, '比翼超值餐', 41, '套餐－拉美风情BBQ翅根辅以原味梦咖喱饭，再来一份能量轰炸玉米棒槌与可口可乐，羡煞旁人！', 'https://fuss10.elemecdn.com/c/2c/278a20a706ed2ff1d89b28bc685d5jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (62, '天生大腿原味咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配18种香料熬制的日本原味梦咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/7/5f/7c83c01f653dbfa8cb177bbc1dae3jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (63, '天生大腿轰辣咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配牛肉与辛香料混合熬制的辛口咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/9/f6/e116bb01d61a08f6e2da878c0409ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (64, '天生大腿红咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/0/a3/ab90c3c847b7c134077034971b67ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (65, '天生大腿绿咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/8/08/d220b931e4ab93ecd6c9b7349f03ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (66, '墨西哥香辣鸡腿原味咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配18种香料熬制的日本原味梦咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/e/d3/1acb65e92e251b1230ed43ecdc812jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (67, '墨西哥香辣鸡腿轰辣咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配牛肉与辛香料混合熬制的辛口咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/b/7b/1cbb9816999d721b6076d546f3b96jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (68, '桂花莲藕粥', 9, '美味甜汤－甜甜滋润。', 'https://fuss10.elemecdn.com/4/84/c11ea72093c7526ff9be055af3173jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (69, '咖喱伴侣奶油球', 1, '奶油球－有伴侣的不止有咖啡，还有咖喱！轰咖实验室发现，奶油球倒入咖喱里搅拌，味道更佳！', 'https://fuss10.elemecdn.com/1/0f/2e3d1b95ac7b6988c417acbc73a3djpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
