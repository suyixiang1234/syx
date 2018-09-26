
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `xnb_coins`
-- ----------------------------
drop table if exists `xnb_coins`;
create table `xnb_coins` (
 		`coins_id` varchar(100) not null,
		`name` varchar(255) default null comment '币值名称',
		`money` decimal(11,2) default null comment '成交额',
		`counts` decimal(11,2) default null comment '成交量',
		`create_time` varchar(255) default null comment '创建时间',
		`img` longtext default null comment '图标',
  		primary key (`coins_id`)
) engine=InnoDB default charset=utf8;
