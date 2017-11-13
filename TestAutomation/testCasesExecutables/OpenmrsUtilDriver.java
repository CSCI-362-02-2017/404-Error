package org.openmrs.util;

public class OpenmrsUtilDriver {
	
	public static void main(String[] args) {
		if(args.length == 4) {
			String str = args[0];
			String[] arr = new String[3];
			arr[0] = args[1];
			arr[1] = args[2];
			arr[2] = args[3];
			OpenmrsUtil.isStringInArray(str, arr);
		}else {
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
