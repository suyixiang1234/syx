package com.fh.service.xnb.chongzhi;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;


@Service("chongzhiService")
public class ChongzhiService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 新增
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ChongzhiMapper.save", pd);
	}
	
	/**
	 * 删除
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ChongzhiMapper.delete", pd);
	}
	
	/**
	 * 修改
	 */
	public void edit(PageData pd)throws Exception{
		
		if (pd.getString("PARENT_ID")!=null && !"".equals(pd.getString("PARENT_ID"))) {
			double moneys = Double.parseDouble(pd.getString("moneys"));
			double rates = Double.parseDouble(Tools.readTxtFile(Const.HOST));//奖励比例
			double jl = moneys*rates;
	        pd.put("jl", jl);	
	        dao.update("AppuserMapper.editU3", pd);
	        PageData pdr = new PageData();
	        pdr.put("reward_id", UuidUtil.get32UUID());
	        pdr.put("user_id",  pd.getString("PARENT_ID"));//推薦人 （推荐码代替）
	        pdr.put("xuser_id", pd.getString("user_id"));//下線ID
	        pdr.put("jmoneys",pd.get("moneys"));//充值金额
	        pdr.put("moneys",jl);//獎勵金額
	        pdr.put("rates", rates);//奖励比例
			pdr.put("times", DateUtil.getTime());
	        dao.save("RewardMapper.save", pdr);
		}
		dao.update("AppuserMapper.editU7", pd);
		dao.update("ChongzhiMapper.edit", pd);
	}
	
	/**
	 *列表
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ChongzhiMapper.datalistPage", page);
	}
	
	/**
	 *列表(全部)
	 */
	public List<Map> listAll(PageData pd)throws Exception{
		return (List<Map>)dao.findForList("ChongzhiMapper.listAll", pd);
	}
	
	/**
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ChongzhiMapper.findById", pd);
	}
	
	/**
	 * 批量删除
	 */
	public void deleteAll(String[] Arraydata_ids)throws Exception{
		dao.delete("ChongzhiMapper.deleteAll", Arraydata_ids);
	}
	
}

