package com.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Security {

	/**
	 * Method to hash the user password to be stored in the DB
	 * @param password the password to be hashed
	 * @return the hashed password
	 */
	public static String hashPassword(String password){
		StringBuilder sb = new StringBuilder();
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			byte[] bytes = md.digest();
			for(int i = 0; i < bytes.length; ++i){
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		return sb.toString();
	}
	
}