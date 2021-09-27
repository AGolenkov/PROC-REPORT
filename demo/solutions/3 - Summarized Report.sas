/* Создайте сводный отчет по суммарным и средним продажам в разрезе платформы и жанров. Для каждого производителя  */
/* организуйте отдельную таблицу и подсчитайте подитоги */
title 'Суммарные и средние продажи EA и Ubisoft по платформам и жанрам в 2015 - 2017 годах';
proc report;
column  Publisher Platform Genre  GL_Sales=SumSales GL_Sales=MeanSales;
define Publisher / group;
define Platform / group;
define Genre / group;
define SumSales / analysis sum 'Суммарные мировые/продажи';
define MeanSales / analysis mean 'Средние мировые/продажи';
break after Publisher / summarize page;
run;
title;

/* Измените предыдущий отчет, убрав из него сведения о жанре и показателе средних продаж, */
/*  но добавив измерение в виде столбца по году.  */

title 'Суммарные  продажи EA и Ubisoft по платформам по годам (с 2015 по 2017)';
proc report;
column  Publisher Platform (Year, GL_Sales=SumSales);
define Publisher / group;
define Platform / group;
define SumSales / analysis sum 'Суммарные мировые/продажи';
define year / across ' ';
break after Publisher / summarize page;
run;
title;