#!/bin/bash

#Change to directory of script.
cd ../testCases

#Create report
echo "<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>openMRS Tests</title>
		<link rel=\"stylesheet\" type=\"text/css\" href=\"../reports/style.css\" />
	</head>
	<body>
		<div id=\"table\">
			<div class=\"row\">
				<div class=\"head\">TestCase ID</div>
				<div class=\"head\">Requirement</div>
				<div class=\"head\">Method</div>
				<div class=\"head\">Class</div>
				<div class=\"head\">Driver</div>
				<div class=\"head\">Inputs</div>
				<div class=\"head\">Expected Output</div>
				<div class=\"head\">Result</div>
			</div>" > ../reports/testReport.html

#Run tests
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
	javac -cp ../project/openmrs-core/api/src/main/java/org/openmrs/util *.java
	echo $PATH
	cd ../../../../../../../../../testCasesExecutables
	echo $PATH
	javac -cp NaturalStringDriver.java


	#Change to parent directory
	cd ../testCasesExecutables

	#Get result from driver
	#result=$(java -cp "./:../project/openmrs-core/api/" $driver $input)
	result=$(java -cp NaturalStringDriver $input)

	# need to round the result to 2 deci http://stackoverflow.com/questions/26465496/rounding-up-float-point-numbers-bash
	# http://unix.stackexchange.com/questions/167058/how-to-round-floating-point-numbers-in-shell
	#result=$(echo $result | xargs printf "%.*f\n" 2)

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
	echo ""

	#Print results to report
	echo "			<div class=\"row\">
				<div class=\"cell\"><a href=\"../testCases/$file\">Test #$test</a></div>
				<div class=\"cell\">$method</div>
				<div class=\"cell\">$input</div>
				<div class=\"cell\">$expected</div>
				<div class=\"cell\">$result</div>" >> ../reports/testReport.html

	#Compare the output to expected and determine pass or fail
	if [ "$expected" == "$result" ]; then
		echo "				<div class=\"cell pass\">Pass</div>" >> ../reports/testReport.html
	else
		echo "				<div class=\"cell fail\">Fail</div>" >> ../reports/testReport.html
	fi


	echo "			</div>" >> ../reports/testReport.html

done

echo "		</div>
	</body>
</html>" >> ../reports/testReport.html

#Open report
xdg-open ../reports/testReport.html
