#--- KF's script for quick beginner automated R setup ---#

## Core
req_pkg <- c(
  "tidyverse",
  "readxl",
  "writexl",
  "rmarkdown",
  "knitr",
  "devtools"
)

## Supplement

opt_pkg <- c(
  "tesseract",
  "data.table",
  "DT",
  "plotly",
  "shiny",
  # "shinyjs",
  # "shinyauthr",
  "here",
  "naniar",
  "vitae",
  "magick",
  "xaringan",
  "xaringanExtra",
  # "reticulate"
  # "languageserver"
)

## GitHub

gh_pkg <- c(
  "kenf1/kqol", #KF custom functions + templates
  "brianwdavis/quadrangle"
)

cran_pkg <- c(req_pkg,opt_pkg)

#install packages
install.packages(cran_pkg,Ncpus=4) #from CRAN
devtools::install_github(gh_pkg) # from GH

#clean up environment & memory
rm(req_pkg,opt_pkg,cran_pkg,gh_pkg)
gc()
