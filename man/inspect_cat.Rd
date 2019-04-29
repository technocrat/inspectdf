% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inspect_cat.R
\name{inspect_cat}
\alias{inspect_cat}
\title{Summarise and compare the levels within each categorical feature in one or two dataframes.}
\usage{
inspect_cat(df1, df2 = NULL, show_plot = FALSE)
}
\arguments{
\item{df1}{A dataframe}

\item{df2}{An optional second data frame for comparing categorical levels.
Defaults to \code{NULL}.}

\item{show_plot}{Logical argument determining whether plot is returned
in addition to tibble output.  Default is \code{FALSE}.}
}
\value{
A tibble summarising and comparing the categorical features 
in one or a pair of data frames.
}
\description{
Summarise and compare the levels within each categorical feature in one or two dataframes.
}
\details{
When only \code{df1} is specified, a tibble is returned which 
contains summaries of the categorical levels in \code{df1}.
\itemize{
  \item \code{col_name} character vector containing column names of \code{df1}.
  \item \code{cnt} integer column containing count of unique levels found in each column 
  (including \code{NA}).
  \item \code{common} character column containing the name of the most common level.
  \item \code{common_pcnt} percentage of each column occupied by the most common level shown in 
  \code{common}.
  \item \code{levels} relative frequency of levels in each column.
}
When both \code{df1} and \code{df2} are specified, the relative frequencies of levels across columns
common both dataframes are compared.  In particular, the population stability index, and Fisher's 
exact test are performed as part of the comparison.
\itemize{
  \item \code{col_name} character vector containing column names of \code{df1} and \code{df2}.
  \item{psi} numeric column containing the 
  \href{https://www.quora.com/What-is-population-stability-index}{population stability index}.  
  This measures the difference in the distribution of two categorical features.  Conventionally, 
  values exceeding 0.25 indicate strong evidence of a change, with values below 0.25 and 0.1 
  representing moderate and low evidence of a change.
  \item{fisher_p} p-value corresponding to Fisher's exact test.  A small p indicates 
  evidence that the the two sets of relative frequencies are actually different.
  \item \code{lvls_1}, \code{lvls_2} relative frequency of levels in each of \code{df1} and \code{df2}.
}
}
\examples{
data("starwars", package = "dplyr")
inspect_cat(starwars)
# return a visualisation too
inspect_cat(starwars, show_plot = TRUE)
# compare the levels in two data frames
inspect_cat(starwars, starwars[1:20, ])
}