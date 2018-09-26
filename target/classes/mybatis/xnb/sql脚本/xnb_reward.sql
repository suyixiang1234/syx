
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `xnb_reward`
-- ----------------------------
drop table if exists `xnb_reward`;
create table `xnb_reward` (
 		`reward_id` varchar(100) not null,
		`user_id` varchar(255) default null comment '推荐人',
		`xuser_id` varchar(255) default null comment '下线',
		`moneys` decimal(11,2) default null comment '奖励金额',
		`times` varchar(255) default null comment '时间',
		`jmoneys` decimal(11,2) default null comment '交易金额',
		`rates` varchar(255) default null comment '比例',
		`remark` varchar(255) default null comment '备注',
  		primary key (`reward_id`)
) engine=InnoDB default charset=utf8;
