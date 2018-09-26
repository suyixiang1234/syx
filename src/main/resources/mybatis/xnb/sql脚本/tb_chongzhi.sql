
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `tb_chongzhi`
-- ----------------------------
drop table if exists `tb_chongzhi`;
create table `tb_chongzhi` (
 		`chongzhi_id` varchar(100) not null,
		`no` varchar(255) default null comment '单号',
		`user_id` varchar(255) default null comment '账户',
		`moneys` decimal(11,2) default null comment '充值金额',
		`statues` varchar(255) default null comment '状态',
		`times` varchar(255) default null comment '提交时间',
  		primary key (`chongzhi_id`)
) engine=InnoDB default charset=utf8;
