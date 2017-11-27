package org.openmrs.util;

public class OpenmrsUtilDriver3 {
	public static void main(String[] args) {
		if(args.length == 1) {
			String str = args[0];
			System.out.println(OpenmrsUtil.containsDigit(str));
		}else {
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
