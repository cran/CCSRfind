#' This dataset contains CCSR codes that are associated with over all ICD-10 codes
#'
#'
#'@format A data frame with 543 rows and 3 variables:
#'  \describe{
#'    \item{CCSRCat}{CCSR category corresponding to ICD-10 code}
#'    \item{CCSRD}{Text description of CCSR category}
#'    \item{codecolvec}{A regular expression listing all the ICD-10 codes for the CCSR code}
#'    }
#'
#'@source \url{https://hcup-us.ahrq.gov/toolssoftware/ccsr/dxccsr.jsp}
#'
#'@examples
#'  data(Legend)
#'  head(Legend)
"Legend"
