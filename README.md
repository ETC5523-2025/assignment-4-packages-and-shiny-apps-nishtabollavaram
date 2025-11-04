
# penguineExplorer

**ETC5523 – Assignment 4: Turning analysis interactive**
`Author: Nishta Bollavaram` **penguineExplorer** ships a cleaned
penguins dataset and a Shiny app to explore species differences across
years. Everything is packaged (no read.csv inside the app), documented,
and published via pkgdown.

## Installation

``` r
install.packages("remotes")
#> 
#> The downloaded binary packages are in
#>  /var/folders/qj/t9y8ln_11cd3hj1ccd92fqxh0000gn/T//RtmpvJtteg/downloaded_packages
remotes::install_github(
  "ETC5523-2025/assignment-4-packages-and-shiny-apps-nishtabollavaram"
)
#> Using GitHub PAT from the git credential store.
#> Skipping install of 'penguinExplorer' from a github remote, the SHA1 (78766c8a) has not changed since last install.
#>   Use `force = TRUE` to force installation
library(penguinExplorer)
#> 
#> Attaching package: 'penguinExplorer'
#> The following object is masked from 'package:datasets':
#> 
#>     penguins
```

## Launching the Shiny app

``` r
run_app()
#> Loading required package: shiny
#> 
#> Attaching package: 'bslib'
#> The following object is masked from 'package:utils':
#> 
#>     page
#> Use suppressPackageStartupMessages() to eliminate package
#> startup messages
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> 
#> Listening on http://127.0.0.1:5189
#> Warning: `aes_string()` was deprecated in ggplot2 3.0.0.
#> ℹ Please use tidy evaluation idioms with `aes()`.
#> ℹ See also `vignette("ggplot2-in-packages")` for more information.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning
#> was generated.
```

The interactive Shiny explorer allows you to: Select a specie, choose a
numeric variables for X and Y axes, compare male and female penguins
visually and download filtered data as a
CSV.rmarkdown::render(“README.Rmd”) pkgdown::build_site()

    #> # A tibble: 6 × 5
    #>   species island    sex      year body_mass_g
    #>   <fct>   <fct>     <fct>   <int>       <dbl>
    #> 1 Adelie  Torgersen male     2007        3750
    #> 2 Adelie  Torgersen female   2007        3800
    #> 3 Adelie  Torgersen female   2007        3250
    #> 4 Adelie  Torgersen Unknown  2007          NA
    #> 5 Adelie  Torgersen female   2007        3450
    #> 6 Adelie  Torgersen male     2007        3650

## Acknowledgements

Data adapted from the palmerpenguins project.
