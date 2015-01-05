package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Upload {

	/**
	 * 上传文件
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	public static void upload(String savePath, String fileName, File file)
			throws Exception {
		FileOutputStream fos = new FileOutputStream(savePath + File.separator
				+ fileName);
		FileInputStream fis = new FileInputStream(file);
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
	}
}
