/* Создайте отчет, содержащий список спортивных игр от Electronic Arts, выпущенных для PS4 в 2015-2017 годах. */
/* Настройте условное форматирование: если продажи быль меньше 1 млн ячейка должна быть красно, иначе - зеленой. */


proc format;
	value cond_format low -< 1000000 = '#ffb3b3'
					  1000000 - high  = '#c2f0c2';
run;

title 'Продажи спортивных игр EA в 2015-2017 годах для PS4';
proc report;
	where  Publisher = 'Electronic Arts' 
		   and  Platform = 'PS4' and  Genre = 'Sports';
	column Name GL_Sales;
	define Name / order order=internal;
	define GL_Sales / analysis style(column)={backgroundcolor = cond_format.};
run;
title;