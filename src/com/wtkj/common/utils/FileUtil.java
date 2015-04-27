package com.wtkj.common.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtil {
	/**
	 * 
	 * @author sunsi
	 * @param:
	 * @return: void
	 * @throws:
	 */
	public static boolean copy(File file, String toPath, String fileName) {
		InputStream is = null;
		OutputStream os = null;
		try {
			if (fileName == null) {
				fileName = file.getName();
			}
			File dir = new File(toPath);
			if (!dir.exists()) {
				dir.mkdir();
			}
			is = new FileInputStream(file);
			File deskFile = new File(toPath, fileName);
			os = new FileOutputStream(deskFile);
			byte[] bytefer = new byte[1024];
			int length = 0;
			while ((length = is.read(bytefer)) != -1) {
				os.write(bytefer, 0, length);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (os != null) {
					os.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 
	 * @author sunsi
	 * @param:
	 * @return: boolean
	 * @throws:
	 */
	public static boolean cut(File file, String toPath) {
		boolean flag = copy(file, toPath, null);
		if (flag) {
			if (file.exists()) {
				file.delete();
			}
			return true;
		} else {
			return false;
		}
	}
}
