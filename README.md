
# Explore Penguin Measurements with Shiny

**Author:** Nishta Bollavaram  
**Unit:** ETC5523 — *Communicating with Data (Assignment 4)*  
**University:** Monash University

------------------------------------------------------------------------

### Overview

The **penguinExplorer** R package provides both data and interactivity
for exploring the *Palmer Penguins* dataset.  
It includes, a cleaned and well-documented `penguins` dataset, a Shiny
app for interactive exploration and a full documentation and website
built with **pkgdown**

This project demonstrates the integration of data communication,
documentation and interactivity in R, turning static analysis into an
engaging exploratory experience.

------------------------------------------------------------------------

### Installation

To install and use the package directly from GitHub:

``` r
install.packages("remotes", quiet = TRUE)
suppressPackageStartupMessages(
  remotes::install_github("ETC5523-2025/assignment-4-packages-and-shiny-apps-nishtabollavaram", quiet = TRUE)
)
library(penguinExplorer)
```

## Launch the Shiny app

Once installed, run the interactive app with:

``` r
run_app()
```

The interactive Shiny explorer allows you to: Select a specie, choose a
numeric variables for X and Y axes, compare male and female penguins
visually and download filtered data as a CSV.

## Dataset

The dataset contains information about body measurements for three
species across the Palmer Archipelago, Antarctica.

``` r
summary(penguins)
#>       species          island         sex           year     
#>  Adelie   :152   Biscoe   :168   female :165   Min.   :2007  
#>  Chinstrap: 68   Dream    :124   male   :168   1st Qu.:2007  
#>  Gentoo   :124   Torgersen: 52   Unknown: 11   Median :2008  
#>                                                Mean   :2008  
#>                                                3rd Qu.:2009  
#>                                                Max.   :2009  
#>                                                              
#>   body_mass_g  
#>  Min.   :2700  
#>  1st Qu.:3550  
#>  Median :4050  
#>  Mean   :4202  
#>  3rd Qu.:4750  
#>  Max.   :6300  
#>  NA's   :2
```

Variables include: **species**, **island**, **sex**, **year**,
**body_mass_g**

## Acknowledgements

Data adapted from the palmerpenguins project. Developed as part of the
`ETC5523: Communicating with Data` unit at Monash University.

## License

This project is released under the **MIT License**.
