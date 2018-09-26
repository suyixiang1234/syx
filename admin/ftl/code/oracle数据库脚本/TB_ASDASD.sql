-- ----------------------------
-- Table structure for "C##NEWO"."TB_ASDASD"
-- ----------------------------
-- DROP TABLE "C##NEWO"."TB_ASDASD";
CREATE TABLE "C##NEWO"."TB_ASDASD" (
	"ASD" VARCHAR2(255 BYTE) NULL ,
	"ASDASD_ID" VARCHAR2(100 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

COMMENT ON COLUMN "C##NEWO"."TB_ASDASD"."ASD" IS 'SADA';
COMMENT ON COLUMN "C##NEWO"."TB_ASDASD"."ASDASD_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table TB_ASDASD
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##NEWO"."TB_ASDASD"

-- ----------------------------

ALTER TABLE "C##NEWO"."TB_ASDASD" ADD CHECK ("ASDASD_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "C##NEWO"."TB_ASDASD"
-- ----------------------------
ALTER TABLE "C##NEWO"."TB_ASDASD" ADD PRIMARY KEY ("ASDASD_ID");
