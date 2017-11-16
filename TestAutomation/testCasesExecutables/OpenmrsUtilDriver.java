package org.openmrs.util;

public class OpenmrsUtilDriver {
	
	public static void main(String[] args) {
		String[] temp = args[0].split(", ");
		String str = temp[0];
		String[] arr = new String[3];
		arr[0] = temp[1];
		arr[1] = temp[2];
		arr[2] = temp[3];
		System.out.println(OpenmrsUtil.isStringInArray(str, arr));
		//System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
