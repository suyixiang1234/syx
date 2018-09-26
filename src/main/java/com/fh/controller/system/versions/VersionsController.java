package com.fh.controller.system.versions;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.versions.VersionsService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 类名称：VersionsController
 * 创建人：FH 
 * 创建时间：2017-12-15
 */
@Controller
@RequestMapping(value="/versions")
public class VersionsController extends BaseController {
	
	String menuUrl = "versions/list.do"; //菜单地址(权限用)
	@Resource(name="versionsService")
	private VersionsService versionsService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(String version_name, Integer version_code, String url,
			String revise_content, Integer phone_type, Integer is_compel, Integer status,
			MultipartFile file) throws Exception{
		logBefore(logger, "新增Versions");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData version = new PageData();
		version.put("version_id", this.get32UUID());	//
		version.put("version_name", version_name);
		version.put("version_code", version_code);
		version.put("revise_content", revise_content);
		version.put("phone_type", phone_type);
		version.put("is_compel", is_compel);
		version.put("update_time", DateUtil.getTime());
		version.put("status", status);
		if (file != null && !file.isEmpty()) {
			String sign = FileUpload.getMD5(file);
			version.put("sign", sign);
			String path = FileUpload.uploadImage(file, DateUtil.getDateline() + "");
			version.put("url", path);
			version.put("filesize", file.getSize());
		} else {
			version.put("url", url);
		}
		versionsService.save(version);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Versions");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			versionsService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(Integer vid, String version_id, String version_name, Integer version_code,
			String revise_content, Integer phone_type, Integer is_compel, Integer status, String url,
			MultipartFile file) throws Exception{
		logBefore(logger, "修改Versions");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData version = new PageData();
		version.put("vid", vid);
		version = versionsService.findById(version);
		version.put("version_name", version_name);
		version.put("version_code", version_code);
		version.put("revise_content", revise_content);
		version.put("phone_type", phone_type);
		version.put("is_compel", is_compel);
		version.put("update_time", DateUtil.getTime());
		version.put("status", status);
		if (file != null && !file.isEmpty()) {
			String sign = FileUpload.getMD5(file);
			version.put("sign", sign);
			String path = FileUpload.uploadImage(file, DateUtil.getDateline() + "");
			version.put("url", path);
			version.put("filesize", file.getSize());
		} else {
			version.put("url", url);
		}
		versionsService.edit(version);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Versions");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = versionsService.list(page);	//列出Versions列表
			mv.setViewName("system/versions/versions_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Versions页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/versions/versions_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Versions页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = versionsService.findById(pd);	//根据id读取
			mv.setViewName("system/versions/versions_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Versions");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String data_ids = pd.getString("data_ids");
			if(null != data_ids && !"".equals(data_ids)){
				String Arraydata_ids[] = data_ids.split(",");
				versionsService.deleteAll(Arraydata_ids);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Versions到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("版本名称");	//1
			titles.add("版本编号");	//2
			titles.add("修改内容");	//4
			titles.add("版本文件");	//5
			titles.add("设备类型");	//6
			titles.add("强制更新");	//7
			titles.add("状态");	//8
			dataMap.put("titles", titles);
			List<PageData> varOList = versionsService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).get("version_name") + "");	//1
				vpd.put("var2", varOList.get(i).get("version_code") + "");	//3
				vpd.put("var3", varOList.get(i).get("revise_content") + "");	//4
				vpd.put("var4", varOList.get(i).get("url") + "");	//5
				vpd.put("var5", varOList.get(i).get("phone_type") + "");	//6
				vpd.put("var6", varOList.get(i).get("is_compel") + "");	//7
				vpd.put("var7", varOList.get(i).get("status") + "");	//8
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
