package com.fh.service.system.creataTable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.util.PageData;

@Service("createTableService")
public class CreateTableService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 创建表
	 */
	public void createTable(PageData pd) throws Exception {
		dao.update("CreateTableMapper.createTable", pd);
	}

}
