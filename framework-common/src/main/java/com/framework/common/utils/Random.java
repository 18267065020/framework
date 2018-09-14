package com.framework.common.utils;

public class Random {
	
	public static int getRandNum() {
	    int randNum = 1 + (int)(Math.random() * ((999999 - 1) + 1));
	    return randNum;
	}
	
	
}
