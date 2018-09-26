package com.fh.service.system.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.PageData;


@Service("userService")
public class UserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 通过id获取数据
	*/
	public PageData findByUiId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserXMapper.findByUiId", pd);
	}
	/*
	* 通过loginname获取数据
	*/
	public PageData findByUId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserXMapper.findByUId", pd);
	}
	
	/*
	* 通过邮箱获取数据
	*/
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserXMapper.findByUE", pd);
	}
	
	/*
	* 通过编号获取数据
	*/
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserXMapper.findByUN", pd);
	}
	
	/*
	* 保存用户
	*/
	public void saveU(PageData pd)throws Exception{
		dao.save("UserXMapper.saveU", pd);
	}
	/*
	* 修改用户
	*/
	public void editU(PageData pd)throws Exception{
		dao.update("UserXMapper.editU", pd);
	}
	/*
	* 换皮肤
	*/
	public void setSKIN(PageData pd)throws Exception{
		dao.update("UserXMapper.setSKIN", pd);
	}
	/*
	* 删除用户
	*/
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserXMapper.deleteU", pd);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserXMapper.deleteAllU", USER_IDS);
	}
	
	/**
	 * 通过用户id删除用户和标签的所有绑定
	 * @方法名: deleteAllTagBind 
	 * @描述: TODO
	 * @param Arraydata_ids
	 * @throws Exception
	 * @返回类型: void
	 * @修改人：
	 * @修改时间：
	 * @修改备注：
	 */
	public void deleteAllTagBind(String[] Arraydata_ids)throws Exception{
		dao.delete("UserXMapper.deleteAllTagBind", Arraydata_ids);
	}
	
	/**
	 * 通过用户id删除用户和锚点的所有绑定
	 * @方法名: deleteAllAnchorBind 
	 * @描述: TODO
	 * @param Arraydata_ids
	 * @throws Exception
	 * @返回类型: void
	 * @修改人：
	 * @修改时间：
	 * @修改备注：
	 */
	public void deleteAllAnchorBind(String[] Arraydata_ids)throws Exception{
		dao.delete("UserXMapper.deleteAllAnchorBind", Arraydata_ids);
	}
	
	
	/*
	*用户列表(用户组)
	*/
	public List<PageData> listPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.userlistPage", page);
	}
	
	/*
	*用户列表(用户组)连接了用户和锚点绑定表
	*/
	public List<PageData> listPdPageUser2(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.userlistPage2", page);
	}
	
	/*
	*用户列表(用户组)连接了用户和标签绑定表
	*/
	public List<PageData> listPdPageUser3(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.userlistPage3", page);
	}
	
	/*
	*用户列表(全部)
	*/
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.listAllUser", pd);
	}
	
	/*
	*用户列表MQtt
	*/
	public List<PageData> listAllMqttUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.listAllMqttUser", pd);
	}
	
	/*
	*用户列表(供应商用户)
	*/
	public List<PageData> listGPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.userGlistPage", page);
	}
	/*
	* 保存用户IP
	*/
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserXMapper.saveIP", pd);
	}
	
	/*
	* 登录判断
	*/
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserXMapper.getUserInfo", pd);
	}
	/*
	* 跟新登录时间
	*/
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserXMapper.updateLastLogin", pd);
	}
	
	/*
	*通过id获取数据
	*/
	public User getUserAndRoleById(String USER_ID) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID);
	}

	/**
	 * 统计用户数量
	 * @方法名: countUserNum 
	 * @描述: TODO
	 * @param pd
	 * @return
	 * @throws Exception
	 * @返回类型: int
	 * @修改人：
	 * @修改时间：
	 * @修改备注：
	 */
	public int countUserNum(PageData pd) throws Exception {
		Object obj = dao.findForObject("UserMapper.countUserNum", pd);
		int count = 0;
		count = obj==null?0:Integer.parseInt(obj.toString());
		return count;
	}
	
	/**
	 * 统计部门用户数量，有传递部门路径则统计部门下所有用户（包括所有下级部门的用户数）
	 * @方法名: countAllUserNum 
	 * @描述: TODO
	 * @param pd
	 * @return
	 * @throws Exception
	 * @返回类型: int
	 * @修改人：
	 * @修改时间：
	 * @修改备注：
	 */
	public int countAllUserNum(PageData pd) throws Exception {
		Object obj = dao.findForObject("UserMapper.countAllUserNum", pd);
		int count = 0;
		count = obj==null?0:Integer.parseInt(obj.toString());
		return count;
	}
	
}
