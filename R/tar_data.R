data <- tar_plan(
  tar_map(
    values = tibble(
      name = c(
        "rgdp",
        "consumption",
        "labor",
        "investment",
        "government",
        "cons_gov",
        "population"
      ),
      id = c(
        "GDPC1",
        "PCECC96",
        "HOANBS",
        "GPDIC1",
        "GCEC1",
        "A955RC1Q027SBEA",
        "CNP16OV"
      )
    ),
    names = name,
    tar_target(
      fred,
      fredr::fredr(
        series_id = id,
        observation_start = as.Date("1948-01-01"),
        observation_end = as.Date("2025-04-01"),
        frequency = "q"
      )
    )
  ),
  fred_data = fred_rgdp |>
    select(date, gdp = value) |>
    left_join(
      fred_consumption |>
        select(date, consumption = value),
      by = "date"
    ) |>
    left_join(
      fred_labor |>
        select(date, labor = value),
      by = "date"
    ) |>
    left_join(
      fred_investment |>
        select(date, investment = value),
      by = "date"
    ) |>
    left_join(
      fred_government |>
        select(date, government = value),
      by = "date"
    ) |>
    left_join(
      fred_cons_gov |>
        select(date, cons_gov = value),
      by = "date"
    ) |>
    left_join(
      fred_population |>
        select(date, population = value),
      by = "date"
    ) |>
    mutate(across(
      c(gdp, consumption, labor, investment, government, cons_gov),
      ~ .x / population
    )) |>
    filter(!is.na(population)),
  tar_file(
    fred_data_file,
    write_csv_tar(fred_data, here_rel("data", "fred_data.csv"))
  ),
  gmd_data = globalmacrodata::gmd(country = "USA", variables = c("rGDP")) |>
    mutate(rate_growth = rGDP / lag(rGDP) - 1),
  tar_file(
    gmd_data_file,
    write_csv_tar(gmd_data, here_rel("data", "gmd_data.csv"))
  )
)

write_csv_tar <- function(data, file) {
  dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)
  write.csv(data, file)
  return(file)
}
