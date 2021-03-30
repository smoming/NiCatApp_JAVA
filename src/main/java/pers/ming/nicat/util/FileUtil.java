package pers.ming.nicat.util;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class FileUtil {
//	public static void mkDir(String fullpath) {
//		File dirFile = new File(fullpath);
//		if (dirFile.exists() == false) {
//			dirFile.mkdir();
//		}
//	}
//
//	public static void createFile(String fullFileName) {
//	}
//
//	public static void createFile(String fileName, String extension) {
//		createFile(getFullFileName(fileName, extension));
//	}
//
//	public static String getFullFileName(String fileName, String extension) {
//		return StringUtils.join(fileName, ".", extension);
//	}
//
//	public static void workDir(String dirName) {
//		System.setProperty("user.dir", dirName);
//	}

	public static void writeTextFile(String fullPathAndFileName, String textContent) {
		FileWriter output = null;
		try {
			output = new FileWriter(fullPathAndFileName, true);
			BufferedWriter bw = new BufferedWriter(output);
			bw.write(textContent);
			bw.newLine();
			bw.flush();

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
				}
			}
		}

	}
}
