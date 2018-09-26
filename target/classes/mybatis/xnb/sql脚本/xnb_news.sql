
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `xnb_news`
-- ----------------------------
drop table if exists `xnb_news`;
create table `xnb_news` (
 		`news_id` varchar(100) not null,
		`title` varchar(255) default null comment '标题',
		`content` longtext default null comment '内容',
		`create_time` varchar(255) default null comment '创建时间',
  		primary key (`news_id`)
) engine=InnoDB default charset=utf8;
