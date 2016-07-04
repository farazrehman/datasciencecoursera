corr <- function (directory, threshold = 0){
    
    # Get the names of all files in the director
    #all_files = list.files(path = directory, pattern = "*.csv", all.files = FALSE)
  
    #sensor_id = (strtoi(substr(all_files, 0, 3)))
    #substr(all_files, 0,3)
    #sensor_id = strtoi(substr(all_files, 0,3))
    #print (sensor_id)
    rvec = NULL
    rid = NULL
    
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
    
    
    # We know that all sensors in rid vector pass the threshold
    # So we can go ahead and do correlation
    # First lets translate sensor id back to file name
    # Convert sensor-ids to proper file names with padding 0s
    
    rfiles <- paste ("specdata", sep = "/", (paste (formatC(rid, width = 3, format = "d", flag = "0"),sep=".","csv")))
    
    #print (rfiles)
    cor_val = NULL
    corr_vec = NULL
    for (n in rfiles)
    {
        cor_frame <- read.csv(n, header=TRUE)
        cln_frame <- na.omit(cor_frame)
        cor_val <- cor(cln_frame[,2], cln_frame[,3])
        corr_vec <- append(corr_vec, cor_val)
        # sulf <- cln_frame [,2]
        # nit <- cln_frame [,3]
        # w_data <- c(sulf, nit)
        # print (t(w_data))
    }
    corr_vec
 
}
    
