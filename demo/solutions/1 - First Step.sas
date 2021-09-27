/* Изучим данные */
proc print data=game.game_sales_2015_2017(obs=10) noobs label;
run;

/* Далее отчеты будем строить по двум производителям: Electronic Arts и Ubisoft, 
 посмотрим на данные по ним */

proc print data=game.game_sales_2015_2017 noobs label;
	where  Publisher in ('Electronic Arts', 'Ubisoft');
run;

/* Сохраним новые данные в отдельный датасет для удобства - work.EA_Ubisoft_sales_2015_2017 */

data work.EA_Ubisoft_sales_2015_2017;
	set game.game_sales_2015_2017;
	where Publisher in ('Electronic Arts', 'Ubisoft');
run;