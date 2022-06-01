# deploy.R
# run this script to set up for deployment
# loads any necessary libraries, etc.


remove.packages("qselfr")
# devtools::install_github("richardsprague/qselfr",
#                          ref = "HEAD",
#                          upgrade = "never")

devtools::load_all("~/dev/qselfr")
