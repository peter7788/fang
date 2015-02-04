package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

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

	/**
	 * 批量上传文件
	 * 
	 * @param savePath
	 * @param fileNameList
	 * @param fileList
	 * @throws Exception
	 */
	public static void uploadList(String savePath, List<String> fileNameList,
			List<File> fileList) throws Exception {
		for (int i = 0; i < fileNameList.size(); i++) {
			upload(savePath, fileNameList.get(i), fileList.get(i));
		}
	}
}
