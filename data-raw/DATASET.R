## code to prepare sample datasets goes here

sample_keto_data <- readr::read_csv(system.file("extdata",
                                                package = "healthR",
                                                "KetoMojoSample.csv"),
                                    col_types=cols(
                                      source = col_character(),
                                      type = col_character(),
                                      value = col_double(),
                                      unit = col_character(),
                                      date = col_character(),
                                      time = col_time(format = ""),
                                      timeZone = col_character(),
                                      gki = col_logical(),
                                      hematocrit = col_logical(),
                                      hemoglobin = col_logical(),
                                      tags = col_character(),
                                      notes = col_character(),
                                      readingSampleType = col_character()
                                    ))
usethis::use_data(sample_keto_data, overwrite = TRUE)

