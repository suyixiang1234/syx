package com.fh.service.system.dictionaries;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("dictionariesService")
public class DictionariesService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("DictionariesMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("DictionariesMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("DictionariesMapper.findById", pd);
	}
	
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("DictionariesMapper.dictlistPage", page);
		
	}
	
	
	
	//列出全部数据
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DictionariesMapper.listAll", pd);
		
	}
	
	
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("DictionariesMapper.delete", pd);
		
	}

	
	
}
