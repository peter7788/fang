package util;

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
}