---
title: "README for Industry Profiler"
author: "ill-cam"
date: "August 18, 2017"
output: html_document
---

## Data Source

The data used to create the Industry Profiler tool is from the US Census Bureau's 2015 County Business Patterns survey.
The data are accessed through the Census Bureau's API for this data set, which is located at api.census.gov/data/2015/cbp.html

## About the Data

The data were collected in 2015. The full data set has key economic measures such as number of establishments (i.e., number of companies), 
number of people employed, and total annual payroll. These values can be segmented by industry (2012 NAICS code) and geographic region 
(metropolitan area, state, etc.).

## Data Cleaning

The data are read into R using the censusapi package. Only the variables concerning industry code, state, number of establishments, and 
number of employees are read into R. For the state location variable, values are given as FIPS codes rather than state names or 
abbreviations. For this reason, we manually created a data frame that provides the state abbreviation (postal code) associated with each 
FIPS code and performed a merge with the main data set in order to append state abbreviations. We then remove the redundant FIPS code 
variables and renamed some of the variables. All data transformations are outlined and run in the global.R script.

## How to Use the Industry Profiler tool

The Industry Profiler is easy to use. Simply select within the drop-down menu the NAICS code associated with the industry you would like 
to examine. The data table in the main panel will then update to show, for each state in the US, how many companies and employees there 
are in the state for that industry. Users may also sort values in the data table in order to quickly see which states have the most or 
least companies or employees. A search bar also allows for keyword searching of rows within the data table.
