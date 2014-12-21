---
title: "README"
output: html_document
---

This script cleans and summarizes the Human Activity Recognition Using Smartphones data set, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

When downloaded from the internet, the data are initally split into six separate text files. My script initially combines these files into a single R data frame.

Only the mean values and standard deviations that were estimated from the raw accelerometer data have been included in the analysis, along with the identifier of the participant, and the activity that participant was engaged in to obtain those particular data.

Finally, the average of each retained measurement for every combination of participant and activity were reported in a separate data frame.