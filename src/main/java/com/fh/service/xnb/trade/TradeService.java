package com.fh.service.xnb.trade;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;


@Service("tradeService")
public class TradeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 买入
	 */
	public void save(PageData pd)throws Exception{
		dao.update("AppuserMapper.editByMoneys", pd);
		dao.save("TradeMapper.save", pd);
		PageData pds = (PageData)dao.findForObject("TradeMapper.findByCountUser", pd);
		//判断币值是否存在，第一条执行加操作，而后更新操作
		if (pds==null) {
			pd.put("counts_user_id", UuidUtil.get32UUID());
			dao.save("TradeMapper.saveCountUser", pd);
		}else{
			dao.update("TradeMapper.editCountUser", pd);
		}
	}
	
	
	/**
	 * 买出
	 */
	public void saveMc(PageData pd)throws Exception{
		dao.update("AppuserMapper.editBySellMoneys", pd);
		dao.save("TradeMapper.save", pd);
		dao.update("TradeMapper.editSellCountUser", pd);
	}
	
	
	
	/**
	 * 通过id获取数据
	 */
	public PageData findByCountUser(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TradeMapper.findByCountUser", pd);
	}
	
	
	/**
	 * 删除
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TradeMapper.delete", pd);
	}
	
	/**
	 * 修改
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TradeMapper.edit", pd);
	}
	
	/**
	 *列表
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TradeMapper.datalistPage", page);
	}
	
	/**
	 *列表
	 */
	public List<Map> list1(Page page)throws Exception{
		return (List<Map>)dao.findForList("TradeMapper.datalistPage1", page);
	}
	
	
	/**
	 *列表(全部)
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TradeMapper.listAll", pd);
	}
	
	/**
	 *列表(全部)
	 */
	public List<Map> listAllByUserId(PageData pd)throws Exception{
		return (List<Map>)dao.findForList("TradeMapper.listAllByUserId", pd);
	}
	
	
	/**
	 *列表(会员资产)
	 */
	public List<Map> listAllByCoin(PageData pd)throws Exception{
		return (List<Map>)dao.findForList("TradeMapper.listAllByCoin", pd);
	}
	
	
	/**
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TradeMapper.findById", pd);
	}
	
	/**
	 * 批量删除
	 */
	public void deleteAll(String[] Arraydata_ids)throws Exception{
		dao.delete("TradeMapper.deleteAll", Arraydata_ids);
	}
	
}

