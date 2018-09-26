package com.fh.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.util.JSONPObject;

import net.sf.json.JSONObject;

public class AppUtil {

	protected static Logger logger = Logger.getLogger(AppUtil.class);

	public static void main(String[] args) {
		PageData pd = new PageData();
		pd.put("username", "zhangsan");

		checkParam("registered", pd);
	}

	// 检查参数是否完整
	public static boolean checkParam(String method, PageData pd) {
		boolean result = false;

		int falseCount = 0;
		String[] paramArray = new String[20];
		String[] valueArray = new String[20];
		String[] tempArray = new String[20]; // 临时数组

		if (method == "registered") {// 注册
			paramArray = Const.APP_REGISTERED_PARAM_ARRAY; // 参数
			valueArray = Const.APP_REGISTERED_VALUE_ARRAY; // 参数名称

		} else if (method == "getAppuserByUsernmae") {// 根据用户名获取会员信息
			paramArray = Const.APP_GETAPPUSER_PARAM_ARRAY;
			valueArray = Const.APP_GETAPPUSER_VALUE_ARRAY;
		}

		int size = paramArray.length;
		for (int i = 0; i < size; i++) {
			String param = paramArray[i];
			if (!pd.containsKey(param)) {
				tempArray[falseCount] = valueArray[i] + "--" + param;
				falseCount += 1;
			}
		}

		if (falseCount > 0) {
			logger.error(method + "接口，请求协议中缺少 " + falseCount + "个 参数");
			for (int j = 1; j <= falseCount; j++) {
				logger.error("   第" + j + "个：" + tempArray[j - 1]);
			}
		} else {
			result = true;
		}

		return result;
	}

	/**
	 * 设置分页的参数
	 * 
	 * @param pd
	 * @return
	 */
	public static PageData setPageParam(PageData pd) {
		String page_now_str = pd.get("page_now").toString();
		int pageNowInt = Integer.parseInt(page_now_str) - 1;
		String page_size_str = pd.get("page_size").toString(); // 每页显示记录数
		int pageSizeInt = Integer.parseInt(page_size_str);

		String page_now = pageNowInt + "";
		String page_start = (pageNowInt * pageSizeInt) + "";

		pd.put("page_now", page_now);
		pd.put("page_start", page_start);

		return pd;
	}

	/**
	 * 设置list中的distance
	 */
	public static List<PageData> setListDistance(List<PageData> list, PageData pd) {
		List<PageData> listReturn = new ArrayList<PageData>();
		String user_longitude = "";
		String user_latitude = "";

		try {
			user_longitude = pd.get("user_longitude").toString(); // "117.11811";
			user_latitude = pd.get("user_latitude").toString(); // "36.68484";
		} catch (Exception e) {
			logger.error("缺失参数--user_longitude和user_longitude");
			logger.error("lost param：user_longitude and user_longitude");
		}

		PageData pdTemp = new PageData();
		int size = list.size();
		for (int i = 0; i < size; i++) {
			pdTemp = list.get(i);
			String longitude = pdTemp.get("longitude").toString();
			String latitude = pdTemp.get("latitude").toString();
			String distance = MapDistance.getDistance(user_longitude, user_latitude, longitude, latitude);
			pdTemp.put("distance", distance);
			pdTemp.put("size", distance.length());
			listReturn.add(pdTemp);
		}

		return listReturn;
	}

	/**
	 * 普通接口返回
	 * 
	 * @param status
	 *            0 代表失败 1 代表成功 2 代表令牌过期
	 * @param message
	 *            提示信息
	 * @param result
	 *            成功返回数据
	 * 
	 */
	public static Object getResult(int status, String message, Object result) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		if (result == null) {
			result = new JSONObject();
		}
		map.put("result", result);
		map.put("message", message);
		return map;
	}

	/**
	 * @param status
	 *            0 代表失败 1 代表成功 2 代表令牌过期
	 * @param message
	 *            提示信息
	 * @param result
	 *            成功返回数据
	 * @param total_page
	 *            总页数
	 * @param curre_page
	 *            当前页
	 */
	public static Object getPageResult(int status, String message, Object result, Integer total_page,
			Integer curre_page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		if (result == null) {
			result = new JSONObject();
		}
		map.put("result", result);
		map.put("message", message);
		map.put("current_page", curre_page);
		map.put("total_page", total_page);
		return map;
	}

	public static Object returnObject(PageData pd, Map map) {
		if (pd.containsKey("callback")) {
			String callback = pd.get("callback").toString();
			return new JSONPObject(callback, map);
		} else {
			return map;
		}
	}
}
