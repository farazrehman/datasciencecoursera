
pollutantmean <- function (directory, pollutant, id = 1:332) {
    
    # Check if we are getting the right input params
    # print (id)
    # print (directory)
    # print (pollutant) 

    # Which pollutant we are looking at
    if (pollutant == "sulfate"){
        readCol <- 2
    }
    else if (pollutant == "nitrate"){
        readCol <- 3
    }
    
    # Convert sensor-ids to proper file names with padding 0s
    fids <- formatC(id, width = 3, format = "d", flag = "0")
    
    # Generate CSV file name from padded ids and directory params
    myfnames <- paste(fids, sep = ".","csv")
    myFull <- paste (directory, sep = "/", myfnames)
    
    # Master vector to hold concatenated data
    masterVec <- NULL
    
    # For each CSV in the list:
    #  - Read raw data frame
    #  - Clean data frame by omitting NA Values
    #  - Extract the pollutant column to be analyzed
    #  - Append the data to master vector
    for (myfile in myFull){
        #print(file.exists(myfile))
        dframe <- read.csv(myfile, header=TRUE)
        cframe <- na.omit(dframe)
        myCol <- cframe[, readCol]
        masterVec <- append (masterVec, myCol)
    }
    # print(masterVec)
    print (mean(masterVec))
    
}
   
