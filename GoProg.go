package main

import(
	"fmt"
	"os"
	"io/ioutil"
	"regexp"
)

func errorCheck(x error) {
	fmt.Println()
	panic(x)
}


func readFile(x string) string {
	fileData, err := ioutil.ReadFile(x)
	if err != nil {
		errorCheck(err)
	}
	fileString := string(fileData)
	return fileString
}

func parseNumbers(x string) string {
	parseString := x
	reg, err := regexp.Compile("[^a-zA-Z \n]+")
	if err != nil{
		errorCheck(err)
	}
	alphaString := reg.ReplaceAllString(parseString, "")
	return alphaString
}

func writeFile(x, y string) {
	outputFile, err := os.Create(x)
	if err != nil {
		errorCheck(err)
	}
	 z, err := outputFile.WriteString(y)
	if err != nil {
		errorCheck(err)
		outputFile.Close()
	}
	fmt.Println(z, "Bytes in string written successfully")
	err = outputFile.Close()
	if err != nil {
		errorCheck(err)
	}
}

func main(){
	//Declare Variables
	 var inputFileName string
	 var outputFileName string
	 var fileContents string
	 var finalString string

	//Receive user Input
	 inputFileName = os.Args[1]
	 outputFileName = os.Args[2]

	//error Checking in input
 	 //fmt.Println("File to be read is: " , inputFileName)
	 //fmt.Println("File to be written to is: ", outputFileName)

	//Read File
	 fileContents = readFile(inputFileName)
	 //fmt.Println(fileContents)

	//Parse String
	 finalString = parseNumbers(fileContents)
	 //fmt.Println(finalString)

	//Write to file 
	 writeFile(outputFileName, finalString)

}

