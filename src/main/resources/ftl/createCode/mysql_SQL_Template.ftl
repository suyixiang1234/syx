
set foreign_key_checks=0;

-- ----------------------------
-- Table structure for `${tabletop}${objectNameLower}`
-- ----------------------------
drop table if exists `${tabletop}${objectNameLower}`;
create table `${tabletop}${objectNameLower}` (
 		`${objectNameLower}_id` varchar(100) not null,
	<#list fieldList as var>
		<#if var[1] == 'Integer' || var[1] == 'Radio' || var[1] == 'CheckBox' || var[1] == 'Select'>
		`${var[0]}` int(11) default null comment '${var[2]}',
		<#elseif var[1] == 'LongText' || var[1] == 'Ueditor'|| var[1] == 'File'>
		`${var[0]}` longtext default null comment '${var[2]}',
		<#elseif var[1] == 'Double'>
		`${var[0]}` decimal(11,2) default null comment '${var[2]}',
		<#else>
		`${var[0]}` varchar(255) default null comment '${var[2]}',
		</#if>
	</#list>
  		primary key (`${objectNameLower}_id`)
) engine=InnoDB default charset=utf8;
