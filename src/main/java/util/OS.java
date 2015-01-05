package util;

public class OS {

	private static String os = System.getProperty("os.name");

	/**
	 * 判断系统是否为windows
	 * 
	 * @return
	 */
	public static boolean isWindows() {
		if (os.startsWith("win") || os.startsWith("Win")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 判断系统是否为Linux
	 * 
	 * @return
	 */
	public static boolean isLinux() {
		if (os.startsWith("Linux") || os.startsWith("Ubuntu")
				|| os.startsWith("CentOS") || os.startsWith("Debian")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 判断系统是否为Mac
	 * 
	 * @return
	 */
	public static boolean isMac() {
		if (os.startsWith("Mac")) {
			return true;
		} else {
			return false;
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(isWindows());
	}
}
