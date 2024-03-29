% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check.R
\name{check_all}
\alias{check_all}
\title{Run automatic sanity checks}
\usage{
check_all()
}
\value{
Data frame containing the statuses of all realized checks
}
\description{
It runs a set of automated sanity checks for helping the user to troubleshot issues
}
\details{
This function executes a series of sanity checks, concerning, Java, bitness, task status, dependencies and Twitter authentication.
}
\examples{
if(FALSE){
   #importing epitweer
   library(epitweetr)
   message('Please choose the epitweetr data directory')
   setup_config(file.choose())
   #running all tests
   check_all()
}
}
