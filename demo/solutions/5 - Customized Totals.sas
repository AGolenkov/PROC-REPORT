/* Создайте отчет, содержащий кастомизированную строку подитога. Отчет должен содержать сведения о */
/* максимальных продажах каждой компании по жанрам в рамках производителя. */
/* Строка подитого должна быть следюущей: "Максимальная величина продаж компании <Имя компании> : <число>" */

title 'Максимальные продажи EA и Ubisoft по жанрам в 2015-2017 годах';
proc report;
	column Publisher Genre GL_Sales=MaxSales;
	define Publisher / group;
	define Genre / group;
	define MaxSales / analysis max 'Максимальные продажи';
	compute after Publisher;
		MaxPub = catx(' ', 'Максимальная величина продажи компании',
					  Publisher, ': ', put(MaxSales, dollar14.));
		line MaxPub $120.;
	endcomp;
run;
title;