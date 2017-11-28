/*
package org.openmrs.util;

public class OpenmrsUtilDriver {

	public static void main(String[] args) {
		if(args.length == 4) {
			String str = args[0];
			String[] arr = new String[3];
			arr[0] = args[1];
			arr[1] = args[2];
			arr[2] = args[3];
			boolean temp = OpenmrsUtil.isStringInArray(str, arr);
			if(temp == true){
				System.out.println("true");
			}else{
				System.out.println("false");
			}
		}else {
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
*/

package org.openmrs.util;

public class OpenmrsUtilDriver {

	public static void main(String[] args) {
		String[] temp = args[0].split(", ");
		if(temp.length == 4){
			String str = temp[0];
			String[] arr = new String[3];
			arr[0] = temp[1];
			arr[1] = temp[2];
			arr[2] = temp[3];
			System.out.println(OpenmrsUtil.isStringInArray(str, arr));
		}else{
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
