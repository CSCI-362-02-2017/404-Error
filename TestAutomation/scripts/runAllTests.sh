#!/bin/bash

#Change to directory of script.
cd ../testCases

#Create report

#
##echo "<!DOCTYPE html>
##<html>
##	<head>
#		<meta charset="UTF-8">
#		<title>openMRS Tests</title>
#		<link rel=\"stylesheet\" type=\"text/css\" href=\"../reports/style.css\" />
#	</head>
#	<body>
#		<div id=\"table\">
#			<div class=\"row\">
#				<div class=\"head\">TestCase ID</div>
#				<div class=\"head\">Requirement</div>
#				<div class=\"head\">Method</div>
#				<div class=\"head\">Class</div>
#				<div class=\"head\">Driver</div>
#				<div class=\"head\">Inputs</div>
#				<div class=\"head\">Expected Output</div>
#				<div class=\"head\">Result</div>
#			</div>" > ../reports/testReport.html


echo "<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>

<table style="width:100%">
  <tr>
    <th>Test</th>
    <th>Requirement</th> 
    <th>Method</th>
    <th>Class</th> 
    <th>Driver</th>
    <th>Inputs</th> 
    <th>Expected Output</th>
    <th>Result</th>
  </tr>" > ../reports/testReport.html

#echo $PWD
javac -cp . ../project/openmrs-core/api/src/main/java/org/openmrs/util/NaturalStrings.java ../project/openmrs-core/api/src/main/java/org/openmrs/util/NaturalStringDriver.java ../project/openmrs-core/api/src/main/java/org/openmrs/util/NaturalStringDriver2.java
#echo $PWD
javac -cp . ../project/openmrs-core/api/src/main/java/org/openmrs/util/OpenmrsUtil.java ../project/openmrs-core/api/src/main/java/org/openmrs/util/OpenmrsUtilDriver.java ../project/openmrs-core/api/src/main/java/org/openmrs/util/OpenmrsUtilDriver2.java ../project/openmrs-core/api/src/main/java/org/openmrs/util/OpenmrsUtilDriver3.java

for file in ../testCases/*; do

	#Get variables from text files
	test=$(sed -n '11p' "$file")
	req=$(sed -n '12p' "$file")
	method=$(sed -n '13p' "$file")
	class=$(sed -n '14p' "$file")
	driver=$(sed -n '15p' "$file")
	inputs=$(sed -n '16p' "$file")
	expOutput=$(sed -n '17p' "$file")

	#Run the correct driver

	cd ../project/openmrs-core/api/src/main/java
	result=$(java -cp . $driver "$inputs")
	cd ../../../../..

	#Dump test case info into terminal
	

	echo "---------------------"
	echo "Test: $test "
	echo "---------------------"
	echo "Requirement: $req"
	echo "Method: $method"
	echo "Class: $class"
	echo "Driver: $driver"
	echo "Inputs: $inputs"
	echo "Expected Output: $expOutput"
	echo "Result: $result"
	


	echo "<tr>">> ../reports/testReport.html
	echo "<td><a href=\"../testCases/$file\">Test #$test</a></td>">> ../reports/testReport.html
	echo "<td>$req</td>">> ../reports/testReport.html
	echo "<td>$method</td>">> ../reports/testReport.html
	echo "<td>$class</td>">> ../reports/testReport.html
	echo "<td>$driver</td>">> ../reports/testReport.html
	echo "<td>$inputs</td>">> ../reports/testReport.html
	echo "<td>$expOutput</td>">> ../reports/testReport.html

	

	#Compare the output to expected and determine pass or fail
	if [ "$expected == $result" ]
	 then
		echo "<td>Pass</td>" >> ../reports/testReport.html
	else
		echo "<td>Fail</td>" >> ../reports/testReport.html
	fi


	echo "</tr>" >> ../reports/testReport.html

done

echo "</table>
</body>
</html>" >> ../reports/testReport.html

#Open report
open ../reports/testReport.html
