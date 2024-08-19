#' This dataset contains CCSR codes for which there are over 1,000 individual ICD-10 codes
#'
#'
#'@format A data frame with 9 rows and 3 variables:
#'  \describe{
#'    \item{CCSRCat}{CCSR category corresponding to ICD-10 code}
#'    \item{CCSRD}{Text description of CCSR category}
#'    \item{codecolvec}{A regular expression listing all the ICD-10 codes for the CCSR code}
#'    }
#'
#'@source \url{https://hcup-us.ahrq.gov/toolssoftware/ccsr/dxccsr.jsp}
#'
#'@examples
#'  data(LegendExtend)
#'  head(LegendExtend)
"LegendExtend"
