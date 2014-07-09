charCount <- function(fileUrl){
    con <- url(fileUrl)
    htmlCode = readLines(con)
    close(con)
        
    lines <- c(10, 20, 30,100)
    
    for(n in lines)
    {
        cat(n,":", nchar(htmlCode[n]),":",htmlCode[n], "\n")
    }
}