Capstone Project - NLP text prediction Shiny Application
========================================================
author: Aled Evans
date: March 2017
autosize: true
font-family: 'Helvetica'

- This pitch presentation is for a Shiny Application that uses natural language processing (NLP) for word prediction.
- This is the capstone project for the Data Science Specialization offered by [Coursera & Johns Hopkins University (in association with Swiftkey).](https://www.coursera.org/learn/data-science-project)

Introduction
========================================================

- The Shiny application ('app') suggests the next word following text input from the user.
- To use the app: Input a word or phrase. The predictive algorithm outputs a suggestion for the next word using natural language processing (NLP) techniques.
- The Shiny App works across devices, but is optimised for use on a desktop web browser.
- The Shiny App can be found on [shinyapps.io](https://aledevans.shinyapps.io/Coursera_Data_Sci_Capstone_Shiny_App_v3_Final/)
- The code and documentation for the app, project and this R presentation can be found on [GitHub.](https://github.com/AledEvansUK/Coursera_Data_Sci_Capstone_Shiny_App_v3_Final)


Data Processing
========================================================

- The project data set is obtained from [here.](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)
- The source files are sampled to give a 'corpus' that is processed more swiftly. A 1% sample is used to construct the corpus.
- The corpus also undergoes text processing: all non-English characters are removed; numbers, punctuation, whitespace was also removed. All text is also changed to lowercase. 
- Profane words are also removed. The project used Carnegie Mellon University's resource:  [Offensive/Profane Word List.](https://www.cs.cmu.edu/~biglou/resources/bad-words.txt)


Prediction Algorithm
========================================================

- Tokenization is used for finding the frequency of five types of n-gram: unigrams (single words), bigrams (two word phrases), trigrams (three words), quadgrams (four word) and quintgrams (five words).
- N-grams indicate which words appear together in the text. (The higher the frequency of a certain n-gram, the more likely it is to be found in the corpus.)
- The predictive algorithm uses the n-gram frequency to suggest/ predict the next word based on the users input. The model checks the phrase length and starts with the quintgram, then moves onto the quadgram and so on. The model is a version of a ['back-off' model](https://en.wikipedia.org/wiki/Katz%27s_back-off_model).

Weblinks & References
========================================================

- The Shiny App on [shinyapps.io](https://aledevans.shinyapps.io/Coursera_Data_Sci_Capstone_Shiny_App_v3_Final/)
- Code and documentation for the App, Project and this R presentation on [GitHub.](https://github.com/AledEvansUK/Coursera_Data_Sci_Capstone_Shiny_App_v3_Final)
- Milestone Report for this project on [Rpubs.](https://rpubs.com/aledevans/Milestone_Report_Capstone_Project_Coursera)
- The data-set used to contruct the corpus is obtained from [here.](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)
- [NLP Tutorial (Stanford University).](http://nlp.stanford.edu/~wcmac/papers/20050421-smoothing-tutorial.pdf)
- [Natural Language Processing Key Terms Explained. (KDNuggets.com).](http://www.kdnuggets.com/2017/02/natural-language-processing-key-terms-explained.html)
- [Shiny HTML Tags Glossary (RStudio.com) ](https://shiny.rstudio.com/articles/tag-glossary.html)
- [Application layout guide (RStudio.com)](https://shiny.rstudio.com/articles/layout-guide.html)
- [Customize your UI with HTML (RStudio.com) ](https://shiny.rstudio.com/articles/html-tags.html)
