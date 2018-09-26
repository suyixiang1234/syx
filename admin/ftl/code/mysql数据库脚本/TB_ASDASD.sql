
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_ASDASD`
-- ----------------------------
DROP TABLE IF EXISTS `TB_ASDASD`;
CREATE TABLE `TB_ASDASD` (
 		`ASDASD_ID` varchar(100) NOT NULL,
		`ASD` varchar(255) DEFAULT NULL COMMENT 'SADA',
  		PRIMARY KEY (`ASDASD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
