#' EHR data of patients affected by Glioblastoma (GBM) treated at the University Medical Centre of Utrecht.
#'
#' Electronic Health Records (EHR) of patients affected by GBM at the University Medical Centre of Utrecht (UMCU) between 2005-2013.\cr
#' This dataset contains clinical information from 647 patients collected to study prognostic factor
#' influencing overall survival in GBM patients, this study focuses on the involvment of the
#' subventricolar zone (SVZ), a brain region that may play a role in tumor progression.\cr
#' Some data may be missing due to the nature of clinical records.
#'
#' @docType data
#' @name utrecht2019dataset
#' @usage data(utrecht2019dataset)
#'
#' @format A data frame with 647 rows and 7 variables:
#' \describe{
#'  \item{age_years}{Numeric. Patient's age.}
#'  \item{KPS_less70.0_more70.1}{Factor. "<70" (0) or ">70" (1) KPS level.}
#'  \item{OS_months}{Numeric. Overall Survival expressed in months.}
#'  \item{post_surgery_therapy_none0_monotherapy1_RTandTMZ2}{Factor. "None" (0), "Monotherapy" (1) or "RT+TMZ" (2) for therapy regime.}
#'  \item{surgery_biopsy0_resection1}{Factor. "Biopsy" (0) or "Resection" (1) for surgery type.}
#'  \item{survived_yes1_no0}{Factor. "Dead" (0) or "Alive" (1) at their most recent check-up.}
#'  \item{SVZ_status_nocontact0_contact1}{Factor. "No" (0) or "Yes" (1) for SVZ contact.}
#' }
#' @references
#' Berendsen S, van Bodegraven E, Seute T et al. (2019).
#' Adverse prognosis of glioblastoma contacting the subventricular zone: Biological correlates.
#' PMID: 31603915.
#' 14(10): e0222717.
#' https://doi.org/10.1371/journal.pone.0222717
#'
#' @keywords datasets
#' @examples
#'
#' data(utrecht2019dataset)
#' head(utrecht2019dataset)
#'
"utrecht2019dataset"
