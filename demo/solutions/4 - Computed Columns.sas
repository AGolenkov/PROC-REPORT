/* Создайте отчет, в котором будут отображены процентные показатели продажи в Америке, Европе и Японии от мировых */

title 'Процент продаж EA и Ubisoft в 2015-2017 годах в Америке, Европе и Японии от мировых';
proc report;
column  Publisher  Platform  NA_Sales EU_Sales JP_Sales GL_Sales NA_Pct EU_Pct JP_Pct Other_Pct;
define Publisher / group;
define Platform / group;
define NA_Sales / noprint;
define EU_Sales / noprint;
define JP_Sales / noprint;
define GL_Sales / noprint;
define NA_pct / computed 'Америка' format=percent6.;
define EU_Pct / computed 'Европа' format=percent6.;
define JP_Pct / computed 'Япония' format=percent6.;
define Other_Pct / computed 'Остальной мир' format=percent6.;
compute NA_Pct;
	NA_Pct = NA_Sales.Sum / GL_Sales.Sum;
endcomp;
compute EU_Pct;
	EU_Pct = EU_Sales.Sum / GL_Sales.Sum;
endcomp;
compute JP_Pct;
	JP_Pct = JP_Sales.Sum / GL_Sales.Sum;
endcomp;
compute Other_Pct;
	Other_Pct = 1 - (NA_Pct + EU_Pct + JP_Pct);
endcomp;
run;
title;