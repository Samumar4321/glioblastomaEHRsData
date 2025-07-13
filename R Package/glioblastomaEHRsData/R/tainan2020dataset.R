#' EHRs data of patients affected by Glioblastoma (GBM) from Tainan and Taiwan medical centers and branches.
#'
#' Data form patients affected by GBM in the Tainan and Taiwan medical centers and affiliated branches from 2005 to 2016.
#'
#' @docType data
#'
#' @usage data(tainan2020dataset)
#'
#' @format An object of class \code{"data.frame"}
#' \describe{
#'  \item{age_years}{Patient's age}
#'  \item{chemo_yes1_no0}{A (character), either "1" or "0", identifing if the patient had chemo or not}
#'  \item{OS_months}{Overall Survival expressed in months}
#'  \item{PFS_monhts}{Progress Free Survival expressed in months}
#'  \item{radiation_dose_Gy}{Radiation dose used in chemotherapy expressed in Gy}
#'  \item{radiation_volume_mL}{Radiation volume used in chemotherapy expressed in mL}
#'  \item{sex_male0_female1}{(Character), either "1" or "0", identifieng the patient's gender}
#'  \item{surgery_yes_biopsy0}{(Character), either "1" or "0", identifieng fi the patient had a resection or only a biopsy}
#'  \item{survived_yes_no0}{(Character), either "1" or "0", identifieng if the patient has survived untile their most recent check-up}
#'  \item{TMZ_based_chemo_yes1_no0}{(Character), either "1" or "0", identifieng the chemotherapy regimen}
#'  \item{tumorProgression_no0_yes1}{(Character), either "1" or "0", identifing if the tumor progressed after the initial treatment}
#'  \item{year_of_diagnosis_05to10_0_10to16_1}{(Character), either "1" or "0", identifieng the year of diagnosis range from 2005 to 2010 or from 2010 to 2016}
#' }
#' @references This dataset was downloaded form LINK and refactored for the usage in this package
#' @keywords datasets
#' @examples
#'
#' data(tainan2020dataset)
#' head(tainan2020dataset)
#'
"tainan2020dataset"
