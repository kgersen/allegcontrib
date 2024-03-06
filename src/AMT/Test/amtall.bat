@echo off
echo A1£A2£A3£A4£A5£A6£A7£A8£A9£AA£AB£AC£AD£AF£AE£AF£B0£B1£B2£B3£B4£B5 >allamt.txt
for %%I in ("sel\*.mdl") do AMT %%I dummy >> allamt.txt