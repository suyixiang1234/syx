package com.fh.service.xnb.coins;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("coinsService")
public class CoinsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 新增
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CoinsMapper.save", pd);
	}
	
	/**
	 * 删除
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CoinsMapper.delete", pd);
	}
	
	/**
	 * 修改
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CoinsMapper.edit", pd);
	}
	
	
	/**
	 * 
	 */
	public void edit1(PageData pd)throws Exception{
		dao.update("CoinsMapper.edit1", pd);
	}
	
	/**
	 *列表
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CoinsMapper.datalistPage", page);
	}
	
	/**
	 *列表(全部)
	 */
	public List<Map> listAll(PageData pd)throws Exception{
		return (List<Map>)dao.findForList("CoinsMapper.listAll", pd);
	}
	
	/**
	 * 通过id获取数据
	 */
	public Map findById(PageData pd)throws Exception{
		return (Map)dao.findForObject("CoinsMapper.findById", pd);
	}
	
	/**
	 * 批量删除
	 */
	public void deleteAll(String[] Arraydata_ids)throws Exception{
		dao.delete("CoinsMapper.deleteAll", Arraydata_ids);
	}
	
}

