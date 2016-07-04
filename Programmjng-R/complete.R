complete <- function (directory, id = 1:332){
    
    # Convert sensor-ids to proper file names with padding 0s
    fids <- formatC(id, width = 3, format = "d", flag = "0")
    
    # Generate CSV file name from padded ids and directory params
    myfnames <- paste(fids, sep = ".","csv")
    myFull <- paste (directory, sep = "/", myfnames)
    
    # For each file, read the CSV into data.frame
    #   - Clean the data frame (remove NA values)
    #   - Use nrow() to calculate the complete records
    #   - Print results
    #print ("id   nobs")
    for (myFile in myFull){
        dframe <- read.csv(myFile, header=TRUE)
        cframe <- na.omit(dframe)
        nobs <- nrow(cframe)
        id <- cframe[2,4]
        #print (paste(id, sep="    ",nobs))
        
    }
    nobs
}