calendar <- tar_plan(
  schedule = tibble(
    date = as.Date(c(
      "2025-12-04",
      "2025-12-08",
      "2025-12-11",
      "2025-12-15",
      "2025-12-18",
      "2025-12-22",
      "2025-12-25",
      "2026-01-05",
      "2026-01-08",
      "2026-01-14",
      "2026-01-19",
      "2026-01-22",
      "2026-01-26",
      "2026-01-29",
      "2026-02-02",
      "2026-02-05"
    )),
    start = c(
      "10:40",
      "8:50",
      "10:40",
      "8:50",
      "10:40",
      "8:50",
      "10:40",
      "8:50",
      "10:40",
      "8:50",
      "8:50",
      "10:40",
      "8:50",
      "10:40",
      "8:50",
      "10:40"
    ),
    title = c(
      "RBC Model I",
      "RBC Model II",
      "RBC Model III",
      "RBC Model IV",
      "RBC Model V",
      "New Keynesian I",
      "New Keynesian II",
      "New Keynesian III",
      "New Keynesian IV",
      "New Keynesian V",
      "Unemployment I",
      "Unemployment II",
      "Unemployment III",
      "Unemployment IV",
      "Exam",
      "Summary"
    )
  ) |>
    mutate(
      rnum = row_number(),
      start_jst = lubridate::ymd_hm(
        paste0(date, " ", start),
        tz = "Asia/Tokyo"
      ),
      start = lubridate::with_tz(start_jst, "UTC"),
      end = start + lubridate::minutes(90),
      summary = glue::glue("Macro I: {rnum}. {title}"),
      location = "六甲台本館230",
      description = "https://kazuyanagimoto.com/course-kobe-macro1-2025/"
    ) |>
    select(-c(start_jst)),
  schedule_file = {
    path <- here_rel("static", "schedule.csv")
    readr::write_csv(schedule, file = path)
    path
  }
)
