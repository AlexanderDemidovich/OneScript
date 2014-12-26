﻿Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоВозможнаЗаписьUTF8БезBOM");
	
	Возврат ВсеТесты;
	
КонецФункции

Процедура ТестДолжен_ПроверитьЧтоВозможнаЗаписьUTF8БезBOM() Экспорт
	
	Путь = ПолучитьИмяВременногоФайла("txt");
	ЗТ = Новый ЗаписьТекста(Путь, "windows-1251"); 
	ЗТ.Закрыть(); 
	ЗТ = Новый ЗаписьТекста(Путь,"UTF-8",Истина);
	ЗТ.Записать("Привет");
	ЗТ.Закрыть();
	
	Файл = Новый Файл(Путь);
	
	Попытка
		юТест.ПроверитьРавенство(12, Файл.Размер());
	Исключение
		УдалитьФайлы(Путь);
		ВызватьИсключение;
	КонецПопытки;
	
	УдалитьФайлы(Путь);
	
КонецПроцедуры
