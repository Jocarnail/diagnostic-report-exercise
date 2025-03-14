library(tidyverse)
library(duckplyr)
library(duckdb)
library(quarto)
library(markdown)
con <- dbConnect(duckdb(), "database.duckdb", read_only=TRUE)

exams_list <- c(102437, 102021)

for(i in exams_list){
 exam <- tbl(con, "exams") |> 
   filter(exam_id == i)

  patient_id <- exam |> pull(patient_id)

  comment <- tbl(con, "comments") |> 
    filter(exam_id == i) |> pull(comment)

  quarto_render(
    input = "report.qmd",
    output_file = str_glue("Report_{i}.pdf"),
    execute_params = list(
      patient_id = patient_id,
      exam_id = i,
      comment = comment
    )
  )
}

dbDisconnect(con, shutdown = TRUE)
