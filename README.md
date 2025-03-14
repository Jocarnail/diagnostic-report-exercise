# Parametrized report
This is a simple example of a parametrized diagnostic report done in R, Quarto, and typst.

The report reads the relevant indormations from a DuckDB database and compile a report for each of the exams that are in the `renderer.R` file.

The renderer file takes care of setting the informations needed by the `report.qmd` to compile each specific report.
