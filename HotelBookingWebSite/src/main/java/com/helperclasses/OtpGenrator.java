package com.helperclasses;

public class OtpGenrator {

	public static String Genrator(){
        int otp = 0;
        String otps = "";
        for (int i = 0; i < 4; i++) {
            otp = (int) (Math.floor(Math.random() * 10));
            otps += Integer.toString(otp);
        }
        return otps;

	}
	

}
