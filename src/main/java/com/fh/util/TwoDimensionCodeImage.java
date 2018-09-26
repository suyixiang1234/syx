package com.fh.util;

import java.awt.image.BufferedImage;

import jp.sourceforge.qrcode.data.QRCodeImage;

/**
 * 二维码
 * 创建人：FH 创建时间：2015年4月10日
 * @version
 */
public class TwoDimensionCodeImage implements QRCodeImage {

	BufferedImage bufImg;

	public TwoDimensionCodeImage(BufferedImage bufImg) {
		this.bufImg = bufImg;
	}

	public int getHeight() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getPixel(int arg0, int arg1) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getWidth() {
		// TODO Auto-generated method stub
		return 0;
	}

	/*@Override
	public int getHeight() {
		return bufImg.getHeight();
	}

	@Override
	public int getPixel(int x, int y) {
		return bufImg.getRGB(x, y);
	}

	@Override
	public int getWidth() {
		return bufImg.getWidth();
	}*/

}
