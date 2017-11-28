package org.openmrs.util;

public class NaturalStringDriver{
	public static void main(String args[]){
		NaturalStrings testNS = new NaturalStrings();
		String[] temp = args[0].split(", ");
		if(temp.length == 2){
			String s = temp[0];
			String t = temp[1];
			System.out.println(Integer.valueOf(testNS.compareNaturalAscii(s, t)));
		}else{
			System.out.println("Error: Incorrect number of arguments!");
		}
	}
}
