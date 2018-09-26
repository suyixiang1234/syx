
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `tb_test`
-- ----------------------------
drop table if exists `tb_test`;
create table `tb_test` (
 		`test_id` varchar(100) not null,
		`_string` varchar(255) default null comment '字符串',
		`_integer` int(11) not null comment '数字',
		`_date` varchar(255) default null comment '时间',
		`_longtext` varchar(255) default null comment '长文本',
		`_double` varchar(255) default null comment '小数',
  		primary key (`test_id`)
) engine=InnoDB default charset=utf8;
