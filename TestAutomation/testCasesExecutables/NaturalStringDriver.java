package org.openmrs.util;

import java.text.Collator;
import java.util.Comparator;

public class NaturalStringTestCase{
	public static void main(String args[]){
		NaturalStrings testNS = new NaturalStrings();
		String s = args[0];
		String t = args[1];
		System.out.println(Integer.valueOf(testNS.compareNaturalAscii(s, t)));
	}
}
		
