package com.fh.controller.xnb.coins;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.xnb.coins.CoinsService;

/** 
 * 类名称：CoinsController
 * 创建人：FH 
 * 创建时间：2018-09-09
 */
@Controller
@RequestMapping(value="/coins")
public class CoinsController extends BaseController {
	
	String menuUrl = "coins/list.do"; //菜单地址(权限用)
	@Resource(name="coinsService")
	private CoinsService coinsService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
		  /*@RequestParam(value="tpz",required=false) String tpz,*/
			@RequestParam(value="name",required=false) String name,
			@RequestParam(value="money",required=false) String money,
			@RequestParam(value="counts",required=false) String counts,
			@RequestParam(value="max_money",required=false) String max_money,
			@RequestParam(value="min_money",required=false) String min_money,
			@RequestParam(value="up_money",required=false) String up_money
			) throws Exception{
		
		
		logBefore(logger, "新增Coins");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			pd.put("img", ffile + "/" + fileName);				//路径
			//pd.put("NAME", fileName);
		}
		
		pd.put("coins_id", this.get32UUID());	//主键
		pd.put("name", name);	//创建时间
		pd.put("money", money);	//创建时间
		pd.put("counts", counts);	//创建时间
		pd.put("max_money",max_money);	//创建时间
		pd.put("min_money", min_money);	//创建时间
		pd.put("up_money", up_money);	//创建时间
		pd.put("create_time", DateUtil.getTime());	//创建时间
		coinsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Coins");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			coinsService.delete(pd);
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
	public ModelAndView edit(
			   @RequestParam(value="tp",required=false) MultipartFile file,
			  /*@RequestParam(value="tpz",required=false) String tpz,*/
				@RequestParam(value="name",required=false) String name,
				@RequestParam(value="money",required=false) String money,
				@RequestParam(value="counts",required=false) String counts,
				@RequestParam(value="max_money",required=false) String max_money,
				@RequestParam(value="min_money",required=false) String min_money,
				@RequestParam(value="img",required=false) String img,
				@RequestParam(value="coins_id",required=false) String coins_id,
				@RequestParam(value="up_money",required=false) String up_money
			
			) throws Exception{
		logBefore(logger, "修改Coins");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			pd.put("img", ffile + "/" + fileName);				//路径
			//pd.put("NAME", fileName);
		}else{
			pd.put("img", img);	
		}
		
		
		pd.put("coins_id", coins_id);	//创建时间
		pd.put("name", name);	//创建时间
		pd.put("money", money);	//创建时间
		pd.put("counts", counts);	//创建时间
		pd.put("max_money",max_money);	//创建时间
		pd.put("min_money", min_money);	//创建时间
		pd.put("up_money", up_money);	//创建时间
		coinsService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Coins");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = coinsService.list(page);	//列出Coins列表
			mv.setViewName("xnb/coins/coins_list");
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
		logBefore(logger, "去新增Coins页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("xnb/coins/coins_edit");
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
		logBefore(logger, "去修改Coins页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map pd0 = coinsService.findById(pd);	//根据id读取
			mv.setViewName("xnb/coins/coins_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd0);
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
		logBefore(logger, "批量删除Coins");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String data_ids = pd.getString("data_ids");
			if(null != data_ids && !"".equals(data_ids)){
				String Arraydata_ids[] = data_ids.split(",");
				coinsService.deleteAll(Arraydata_ids);
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
