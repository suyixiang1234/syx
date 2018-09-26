package com.fh.service.system.versions;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

@Service("versionsService")
public class VersionsService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/** redis模板 */
	@Resource(name = "jedisTemplate")
	public RedisTemplate redisTemplate;

	/**
	 * 新增
	 */
	public void save(PageData pd) throws Exception {
		dao.save("VersionsMapper.save", pd);
	}

	/**
	 * 删除
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("VersionsMapper.delete", pd);
	}

	/**
	 * 修改
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("VersionsMapper.edit", pd);
	}

	/**
	 * 列表
	 */
	public List<PageData> list(Page page) throws Exception {
		page.getPd().put("path", PathUtil.PathAddress()+Const.FILEPATHIMG);
		return (List<PageData>) dao.findForList("VersionsMapper.datalistPage", page);
	}

	/**
	 * 列表(全部)
	 */
	public List<PageData> listAll(PageData pd) throws Exception {
		pd.put("path", PathUtil.PathAddress()+Const.FILEPATHIMG);
		return (List<PageData>) dao.findForList("VersionsMapper.listAll", pd);
	}

	/**
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd) throws Exception {
		pd.put("path", PathUtil.PathAddress()+Const.FILEPATHIMG);
		return (PageData) dao.findForObject("VersionsMapper.findById", pd);
	}

	/**
	 * 获取最新版本
	 */
	public PageData findNewest(PageData pd) throws Exception {
		pd.put("path", PathUtil.PathAddress()+Const.FILEPATHIMG);
		return (PageData) dao.findForObject("VersionsMapper.findNewest", pd);
	}

	/**
	 * 批量删除
	 */
	public void deleteAll(String[] Arraydata_ids) throws Exception {
		dao.delete("VersionsMapper.deleteAll", Arraydata_ids);
	}

	/**
	 * 检查版本
	 * 
	 * @param version_code
	 *            当前安装的app版本号
	 * @param phone_type
	 *            设备类型：1：ios；0：Android；
	 * @return
	 * @throws Exception
	 */
	public Object checkVersion(PageData pd) throws Exception {
		if (pd.get("version_code") == null || "".equals(pd.get("version_code")) || pd.get("phone_type") == null
				|| "".equals(pd.get("phone_type"))) {
			return AppUtil.getResult(0, "缺少参数", null);
		}
		Integer version_code = Integer.valueOf(pd.get("version_code") + "");
		PageData version = this.findNewest(pd);
		Integer newestCode = Integer.valueOf((version == null ? 0 : version.get("version_code")) + "");
		if (newestCode > version_code) {
			return AppUtil.getResult(1, "有新版本", version);
		} else {
			return AppUtil.getResult(1, "已是最新版本", version);
		}
	}
}
