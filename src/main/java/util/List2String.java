package util;

import java.util.ArrayList;
import java.util.List;

public class List2String {

	private static final String SEPERATOR = ";";

	/**
	 * 把List<String>转化成String的形式，以分隔符分开
	 * 
	 * @param prefix
	 * @param list
	 * @return
	 */
	public static String toString(String prefix, List<String> list) {
		String tempString = "";
		if (list != null) {
			for (String listString : list) {
				tempString += prefix + listString + SEPERATOR;
			}
		}
		return tempString;
	}

	/**
	 * 把String还原成List<String>的形式
	 * 
	 * @param text
	 * @return
	 */
	public static List<String> toList(String text) {
		String[] array = text.split(SEPERATOR);
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		return list;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}