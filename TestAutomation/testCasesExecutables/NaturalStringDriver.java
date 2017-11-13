package org.openmrs.util;

import java.text.Collator;
import java.util.Comparator;

public class NaturalStringDriver{
	public static void main(String[] args){
		if(args.length == 2){
			NaturalStrings testNS = new NaturalStrings();
			String[] temp = args[0].split(", ");
			String s = temp[0];
			String t = temp[1];
			System.out.println(Integer.valueOf(testNS.compareNaturalAscii(s, t)));
		}else{
			System.out.println("Error: Invalid number of arguments!");
		}
	}
}
		
