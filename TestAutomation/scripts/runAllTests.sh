#!/bin/bash

#Change to directory of script.
echo $PWD
cd testCases

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

<table style="width:100%">
<center><br>Team 404-Error Openmrs Testing Results<br><br></center>


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


#path to location where all classes and drivers are contained in code (used to compile )
#the actual classes and drivers are specified in the testCases files, not in script
path='../project/openmrs-core/api/src/main/java/org/openmrs/util/'

#create array to hold drivers that're already compiled to prevent recompiling
declare -a driverArray=()
echo $pwd
for file in ../testCases/*; do

	#Get variables from text files
	test=$(sed -n '11p' "$file")
	req=$(sed -n '12p' "$file")
	method=$(sed -n '13p' "$file")
	class=$(sed -n '14p' "$file")
	driver=$(sed -n '15p' "$file")
	inputs=$(sed -n '16p' "$file")
	expOutput=$(sed -n '17p' "$file")
  #package isn't in html table, just used for running the java classes
  package=$(sed -n '18p' "$file")

  alreadyCompiled='0'
  #loop through driverArray, if the driver is in driverArray then its already compiled
  for i in "${driverArray[@]}"; do
    if [ "$i" == "$driver" ]
    then
      alreadyCompiled='1'
    fi
  done

  #use alreadyCompiled to determine if driver/class is already compiled
  if [ "$alreadyCompiled" != "1" ]
  then
    #variable containing driver and class path to be compiled (if not already compiled)
    stringToCompile="$path$class $path${driver}.java"
    #compile to current directory using the previous made stringToCompile variable
    javac -cp . $stringToCompile
    #add driver to driverArray to prevent recompiling
    driverArray=("${driverArray[@]}" $driver)
  fi

  #Run the correct driver
	cd ../project/openmrs-core/api/src/main/java
	result=$(java -cp . $package$driver "$inputs")
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
xdg-open ../reports/testReport.html
