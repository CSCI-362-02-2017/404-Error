package org.openmrs.util;

import java.text.Collator;
import java.util.Comparator;

public class NaturalStringDriver2{
	public static void main(String[] args){
		NaturalStrings testNS = new NaturalStrings();
		String[] temp = args[0].split(", ");
		String s = temp[0];
		String t = temp[1];
		System.out.println(Integer.valueOf(testNS.compareNaturalIgnoreCaseAscii(s, t)));
	}
}