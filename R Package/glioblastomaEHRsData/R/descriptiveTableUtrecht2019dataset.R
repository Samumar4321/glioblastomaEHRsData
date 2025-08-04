






descriptiveTableUtrecht2019dataset <- function(savePath = NULL){
  t1 <- table1(~ age_years +
                post_surgery_therapy_none0_monotherapy1_RTandTMZ2 +
                OS_months +
                KPS_less70.0_more70.1 +
                surgery_biopsy0_resection1 +
                SVZ_status_nocontact0_contact1 |
                survived_yes1_no0,
              data = utrecht2019dataset,
              topclass = "Rtable1-shade",
              render.continuous = c(.= "Median [Min, Max]",
                                    .= "Mean (SD)",
                                    .= "Q1 - Q3"))
  if(!is.null(savePath))
    status <- saveTable(t1,
                        names = c("Utrecht2019dataset") ,
                        savePath = savePath)
  return(t1)
}
