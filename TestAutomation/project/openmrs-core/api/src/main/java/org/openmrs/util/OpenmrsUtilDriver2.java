package org.openmrs.util;

//Driver for containsOnlyDigits(String str)
public class OpenmrsUtilDriver2 {
	public static void main(String[] args) {
		String[] temp = args[0].split(", ");
		if(temp.length == 1) {
			String str = temp[0];
			System.out.println(OpenmrsUtil.containsOnlyDigits(str));
		}else {
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
