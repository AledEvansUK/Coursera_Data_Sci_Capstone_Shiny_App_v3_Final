
#### Notes section at end of this file outline changes / added code and further development after my milestone report (see: https://rpubs.com/aledevans/Milestone_Report_Capstone_Project_Coursera)



# Load packages for Shiny Server 
library(shiny)
library(stringr)
library(tm)

### Load n-gram files

quint_gram <- readRDS("quint_gram7.RData")
quad_gram <- readRDS("quad_gram7.RData")
tri_gram <- readRDS("tri_gram7.RData")
bi_gram <- readRDS("bi_gram7.RData")


####Function to suggest next word

word_suggest <- function(user_word) {
    new_word <- stripWhitespace(removeNumbers(removePunctuation(tolower(user_word),preserve_intra_word_dashes = TRUE)))
    ### print added new_word
    user_word <- strsplit(new_word, " ")[[1]]
    ### word/phrase length
    n <- length(user_word)
    
    ### check quintgram function if phrase length greater than 4.
    if (n >= 4) {user_word <- as.character(tail(user_word,4)); funct_quintgram(user_word)}
    
    ### check quadgram function if phrase length greater than 3.
    else if (n >= 3) {user_word <- as.character(tail(user_word,3)); funct_quadgram(user_word)}
    
    ### check trigram function if phrase length greater than 2.
    if (n >= 2) {user_word <- as.character(tail(user_word,2)); funct_trigram(user_word)}
    
    ### check bigram function if phrase length greater than 1.
    else if (n >= 1) {user_word <- as.character(tail(user_word,1)); funct_bigram(user_word)}
    
}

### Quintgram function
funct_quintgram <- function(user_word) {
    
    if (identical(character(0),as.character(head(quint_gram[quint_gram$word_1 == user_word[1]
                                                            & quint_gram$word_2 == user_word[2]
                                                            & quint_gram$word_3 == user_word[3]
                                                            & quint_gram$word_4 == user_word[4], 5], 1)))) {
        
        as.character(word_suggest(paste(user_word[2],user_word[3],user_word[4],sep=" ")))
    }
    else {
        as.character(head(quint_gram[quint_gram$word_1 == user_word[1] 
                                     & quint_gram$word_2 == user_word[2]
                                     & quint_gram$word_3 == user_word[3]
                                     & quint_gram$word_4 == user_word[4], 5], 1))
        
    }       
}

### Quadgram function
funct_quadgram <- function(user_word) {
    
    if (identical(character(0),as.character(head(quad_gram[quad_gram$word_1 == user_word[1]
                                                           & quad_gram$word_2 == user_word[2]
                                                           & quad_gram$word_3 == user_word[3], 4], 1)))) {
        
        as.character(word_suggest(paste(user_word[2],user_word[3],sep=" ")))
    }
    else {
        as.character(head(quad_gram[quad_gram$word_1 == user_word[1] 
                                    & quad_gram$word_2 == user_word[2]
                                    & quad_gram$word_3 == user_word[3], 4], 1))
    }       
}

### Trigram function
funct_trigram <- function(user_word) {
    
    if (identical(character(0),as.character(head(tri_gram[tri_gram$word_1 == user_word[1]
                                                          & tri_gram$word_2 == user_word[2], 3], 1)))) {
        
        as.character(word_suggest(user_word[2]))
    }
    else {
        as.character(head(tri_gram[tri_gram$word_1 == user_word[1]
                                   & tri_gram$word_2 == user_word[2], 3], 1))
        
    }
}

### Bigram function
funct_bigram <- function(user_word) {
    
    if (identical(character(0),as.character(head(bi_gram[bi_gram$word_1 == user_word[1], 2], 1)))) {
        
        as.character(head("the",1))
    }
    else {
        as.character(head(bi_gram[bi_gram$word_1 == user_word[1],2], 1))
        
    }
}


### Code for calling the word_suggest function

shinyServer(function(input, output) {
    output$prediction <- renderPrint({
        suggestion <- word_suggest(input$inputText)
        suggestion
    });
}
)

#### Notes 

#### Changes after my milestone report (https://rpubs.com/aledevans/Milestone_Report_Capstone_Project_Coursera) 

#### (1) Added code to data processing section to also change text to lowercase.

#### (2) Increased ngrams beyond trigrams outlines in milestone rport. Added code to also include quad-grams (4 word phrases) and quint-grams (5 word phrases).

#### (4) added code to save each n-gram as a csv and RData file for use in server.R file. The files are then loaded by the server.R for the word_suggest function.



