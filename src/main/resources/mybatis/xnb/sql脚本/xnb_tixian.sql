
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `xnb_tixian`
-- ----------------------------
drop table if exists `xnb_tixian`;
create table `xnb_tixian` (
 		`tixian_id` varchar(100) not null,
		`user_id` varchar(255) default null comment '用戶id',
		`banks_id` varchar(255) default null comment '银行卡id',
		`moneys` decimal(11,2) default null comment '提现金额',
		`times` varchar(255) default null comment '申请时间',
  		primary key (`tixian_id`)
) engine=InnoDB default charset=utf8;
