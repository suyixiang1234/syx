
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `tb_trade`
-- ----------------------------
drop table if exists `tb_trade`;
create table `tb_trade` (
 		`trade_id` varchar(100) not null,
		`user_id` varchar(255) default null comment '交易人',
		`price` decimal(11,2) default null comment '交易价格',
		`t_counts` decimal(11,2) default null comment '交易量',
		`times` varchar(255) default null comment '成交时间',
		`types` varchar(255) default null comment '买/卖',
		`price_all` decimal(11,2) default null comment '成交价',
  		primary key (`trade_id`)
) engine=InnoDB default charset=utf8;
