library(targets)
library(tarchetypes)
suppressPackageStartupMessages(library(dplyr))

options(
  dplyr.summarise.inform = FALSE
)

tar_config_set(
  store = here::here("_targets"),
  script = here::here("_targets.R")
)

here_rel <- function(...) {
  fs::path_rel(here::here(...))
}

list_files <- function(path, ...) {
  file.path(path, list.files(path, ...))
}

write_lines <- function(text, file, ...) {
  dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)
  writeLines(text = text, con = file, ...)
  return(file)
}

tar_source()

# Main Pipeline ----------------------------------------------------------------

tar_plan(
  # Lesson -----------------------
  image,
  data,
  calendar,
  # Website ----------------------
  tar_quarto(
    website,
    path = ".",
    profile = "html",
    quiet = FALSE,
    extra_files = c(
      list_files(here_rel("static"), recursive = TRUE),
      list_files(here_rel("data"), recursive = TRUE)
    )
  )
)
