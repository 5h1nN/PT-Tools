#!/bin/bash 

# Tools that is deployed 
# 1. subfinder - a tool that enumerates the different subdomain of a particular domain
# 2. httpx -> a tool that checks if the url is accessible 
# 3. ffuf -> a tool that enumerates for the different directory 

# Configuration
targetFile="$1" # argument 1 contains the filename containing the list of domain 
resultDir="./$2" # argument 2 contains the directory name of the outputs 
subfinderResultDir="$resultDir/subfinder_result" # a directory that records the result from subfinder 
httpxResultFile="$resultDir/latest.httpx" # a file that records the result from httpx

directoryBFwordlist="common.txt"

# Second run: 
subdomainBF=true
directoryBF=true

if [[ $# -ne 2 ]]; then
    echo "usage: ./enumerate.sh <file containing the list of domain> <saved folder>"
    exit 2
fi

#create the directories
mkdir -p $resultDir # create the output directory if does not exist
mkdir -p $subfinderResultDir # create the subfinder directory if does not exist. 

# Code for subdomain bruteforcing
if $subdomainBF; then 
	# use subfinder to find the subdomain. httpx to check if there is a webserver listening on that domain. 
	echo "[ ] Running subfinder + httpx"
	echo "[ ] To view the result for subfinder -> less $subfinderResultDir/*"
	echo "[ ] To view the result for httpx -> less $httpxResultFile"

	# So basically what this command does was to call the subfinder to enumerate for subdomains and use httpx to determine if the subdomain is alive
	subfinder -dL $targetFile -oD $subfinderResultDir -oJ -nW -nC -silent | httpx -silent -o $httpxResultFile
fi


# Code for directory bruteforcing
if $directoryBF; then
	
	echo "[ ] Running ffuf - directory bruteforcing"
	subdomain=`cat $httpxResultFile`

	# for each of the url in the latest.httpx (contain all the alive subdomain)
	for sd in $subdomain; do 
		echo "[ ] $sd"
		filename=`echo $sd | cut -f3 -d'/'`

		# use ffuf to perform a directory enumeration. 	
		# -w -> specify the wordlist to be use 
		# -u -> specify the URL to be used
		# -mc -> accept all return code (don't perform any output filtering)
		# -o -> save output to 
		# -of -> save to .html format
		ffuf -w $directoryBFwordlist -u $sd/FUZZ -r -mc all -o $resultDir/$filename.html -of html
	done
fi




