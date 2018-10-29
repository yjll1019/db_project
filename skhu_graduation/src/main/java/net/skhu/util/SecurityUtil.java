package net.skhu.Util;

import java.security.MessageDigest;

public class SecurityUtil {

	public String encryptBySHA256(String password) {
		String encryptString = "";

		try {

			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());

			byte data[] = md.digest();
			StringBuffer sb = new StringBuffer();

			for(int i = 0; i < data.length; ++i) {
				sb.append(Integer.toString((data[i]&0xff) + 0x100, 16).substring(1));
			}

			encryptString = sb.toString();

		}catch(Exception e) {
			e.printStackTrace();
			encryptString = "";
		}

		return encryptString;
	}

}
