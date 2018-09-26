package com.fh.controller.system.createcode;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fh.controller.base.BaseController;
import com.fh.controller.system.menu.MenuController;
import com.fh.entity.system.Menu;
import com.fh.service.system.creataTable.CreateTableService;
import com.fh.util.DelAllFile;
import com.fh.util.FileDownload;
import com.fh.util.FileZip;
import com.fh.util.Freemarker;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

/**
 * 类名称：FreemarkerController 创建人：FH 创建时间：2015年1月12日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/createCode")
public class CreateCodeController extends BaseController {

	@Resource(name = "createTableService")
	private CreateTableService createTableService;
	@Autowired
	private MenuController menuController;

	/**
	 * 生成代码
	 */
	@RequestMapping(value = "/proCode")
	public void proCode(HttpServletResponse response) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();

		/*
		 * =====================================================================
		 * ========================
		 */
		String projectPath = pd.getString("projectPath"); // 项目路径
		String packageName = pd.getString("packageName"); // 包名 ========1
		String objectName = pd.getString("objectName"); // 类名 ========2
		String tabletop = pd.getString("tabletop"); // 表前缀 ========3
		
		/*自动生成菜单开始*/
		String MENU_NAME = pd.getString("MENU_NAME");// 菜单名称
		String MENU_ORDER = pd.getString("MENU_ORDER");// 菜单序号
		String PARENT_ID = pd.getString("PARENT_ID");// 上级菜单ID
		String MENU_URL = objectName.toLowerCase() + "/list.do";// 菜单地址
		Menu menu = new Menu();
		menu.setMENU_NAME(MENU_NAME);
		menu.setMENU_ORDER(MENU_ORDER);
		menu.setPARENT_ID(PARENT_ID);
		menu.setMENU_URL(MENU_URL);
		menuController.add(menu);
		/*自动生成菜单结束*/
		
		tabletop = null == tabletop ? "" : tabletop.toLowerCase(); // 表前缀转大写
		String zindext = pd.getString("zindex"); // 属性总数
		int zindex = 0;
		if (null != zindext && !"".equals(zindext)) {
			zindex = Integer.parseInt(zindext);
		}
		List<String[]> fieldList = new ArrayList<String[]>(); // 属性集合 ========4
		for (int i = 0; i < zindex; i++) {
			fieldList.add(pd.getString("field" + i).split(",fh,")); // 属性放到集合里面
		}

		Map<String, Object> root = new HashMap<String, Object>(); // 创建数据模型
		root.put("fieldList", fieldList);
		root.put("packageName", packageName); // 包名
		root.put("objectName", objectName); // 类名
		root.put("objectNameLower", objectName.toLowerCase()); // 类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase()); // 类名(全大写)
		root.put("tabletop", tabletop); // 表前缀
		root.put("nowDate", new Date()); // 当前日期

		DelAllFile.delFolder(PathUtil.getClasspath() + "admin/ftl"); // 生成代码前,先清空之前生成的代码
		/*
		 * =====================================================================
		 * ========================
		 */

		// String filePath = "admin/ftl/code/"; //存放路径
		String ftlPath = "createCode"; // ftl路径

		/* 生成controller */
		String filePath = "/src/main/java/com/fh/controller";
		Freemarker.printFile("controllerTemplate.ftl", root,
				"/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName + "Controller.java", filePath,
				ftlPath, projectPath);

		/* 生成service */
		filePath = "/src/main/java/com/fh/service";
		Freemarker.printFile("serviceTemplate.ftl", root,
				"/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName + "Service.java", filePath,
				ftlPath, projectPath);

		/* 生成mybatis xml */
		filePath = "/src/main/resources/mybatis";
		Freemarker.printFile("mapperMysqlTemplate.ftl", root, "/" + packageName + "/" + objectName + "Mapper.xml",
				filePath, ftlPath, projectPath);
				// Freemarker.printFile("mapperOracleTemplate.ftl", root,
				// "mybatis_oracle/"+packageName+"/"+objectName+"Mapper.xml",
				// filePath, ftlPath, projectPath);

		/* 生成SQL脚本 */
		Freemarker.printFile("mysql_SQL_Template.ftl", root,
				"/" + packageName + "/sql脚本/" + tabletop + objectName.toLowerCase() + ".sql", filePath, ftlPath,
				projectPath);
		/* 创建MySql表开始 */
		String createSql = FileUtil.readAsString(new File(projectPath + "/src/main/resources/mybatis/" + packageName
				+ "/sql脚本/" + tabletop + objectName.toLowerCase() + ".sql"));
		PageData sql = new PageData();
		sql.put("createSql", createSql);
		createTableService.createTable(sql);
		/* 创建MySql表结束 */

		// Freemarker.printFile("oracle_SQL_Template.ftl", root,
		// "oracle数据库脚本/"+tabletop+objectName.toLowerCase()+".sql", filePath,
		// ftlPath, projectPath);
		/* 生成jsp页面 */
		filePath = "/src/main/webapp/WEB-INF/jsp";
		Freemarker.printFile("jsp_list_Template.ftl", root,
				"/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName.toLowerCase() + "_list.jsp",
				filePath, ftlPath, projectPath);
		Freemarker.printFile("jsp_edit_Template.ftl", root,
				"/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName.toLowerCase() + "_edit.jsp",
				filePath, ftlPath, projectPath);

		/* 生成说明文档 */
		// Freemarker.printFile("docTemplate.ftl", root, "说明.doc", filePath,
		// ftlPath);

		// this.print("oracle_SQL_Template.ftl", root); 控制台打印

		/* 生成的全部代码压缩成zip文件 */
		// FileZip.zip(PathUtil.getClasspath()+"admin/ftl/code",
		// PathUtil.getClasspath()+"admin/ftl/code.zip");

		/* 下载代码 */
		// FileDownload.fileDownload(response,
		// PathUtil.getClasspath()+"admin/ftl/code.zip", "code.zip");
		FileDownload.fileDownload(response, projectPath + "/src/main/resources/mybatis" + "/" + packageName + "/sql脚本/"
				+ tabletop + objectName.toLowerCase() + ".sql", tabletop + objectName.toLowerCase() + ".sql");

	}

}
