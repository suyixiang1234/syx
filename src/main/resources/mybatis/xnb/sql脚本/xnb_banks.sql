
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `xnb_banks`
-- ----------------------------
drop table if exists `xnb_banks`;
create table `xnb_banks` (
 		`banks_id` varchar(100) not null,
		`realname` varchar(255) default null comment '持卡人',
		`bank` varchar(255) default null comment '所屬銀行',
		`province` varchar(255) default null comment '省',
		`city` varchar(255) default null comment '市',
		`bankname` varchar(255) default null comment '支行名称',
		`banknum` varchar(255) default null comment '卡号',
		`times` varchar(255) default null comment '创建时间',
		`user_id` varchar(255) default null comment 'hiuy',
		`remark` varchar(255) default null comment 'bz',
  		primary key (`banks_id`)
) engine=InnoDB default charset=utf8;
