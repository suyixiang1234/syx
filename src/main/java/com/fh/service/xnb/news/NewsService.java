package com.fh.service.xnb.news;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("newsService")
public class NewsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 新增
	 */
	public void save(PageData pd)throws Exception{
		dao.save("NewsMapper.save", pd);
	}
	
	/**
	 * 删除
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("NewsMapper.delete", pd);
	}
	
	/**
	 * 修改
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("NewsMapper.edit", pd);
	}
	
	/**
	 *列表
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("NewsMapper.datalistPage", page);
	}
	
	/**
	 *列表(全部)
	 */
	public List<Map> listAll(PageData pd)throws Exception{
		return (List<Map>)dao.findForList("NewsMapper.listAll", pd);
	}
	
	/**
	 * 通过id获取数据
	 */
	public Map findById(PageData pd)throws Exception{
		return (Map)dao.findForObject("NewsMapper.findById", pd);
	}
	
	/**
	 * 批量删除
	 */
	public void deleteAll(String[] Arraydata_ids)throws Exception{
		dao.delete("NewsMapper.deleteAll", Arraydata_ids);
	}
	
}

