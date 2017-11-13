package org.openmrs.util;

//Driver for containsOnlyDigits(String str)
public class OpenmrsUtilDriver2 {
	public static void main(String[] args) {
		if(args.length == 1) {
			String str = args[0];
			System.out.println(OpenmrsUtil.containsOnlyDigits(str));
		}else {
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
