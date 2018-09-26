package com.fh.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tools {
	
	/**
	 * 随机生成六位数验证码 
	 * @return
	 */
	public static int getRandomNum(){
		 Random r = new Random();
		 return r.nextInt(900000)+100000;//(Math.random()*(999999-100000)+100000)
	}
	
	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
	
	/**
	 * 字符串转换为字符串数组
	 * @param str 字符串
	 * @param splitRegex 分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str,String splitRegex){
		if(isEmpty(str)){
			return null;
		}
		return str.split(splitRegex);
	}
	
	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * @param str	字符串
	 * @return
	 */
	public static String[] str2StrArray(String str){
		return str2StrArray(str,",\\s*");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String date2Str(Date date){
		return date2Str(date,"yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date str2Date(String date){
		if(notEmpty(date)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		}else{
			return null;
		}
	}
	
	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date,String format){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}else{
			return "";
		}
	}
	
	/**
	 * 把时间根据时、分、秒转换为时间段
	 * @param StrDate
	 */
	public static String getTimes(String StrDate){
		String resultTimes = "";
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    java.util.Date now;
	    
	    try {
	    	now = new Date();
	    	java.util.Date date=df.parse(StrDate);
	    	long times = now.getTime()-date.getTime();
	    	long day  =  times/(24*60*60*1000);
	    	long hour = (times/(60*60*1000)-day*24);
	    	long min  = ((times/(60*1000))-day*24*60-hour*60);
	    	long sec  = (times/1000-day*24*60*60-hour*60*60-min*60);
	        
	    	StringBuffer sb = new StringBuffer();
	    	//sb.append("发表于：");
	    	if(hour>0 ){
	    		sb.append(hour+"小时前");
	    	} else if(min>0){
	    		sb.append(min+"分钟前");
	    	} else{
	    		sb.append(sec+"秒前");
	    	}
	    		
	    	resultTimes = sb.toString();
	    } catch (ParseException e) {
	    	e.printStackTrace();
	    }
	    
	    return resultTimes;
	}
	
	/**
	 * 写txt里的单行内容
	 * @param filePath  文件路径
	 * @param content  写入的内容
	 */
	public static void writeFile(String fileP,String content){
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
		filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
		if(filePath.indexOf(":") != 1){
			filePath = File.separator + filePath;
		}
		try {
	        OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(filePath),"utf-8");      
	        BufferedWriter writer=new BufferedWriter(write);          
	        writer.write(content);      
	        writer.close(); 

	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	  * 验证邮箱
	  * @param email
	  * @return
	  */
	 public static boolean checkEmail(String email){
	  boolean flag = false;
	  try{
	    String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	    Pattern regex = Pattern.compile(check);
	    Matcher matcher = regex.matcher(email);
	    flag = matcher.matches();
	   }catch(Exception e){
	    flag = false;
	   }
	  return flag;
	 }
	
	 /**
	  * 验证手机号码
	  * @param mobiles
	  * @return
	  */
	 public static boolean checkMobileNumber(String mobileNumber){
	  boolean flag = false;
	  try{
	    Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
	    Matcher matcher = regex.matcher(mobileNumber);
	    flag = matcher.matches();
	   }catch(Exception e){
	    flag = false;
	   }
	  return flag;
	 }
	 
	/**
	 * 检测KEY是否正确
	 * @param paraname  传入参数
	 * @param FKEY		接收的 KEY
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean checkKey(String paraname, String FKEY){
		paraname = (null == paraname)? "":paraname;
		return MD5.md5(paraname+DateUtil.getDays()+",fh,").equals(FKEY);
	}
	 
	/**
	 * 读取txt里的单行内容
	 * @param filePath  文件路径
	 */
	public static String readTxtFile(String fileP) {
		try {
			
			String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
			filePath = filePath.replaceAll("file:/", "");
			filePath = filePath.replaceAll("%20", " ");
			filePath = filePath.trim() + fileP.trim();
			if(filePath.indexOf(":") != 1){
				filePath = File.separator + filePath;
			}
			String encoding = "utf-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { 		// 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
				new FileInputStream(file), encoding);	// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					return lineTxt;
				}
				read.close();
			}else{
				System.out.println("找不到指定的文件,查看此路径是否正确:"+filePath);
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
		}
		return "";
	}
	
	
	
	
	/** 
	 * 字符串转换成十六进制字符串 
	 */  
	  
	public static String str2HexStr(String str) {  
	  
	    char[] chars = "0123456789ABCDEF".toCharArray();  
	    StringBuilder sb = new StringBuilder("");  
	    byte[] bs = str.getBytes();  
	    int bit;  
	    for (int i = 0; i < bs.length; i++) {  
	        bit = (bs[i] & 0x0f0) >> 4;  
	        sb.append(chars[bit]);  
	        bit = bs[i] & 0x0f;  
	        sb.append(chars[bit]);  
	    }  
	    return sb.toString();  
	}  
	  
	/** 
	 *  
	 * 十六进制转换字符串 
	 */  
	  
	public static String hexStr2Str(String hexStr) {  
	    String str = "0123456789ABCDEF";  
	    char[] hexs = hexStr.toCharArray();  
	    byte[] bytes = new byte[hexStr.length() / 2];  
	    int n;  
	    for (int i = 0; i < bytes.length; i++) {  
	        n = str.indexOf(hexs[2 * i]) * 16;  
	        n += str.indexOf(hexs[2 * i + 1]);  
	        bytes[i] = (byte) (n & 0xff);  
	    }  
	    return new String(bytes);  
	}  
	  
	/** 
	 * bytes转换成十六进制字符串 
	 */  
	public static String byte2HexStr(byte[] b) {  
	    String hs = "";  
	    String stmp = "";  
	    for (int n = 0; n < b.length; n++) {  
	        stmp = (Integer.toHexString(b[n] & 0XFF));  
	        if (stmp.length() == 1)  
	            hs = hs + "0" + stmp;  
	        else  
	            hs = hs + stmp;  
	        // if (n<b.length-1) hs=hs+":";  
	    }  
	    return hs.toUpperCase();  
	}  
	  
	private static byte uniteBytes(String src0, String src1) {  
	    byte b0 = Byte.decode("0x" + src0).byteValue();  
	    b0 = (byte) (b0 << 4);  
	    byte b1 = Byte.decode("0x" + src1).byteValue();  
	    byte ret = (byte) (b0 | b1);  
	    return ret;  
	}  
	  
	/** 
	 * bytes转换成十六进制字符串 
	 */  
	public static byte[] hexStr2Bytes(String src) {  
	    int m = 0, n = 0;  
	    int l = src.length() / 2;  
	    System.out.println(l);  
	    byte[] ret = new byte[l];  
	    for (int i = 0; i < l; i++) {  
	        m = i * 2 + 1;  
	        n = m + 1;  
	        ret[i] = uniteBytes(src.substring(i * 2, m), src.substring(m, n));  
	    }  
	    return ret;  
	}  
	  
	/** 
	 *String的字符串转换成unicode的String 
	 */  
	public static String str2Unicode(String strText) throws Exception {  
	    char c;  
	    String strRet = "";  
	    int intAsc;  
	    String strHex;  
	    for (int i = 0; i < strText.length(); i++) {  
	        c = strText.charAt(i);  
	        intAsc = (int) c;  
	        strHex = Integer.toHexString(intAsc);  
	        if (intAsc > 128) {  
	            strRet += "//u" + strHex;  
	        } else {  
	            // 低位在前面补00  
	            strRet += "//u00" + strHex;  
	        }  
	    }  
	    return strRet;  
	}  
	  
	/** 
	 *unicode的String转换成String的字符串 
	 */  
	public static String unicode2Str(String hex) {  
	    int t = hex.length() / 6;  
	    StringBuilder str = new StringBuilder();  
	    for (int i = 0; i < t; i++) {  
	        String s = hex.substring(i * 6, (i + 1) * 6);  
	        // 高位需要补上00再转  
	        String s1 = s.substring(2, 4) + "00";  
	        // 低位直接转  
	        String s2 = s.substring(4);  
	        // 将16进制的string转为int  
	        int n = Integer.valueOf(s1, 16) + Integer.valueOf(s2, 16);  
	        // 将int转换为字符  
	        char[] chars = Character.toChars(n);  
	        str.append(new String(chars));  
	    }  
	    return str.toString();  
	}  
	
	
	
	
	
	
    /**
     * @param strHanzi 传进中文字符串
     * @return 返回十六进制的字符串
     * @创建时间：2013-2-1下午9:07:02
     * @功能说明：中文字符串转为十六进制字符串
     */
    public final static String castHanziStringToHexString(String strHanzi) {
        String strRet = "";
        try {
            byte[] bye = strHanzi.getBytes("GBK");
            strRet = castBytesToHexString(bye);
        } catch (Exception ex) {

        }
        return strRet;
    }

    

    public final static Integer find00FromHexString(String strHexData, int startIndex) {
        if (strHexData != null) {
            int intLen = strHexData.length();
            for (int i = startIndex; i < intLen; i = i + 2) {
                String hexdata = strHexData.substring(i, i + 2);
                if (hexdata.equals("00")) {
                    return i;
                }
            }
            return null;
        } else {
            return null;
        }
    }


    /**
     * @方法说明：byte数组转换为十六进制字符串
     * @创建日期：2013-2-4下午2:24:40
     * @参数byeData：要转换的byte数组
     * @return说明：返回转换后的字符串
     */
    public final static String castBytesToHexString(byte[] byeData) {

        String strRet = null;
        int intLen = byeData.length;
        for (int i = 0; i < intLen; i++) {
            byte byeTemp = byeData[i];

            String strHexTemp = Integer.toHexString(byeTemp);
            if (strHexTemp.length() > 2) {
                strHexTemp = strHexTemp.substring(strHexTemp.length() - 2);
            } else if (strHexTemp.length() < 2) {
                strHexTemp = "0" + strHexTemp;
            }
            if (i == 0) {
                strRet = strHexTemp;
            } else {
                strRet = strRet + strHexTemp;
            }
        }
        strRet = strRet.toUpperCase();
        return strRet;
    }

    /**
     * @方法说明：十六进制字符串的经度、纬度转换为浮点数字符串的经度、纬度，一般由广嘉GPS协议使用
     * @创建日期：2013-2-1下午12:13:49
     * @参数strHexTude：要转换的十六进制经度或者纬度数据
     * @参数intEffect：保留的小数点位数
     * @return说明：返回十进制的小数点字符串经度或者纬度
     */
    public final static String castHexStringToDcmStringGalaxyTude(
            String strHexTude, int intEffect) {
        String strFloatTude = null;
        Long lngNum = Long.parseLong(strHexTude, 16);
        if (lngNum == 0) {
            return "0";
        }
        String strDcmTude = String.valueOf(lngNum);
        int intLen = strDcmTude.length();
        String strReal = strDcmTude.substring(intLen - intEffect);
        String strDecimals = strDcmTude.substring(0, intLen - intEffect);
        strFloatTude = strDecimals + "." + strReal;
        return strFloatTude;
    }

    /**
     * @方法说明：十六进制字符串的经度、纬度转换为浮点数字符串的经度、纬度，一般由标准协议使用
     * @创建日期：2013-2-4下午3:01:04
     * @参数strHexTude：要转换的十六进制经度或者纬度数据
     * @return说明：返回十进制的小数点字符串经度或者纬度
     */
    public final static String castHexStringToDcmStringNormTude(
            String strHexTude) {
        String strFloatTude = null;
        strHexTude.replace(" ", "");
        String strHexD = strHexTude.substring(0, 2);
        String strHexF = strHexTude.substring(2, 4);
        String strHexM = strHexTude.substring(4, 6);
        String strHexMM = strHexTude.substring(6, 8);

     
        return strFloatTude;
    }

    /**
     * @方法说明：私有方法，一般在十进制数字转换十六进制数字的时候使用
     * @创建日期：2013-2-1下午4:54:35
     * @参数intData：传入16进制中，10--15数字
     * @return说明：返回ABCDEF
     */
    private final static String shuZhiToZhiMu(int intData) {
        String strRet = "";
        switch (intData) {
            case 10:
                strRet = "A";
                break;
            case 11:
                strRet = "B";
                break;
            case 12:
                strRet = "C";
                break;
            case 13:
                strRet = "D";
                break;
            case 14:
                strRet = "E";
                break;
            case 15:
                strRet = "F";
                break;
            default:
                strRet = "" + intData;
                break;
        }
        return strRet;
    }

    /**
     * @方法说明：十进制整型转十六进制字符串
     * @创建日期：2013-2-1下午5:16:05
     * @参数intDcmData：传入要转换的十进制整型
     * @return说明：返回十六进制字符串
     */
    public final static String castDcmIntToHexString(long intDcmData) {
        String str = "";
        // 1:用a去除以16，得到商和余数
        long sun = intDcmData / 16;
        int yuShu = (int) (intDcmData % 16);
        str = "" + shuZhiToZhiMu(yuShu);
        while (sun > 0) {
            // 2：继续用商去除以16，得到商和余数
            yuShu = (int) (sun % 16);
            sun = sun / 16;
            // 3：如果商为0，那么就终止
            // 4：把所有的余数倒序排列
            str = shuZhiToZhiMu(yuShu) + str;
        }
        return str;
    }

    /**
     * @方法说明:十进制字符串转十六进制字符串
     * @创建日期：2013-2-1下午5:14:42
     * @参数strDcmData：十进制数字字符串
     * @参数intBytes：转化后的字节数
     * @return说明：返回十六进制数据字符串
     */
    public final static String castDcmStringToHexString(String strDcmData,
                                                        int intBytes) {
        String strRet = null;
        long intNum = Long.parseLong(strDcmData, 10);
        String strHexData = castDcmIntToHexString(intNum);
        String strTempRet = String.valueOf(strHexData);
        int intLen = strTempRet.length();
        int intTempBytes = intBytes * 2 - intLen;
        String strTempByte = null;
        for (int i = 0; i < intTempBytes; i++) {
            if (strTempByte == null) {
                strTempByte = "0";
            } else {
                strTempByte = strTempByte + "0";
            }
        }
        if (strTempByte == null) {
            strRet = strTempRet;
        } else {
            strRet = strTempByte + strTempRet;
        }
        return strRet;
    }
    
    
    
    
    /**
     * 十六转二进制
     * @param hex 十六进制字符串
     * @return 二进制字符串
     */
    public static String castHexStringToBinary(String hex) {
        hex = hex.toUpperCase();
        String result = "";
        int max = hex.length();
        for (int i = 0; i < max; i++) {
            char c = hex.charAt(i);
            switch (c) {
                case '0':
                    result += "0000";
                    break;
                case '1':
                    result += "0001";
                    break;
                case '2':
                    result += "0010";
                    break;
                case '3':
                    result += "0011";
                    break;
                case '4':
                    result += "0100";
                    break;
                case '5':
                    result += "0101";
                    break;
                case '6':
                    result += "0110";
                    break;
                case '7':
                    result += "0111";
                    break;
                case '8':
                    result += "1000";
                    break;
                case '9':
                    result += "1001";
                    break;
                case 'A':
                    result += "1010";
                    break;
                case 'B':
                    result += "1011";
                    break;
                case 'C':
                    result += "1100";
                    break;
                case 'D':
                    result += "1101";
                    break;
                case 'E':
                    result += "1110";
                    break;
                case 'F':
                    result += "1111";
                    break;
            }
        }
        return result;
    }
	
    
    /**
     * 十转二进制
     * @return 二进制字符串
     */
    public static String castshiStringToBinary(int s) {
          
    	    String result="0000";
    	    switch (s) {
                case 0:
                    result = "0000";
                    break;
                case 1:
                    result = "0001";
                    break;
                case 2:
                    result = "0010";
                    break;
                case 3:
                    result = "0011";
                    break;
                case 4:
                    result = "0100";
                    break;
                case 5:
                    result = "0101";
                    break;
                case 6:
                    result = "0110";
                    break;
                case 7:
                    result = "0111";
                    break;
                case 8:
                    result = "1000";
                    break;
                case 9:
                    result = "1001";
                    break;
                case 10:
                    result = "1010";
                    break;
                case 11:
                    result = "1011";
                    break;
                case 12:
                    result = "1100";
                    break;
                case 13:
                    result = "1101";
                    break;
                case 14:
                    result = "1110";
                    break;
                case 15:
                    result = "1111";
                    break;
    	    }
        return result;
    }
    
    
	
    /**
     * 二进制取反 
     * @return 二进制字符串
     */
    public static String castHexStringToFan(String hex) {
        String result = "";
        int max = hex.length();
        for (int i = 0; i < max; i++) {
            char c = hex.charAt(i);
            
            if (c=='0') {
            	 result += "1";
			}
            if (c=='1') {
            	 result += "0";
			}
        }
        return result;
    }
	
	
	
    /** 
     * @方法说明：十六进制字符串String转十进制字符串String 
     * @创建日期：2013-1-31下午1:21:48 
     * @参数strHexData：传入十六进制字符串 
     * @return说明：返回十进制字符串 
     */  
    public final static String castHexStringToDcmString(String strHexData) {  
        String strDcmData = null;  
        Long lngNum = Long.parseLong(strHexData, 16);  
        strDcmData = String.valueOf(lngNum);  
        return strDcmData;  
    }
	
	
	
    /**
     * 十六进制转有符号数转十进制
     * @return 
     */
    public static int castHexTagStringToshi(String hex16) {
		int result = 0; 
		String hex = castHexStringToBinary(hex16);//取反前二进制
		String hexf = castHexStringToFan(hex);//取反后的二进制
		String hexfq = hexf.substring(0, hexf.length()-4);
		String hexfz = hexf.substring(hexf.length()-4, hexf.length());//截取后4位
		int ints =  Integer.parseInt(hexfz,2)+1;//加1操作
		String hexfh = castshiStringToBinary(ints);//取反后加1后的二进制
		String result0 = hexfq+hexfh;//结果拼接
		int re = Integer.parseInt(result0,2);//最后再转为10进制
		if ("1".equals(hex.substring(0, 1))) {
			result = -re;
		}else{
			result = re;
		}
    	return result;
    }
    
    
    
    
	
/*    public static int castHexTagStringToshi(String hex16) {
		int result = 0; 
		String hex = castHexStringToBinary(hex16);//取反前二进制
		String index1 = hex.substring(0, 1);//截取第一位 判断符号位
		String hexf = castHexStringToFan(hex);//取反后的二进制
		String hexfq = hexf.substring(0, hexf.length()-4);
		String hexfz = hexf.substring(hexf.length()-4, hexf.length());//截取后4位
		int ints =  Integer.parseInt(hexfz,2)+1;//加1操作
		String hexfh = castshiStringToBinary(ints);//取反后加1后的二进制
		String result0 = hexfq+hexfh;//结果拼接
		int re = Integer.parseInt(result0,2);//最后再转为10进制
		if ("1".equals(index1)) {
			result = -re;
		}else{
			result = re;
		}
    	return result;
    }*/
	
	
	
	
	public static void main(String[] args) {
		//System.out.println(getRandomNum());
		System.out.println("16进制有符号转10进制结果："+castHexTagStringToshi("B7"));
		
	}
	
}
