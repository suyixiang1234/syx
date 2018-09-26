package com.fh.service.xnb.reward;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("rewardService")
public class RewardService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 新增
	 */
	public void save(PageData pd)throws Exception{
		dao.save("RewardMapper.save", pd);
	}
	
	/**
	 * 删除
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("RewardMapper.delete", pd);
	}
	
	/**
	 * 修改
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("RewardMapper.edit", pd);
	}
	
	/**
	 *列表
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("RewardMapper.datalistPage", page);
	}
	
	/**
	 *列表(全部)
	 */
	public List<Map> listAll(PageData pd)throws Exception{
		return (List<Map>)dao.findForList("RewardMapper.listAll", pd);
	}
	
	/**
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RewardMapper.findById", pd);
	}
	
	/**
	 * 批量删除
	 */
	public void deleteAll(String[] Arraydata_ids)throws Exception{
		dao.delete("RewardMapper.deleteAll", Arraydata_ids);
	}
	
}

