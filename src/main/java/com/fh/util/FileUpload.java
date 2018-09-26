package com.fh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传文件
 * 创建人：
 * @version
 */
public class FileUpload {
	
	
	
	
	
	
	/**
	 * 图片上传
	 * 
	 * @param image
	 * @return
	 */
	public static String uploadImage(MultipartFile image) {
		String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + DateUtil.getDays(); // 文件上传路径
		String path = fileUp(image, filePath, UuidUtil.get32UUID());
		return DateUtil.getDays() + "/" + path;
	}

	/**
	 * 图片上传
	 * 
	 * @param image
	 * @param filename
	 *            文件名
	 * @return
	 */
	public static String uploadImage(MultipartFile image, String filename) {
		String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + DateUtil.getDays(); // 文件上传路径
		if (filename == null || "".equals(filename)) {
			filename = UuidUtil.get32UUID();
		}
		String path = fileUp(image, filePath, filename);
		return DateUtil.getDays() + "/" + path;
	}
	
	/**
	 * @方法名: getMD5
	 * @描述: TODO 获取一个文件的md5值(可处理大文件)
	 * @param file
	 * @return
	 * @返回类型: String
	 * @修改人：Chensb
	 * @修改时间：Mar 2, 2018 9:04:51 AM @修改备注：
	 */
	public static String getMD5(File file) {
		FileInputStream fileInputStream = null;
		try {
			MessageDigest MD5 = MessageDigest.getInstance("MD5");
			fileInputStream = new FileInputStream(file);
			byte[] buffer = new byte[8192];
			int length;
			while ((length = fileInputStream.read(buffer)) != -1) {
				MD5.update(buffer, 0, length);
			}
			return new String(Hex.encodeHex(MD5.digest()));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @方法名: getMD5
	 * @描述: TODO 获取一个文件的md5值(可处理大文件)
	 * @param file
	 * @return
	 * @返回类型: String
	 * @修改人：Chensb
	 * @修改时间：Mar 2, 2018 9:04:51 AM @修改备注：
	 */
	public static String getMD5(MultipartFile file) {
		// FileInputStream fileInputStream = null;
		InputStream fileInputStream = null;
		try {
			MessageDigest MD5 = MessageDigest.getInstance("MD5");
			fileInputStream = file.getInputStream();
			// fileInputStream = new FileInputStream(file);
			byte[] buffer = new byte[8192];
			int length;
			while ((length = fileInputStream.read(buffer)) != -1) {
				MD5.update(buffer, 0, length);
			}
			return new String(Hex.encodeHex(MD5.digest()));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @param file 			//文件对象
	 * @param filePath		//上传路径
	 * @param fileName		//文件名
	 * @return  文件名
	 */
	public static String fileUp(MultipartFile file, String filePath, String fileName){
		String extName = ""; // 扩展名格式：
		try {
			if (file.getOriginalFilename().lastIndexOf(".") >= 0){
				extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			copyFile(file.getInputStream(), filePath, fileName+extName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName+extName;
	}
	
	/**
	 * 写文件到当前目录的upload目录中
	 * 
	 * @param in
	 * @param fileName
	 * @throws IOException
	 */
	private static String copyFile(InputStream in, String dir, String realName)
			throws IOException {
		File file = new File(dir, realName);
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
}
