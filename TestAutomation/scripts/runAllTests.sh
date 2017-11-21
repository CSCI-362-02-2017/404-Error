#!/bin/bash

#Change to directory of script.
cd ../testCases

#Create report


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

<<<<<<< HEAD
<table style="width:50%">
=======
<table style="width:100%">
<center><br>Team 404-Error Openmrs Testing Results<br><br></center>

>>>>>>> 1fe71d75565147f34c4d494e7e5c820d93e81987
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
	echo "<td>$result</td>">> ../reports/testReport.html

	

	#Compare the output to expected and determine pass or fail
	if [ $expOutput == true ] || [ $expOutput == false ]
	 then
		if [ "$expOutput" == "$result" ]
	 	then
			echo "<td bgcolor="green">Pass</td>" >> ../reports/testReport.html
		else
			echo "<td bgcolor="red" >Fail</td>" >> ../reports/testReport.html
		fi
	else
		if [ "$expOutput" -eq "$result" ]
	 	then
			echo "<td bgcolor="green">Pass</td>" >> ../reports/testReport.html
		else
			echo "<td bgcolor="red" >Fail</td>" >> ../reports/testReport.html
		fi
	fi

	echo "</tr>" >> ../reports/testReport.html

done

echo "</table>
</body>
</html>" >> ../reports/testReport.html

#Open report
open ../reports/testReport.html
