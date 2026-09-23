## Generates the exercise sheets (with and without solutions) using the R package 'exams'.
## Run this script with the working directory set to the 'Exercises' folder.
## install.packages("exams")
library("exams")
options(exams_tex = "tools") # uses R's LaTeX setup (finds Sweave.sty)

## Helper: one exercise sheet + one solution sheet per chapter
make_sheet <- function(files, name, title, seed = 1) {
  set.seed(seed) # randomized exercises: same seed -> same numbers
  exams2pdf(files, n = 1,
            name     = c(name, paste0(name, "_Solutions")),
            dir      = "output",
            edir     = "exercises",
            template = c("templates/exercises.tex", "templates/solution.tex"),
            header   = list(Date = "", ID = title))
}

## Chapter 2: Review of Probability and Statistics ##############################
## Three sheets: classic by-hand exercises, single-choice exercises (exam style), R exercises
ch2_files <- function(type) list.files("exercises", pattern = paste0("^ProbStats_", type, "_.*\\.Rnw$"))

make_sheet(ch2_files("Hand"),
           name  = "Ch2_ProbStats_ByHand",
           title = "Chapter 2: Review of Probability and Statistics\\\\ By-Hand Exercises")

make_sheet(ch2_files("MC"),
           name  = "Ch2_ProbStats_MultipleChoice",
           title = "Chapter 2: Review of Probability and Statistics\\\\ Multiple Choice")

make_sheet(ch2_files("R"),
           name  = "Ch2_ProbStats_R",
           title = "Chapter 2: Review of Probability and Statistics\\\\ R Exercises")


## OLD course (to be revised) ##################################################
if (FALSE) {
  make_sheet(c("Ch2_LinReg_1.Rnw",
               "Ch2_LinReg_2.Rnw",
               "Ch2_LinReg_GENERIC_Interact.Rnw",
               "Ch2_LinReg_GENERIC_ProjectionMatrix.Rnw"),
             name = "Ch2_Exercises", title = "Chapter 2")

  make_sheet(c("Ch3_MatrixAlgebra_1.Rnw",
               "Ch3_MatrixAlgebra_2.Rnw",
               "Ch3_MatrixAlgebra_3.Rnw",
               "Ch3_MatrixAlgebra_4.Rnw",
               "Ch3_MatrixAlgebra_5.Rnw",
               "Ch3_MatrixAlgebra_6.Rnw"),
             name = "Ch3_Exercises", title = "Chapter 3")

  make_sheet(c("Ch4_NPRegr_1.Rnw",
               "Ch4_NPRegr_2.Rnw"),
             name = "Ch4_Exercises", title = "Chapter 4")

  make_sheet(c("Ch5_Classification_1.Rnw",
               "Ch5_Classification_2.Rnw"),
             name = "Ch5_Exercises", title = "Chapter 5")
}
