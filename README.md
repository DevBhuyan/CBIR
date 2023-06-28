# CBIR
Content-based Image Retrieval system built in MATLAB

This repo contains code for the project 'Study and Implementation of the image feature descriptor, “Center symmetric local binary co-occurrence pattern”', which was part of my pre-final year project. A CBIR system based on CSLBP and GLCM is implemented in MATLAB (version R2015a). 

Refer to: https://www.sciencedirect.com/science/article/abs/pii/S1047320315001583 for the proposed framework. This repository contains an implementation of this work.

We have built it for the datasets mentioned in the text. You can also run it for your own datasets.

To start off, you'll need to create the vector database first, which can be done by executing "database.m". Then you can get a demo using "init_CBIR.m". To benchmark the scores, you can run "Perf_analysis.m" and "Precision_and_Recall.m" sequentially.
