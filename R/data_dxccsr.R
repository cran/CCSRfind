#' Data to showcase CCSR-ICD-10 crosswalk
#'
#' The Clinical Classifications Software Refined (CCSR) for ICD-10-CM diagnoses aggregates more than 70,000 ICD-10-CM diagnosis codes into over 530 clinically meaningful categories.
#' The CCSR is based on the International Classification of Diseases, 10th Revision, Clinical Modification (ICD-10-CM).
#' The categories are organized across 22 body systems, which generally follow the structure of the ICD-10-CM diagnosis chapters.
#'
#'@format A data frame with 86855 rows and 7 variables:
#'  \describe{
#'    \item{ICD10}{ICD-10 diagnosis codes}
#'    \item{icd_10_cm_code_description}{Text description of ICD-10 codes}
#'    \item{CCSRCat}{CCSR category corresponding to ICD-10 code}
#'    \item{CCSRD}{Text description of CCSR category}
#'    \item{inpatient_default_ccsr_y_n_x}{Indicator of whether or not the CCSR category is the default category in an inpatient setting}
#'    \item{outpatient_default_ccsr_y_n_x}{Indicator of whether or not the CCSR category is the default category in an outpatient setting}
#'    \item{rationale_for_default_assignment}{Rationale for the default assignment}
#'    }
#'
#'@source \url{https://hcup-us.ahrq.gov/toolssoftware/ccsr/dxccsr.jsp}
#'
#'@examples
#' data(DXCCSR)
#' head(DXCCSR)

"DXCCSR"
