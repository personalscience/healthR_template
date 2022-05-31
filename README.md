
<!-- README.md is generated from README.Rmd. Please edit that file -->

# healthR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Most web apps intended to analyze personal health information obey a
similar format:

-   Enter data, often by reading a CSV file collected from a device
-   Display the data, generally on a time chart
-   Analyze the data somehow, often with statistics.

This is a working R package, plus instructions, that will let you
quickly build an app and deploy it to the web. The emphasis is on
end-to-end simplicity. Think of it as a “Hello, world” example, but the
ability to load data and display it, end-to-end.

## Installation

You can install the development version of healthR

``` r
devtools::load_all(".")
```

## Run

Run the app like this

``` r
library(healthR)
run_app()
```

<img src="https://github.com/personalscience/healthR_template/blob/main/inst/img/InitialTemplate1.jpg?raw=true" width="80%" />
