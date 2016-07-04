corr <- function (directory, threshold = 0){
    
    rvec = NULL
    rid = NULL
    
    # Bad logic but only couple of hours to meet the deadline, hence brute forcing
    # First going to make a list of all sensor-ids that meet the theshold 
    for (k in 1:332)
    {
        # Check which files meet the Threshold
        mnobs <- complete("specdata", k)
        if (mnobs > threshold)
        {
            rid <- append(rid, k)
            rvec <- append(rvec, mnobs)
        }
    }
    
    # We know have all the sensors in rid vector that meet the threshold
    # So we can go ahead and do correlation - yay!
    # BUT First lets translate sensor id back to file name - again!! bad! bad!
    
    rfiles <- paste ("specdata", sep = "/", (paste (formatC(rid, width = 3, format = "d", flag = "0"),sep=".","csv")))
    
    # Tada! Now rfiles has all the files that meet the threshold
    cor_val = NULL
    corr_vec = NULL
    
    # For each file in rfiles i.e. those meeting the threshold...
    #   - Read the CSV file into a data.frame
    #   - Clean-up the data
    #   - Apply cor() function to calculate correlation for Sulfate and
    #       Nitrate pollutants
    #   - Append the value each correlation into a vector and pray it works :)
    for (n in rfiles)
    {
        cor_frame <- read.csv(n, header=TRUE)
        cln_frame <- na.omit(cor_frame)
        cor_val <- cor(cln_frame[,2], cln_frame[,3])
        corr_vec <- append(corr_vec, cor_val)
    }
    corr_vec
}
    
