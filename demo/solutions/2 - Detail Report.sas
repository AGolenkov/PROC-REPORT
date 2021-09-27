/* Постройте отчет по мировым продажам EA и Ubisoft в 2015 - 2017 годах. Для каждого производителя должна быть */
/* отдельная таблица. Столбцы должны следовать в порядке Производитель - Платформа - Жанр - Имя - Продажи.  */
/* Если значения в следующих друг за другом строчках совпадают ячейка должна становиться объединенной. 
	Посчитайте суммарные продажи по каждому производителю (внизу таблицы)*/

title 'Мировые продажи EA и Ubisoft в 2015-2017 годах по платформам и жанрам';
proc report spanrows;
column Publisher Platform  Genre Name GL_Sales;
define Platform / order;
define Publisher / order;
define Genre / order;
define Name / display;
break after Publisher / summarize page;
run;
title;

/* На основе предыдущего отчета постройте новый отчет, в котором мировые продажи заменены на продажи в Америке, */
/* Европе и Японии. У новых трех столбцов должен быть подзаголовок показатели продаж,а сами столбцы должны содержать */
/* только название региона. */

title 'Продажи EA и Ubisoft в 2015-2017 годах по платформам и жанрам в Америке, Европе и Японии';
proc report spanrows;
column Publisher Platform  Genre Name  ('Показатели продаж' NA_Sales EU_Sales JP_Sales);
define Platform / order;
define Publisher / order;
define Genre / order;
define NA_Sales / analysis 'Америка';
define EU_Sales / analysis 'Европа';
define JP_Sales / analysis 'Япония';
break after Publisher / summarize page;
run;
title;