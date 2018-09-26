-- ----------------------------
-- Table structure for "C##NEWO"."${tabletop}${objectNameLower}"
-- ----------------------------
-- drop table "C##NEWO"."${tabletop}${objectNameLower}";
create table "C##NEWO"."${tabletop}${objectNameLower}" (
<#list fieldList as var>
	<#if var[1] == 'Integer' || var[1] == 'Radio' || var[1] == 'CheckBox' || var[1] == 'Select'>
	"${var[0]}" number(10) null ,
	<#else>
	"${var[0]}" varchar2(255 BYTE) NULL ,
	</#if>
</#list>
	"${objectNameLower}_id" varchar2(100 byte) not null 
)
logging
nocompress
nocache
;

<#list fieldList as var>
comment on column "C##NEWO"."${tabletop}${objectNameLower}"."${var[0]}" is '${var[2]}';
</#list>
comment on column "C##NEWO"."${tabletop}${objectNameLower}"."${objectNameLower}_id" is 'id';

-- ----------------------------
-- Indexes structure for table ${tabletop}${objectNameLower}
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##NEWO"."${tabletop}${objectNameLower}"

-- ----------------------------

alter table "C##NEWO"."${tabletop}${objectNameLower}" add check ("${objectNameLower}_id" is not null);

-- ----------------------------
-- Primary Key structure for table "C##NEWO"."${tabletop}${objectNameLower}"
-- ----------------------------
alter table "C##NEWO"."${tabletop}${objectNameLower}" add primary key ("${objectNameLower}_id");
