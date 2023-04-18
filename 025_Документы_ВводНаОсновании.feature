﻿
#language: ru

@tree

Функциональность: Дымовые тесты - Документы - ВводНаОсновании
# Конфигурация: Налоговый мониторинг
# Версия: 3.2.3.56

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: ВводНаОсновании элемента документа "Запрос данных налогового мониторинга" (ЗапросДанныхНалоговогоМониторинга)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.ЗапросДанныхНалоговогоМониторинга КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ЗапросДанныхНалоговогоМониторинга"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ЗапросДанныхНалоговогоМониторинга"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ОтветНаЗапросНалоговогоМониторинга
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОтветНаЗапросНалоговогоМониторингаСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОтветНаЗапросНалоговогоМониторингаСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтветНаЗапросНалоговогоМониторинга на основании документа ЗапросДанныхНалоговогоМониторинга" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтветНаЗапросНалоговогоМониторинга на основании документа ЗапросДанныхНалоговогоМониторинга"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Передача ОС" (ПередачаОС)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.ПередачаОС КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПередачаОС"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПередачаОС"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ПоступлениеНаРасчетныйСчет
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПоступлениеНаРасчетныйСчетСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПоступлениеНаРасчетныйСчетСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПоступлениеНаРасчетныйСчет на основании документа ПередачаОС" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПоступлениеНаРасчетныйСчет на основании документа ПередачаОС"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ПриходныйКассовыйОрдер
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПриходныйКассовыйОрдерСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПриходныйКассовыйОрдерСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПриходныйКассовыйОрдер на основании документа ПередачаОС" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПриходныйКассовыйОрдер на основании документа ПередачаОС"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ СчетФактураВыданный
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСчетФактураВыданныйСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСчетФактураВыданныйСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетФактураВыданный на основании документа ПередачаОС" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетФактураВыданный на основании документа ПередачаОС"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Поступление на расчетный счет" (ПоступлениеНаРасчетныйСчет)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.ПоступлениеНаРасчетныйСчет КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПоступлениеНаРасчетныйСчет"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПоступлениеНаРасчетныйСчет"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ СписаниеСРасчетногоСчета
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСписаниеСРасчетногоСчетаСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСписаниеСРасчетногоСчетаСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СписаниеСРасчетногоСчета на основании документа ПоступлениеНаРасчетныйСчет" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СписаниеСРасчетногоСчета на основании документа ПоступлениеНаРасчетныйСчет"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Поступление (акты, накладные, УПД)" (ПоступлениеТоваровУслуг)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.ПоступлениеТоваровУслуг КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПоступлениеТоваровУслуг"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПоступлениеТоваровУслуг"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ АктОРасхождениях
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументАктОРасхожденияхСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументАктОРасхожденияхСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ АктОРасхождениях на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ АктОРасхождениях на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ЗаявлениеОВвозеТоваров
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументЗаявлениеОВвозеТоваровСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументЗаявлениеОВвозеТоваровСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ЗаявлениеОВвозеТоваров на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ЗаявлениеОВвозеТоваров на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ КорректировкаПоступления
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументКорректировкаПоступленияСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументКорректировкаПоступленияСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ КорректировкаПоступления на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ КорректировкаПоступления на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ОтражениеНачисленияНДС
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОтражениеНачисленияНДССоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОтражениеНачисленияНДССоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНачисленияНДС на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНачисленияНДС на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ОтражениеНДСКВычету
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОтражениеНДСКВычетуСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОтражениеНДСКВычетуСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНДСКВычету на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНДСКВычету на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ПередачаОСВАренду
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПередачаОСВАрендуСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПередачаОСВАрендуСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПередачаОСВАренду на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПередачаОСВАренду на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ПлатежноеПоручение
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПлатежноеПоручениеСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПлатежноеПоручениеСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПлатежноеПоручение на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПлатежноеПоручение на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ РасходныйКассовыйОрдер
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументРасходныйКассовыйОрдерСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументРасходныйКассовыйОрдерСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ РасходныйКассовыйОрдер на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ РасходныйКассовыйОрдер на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ СписаниеНДС
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСписаниеНДССоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСписаниеНДССоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СписаниеНДС на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СписаниеНДС на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ СписаниеСРасчетногоСчета
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСписаниеСРасчетногоСчетаСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСписаниеСРасчетногоСчетаСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СписаниеСРасчетногоСчета на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СписаниеСРасчетногоСчета на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ СчетНаОплатуПокупателю
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСчетНаОплатуПокупателюСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСчетНаОплатуПокупателюСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетНаОплатуПокупателю на основании документа ПоступлениеТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетНаОплатуПокупателю на основании документа ПоступлениеТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Принятие к учету ОС" (ПринятиеКУчетуОС)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.ПринятиеКУчетуОС КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПринятиеКУчетуОС"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа ПринятиеКУчетуОС"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ПередачаОСВАренду
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПередачаОСВАрендуСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПередачаОСВАрендуСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПередачаОСВАренду на основании документа ПринятиеКУчетуОС" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПередачаОСВАренду на основании документа ПринятиеКУчетуОС"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Реализация (акты, накладные, УПД)" (РеализацияТоваровУслуг)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.РеализацияТоваровУслуг КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа РеализацияТоваровУслуг"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа РеализацияТоваровУслуг"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ АктОРасхожденияхПолученный
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументАктОРасхожденияхПолученныйСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументАктОРасхожденияхПолученныйСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ АктОРасхожденияхПолученный на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ АктОРасхожденияхПолученный на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ КорректировкаРеализации
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументКорректировкаРеализацииСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументКорректировкаРеализацииСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ КорректировкаРеализации на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ КорректировкаРеализации на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ОплатаПлатежнойКартой
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОплатаПлатежнойКартойСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОплатаПлатежнойКартойСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОплатаПлатежнойКартой на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОплатаПлатежнойКартой на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ОтражениеНачисленияНДС
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОтражениеНачисленияНДССоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОтражениеНачисленияНДССоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНачисленияНДС на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНачисленияНДС на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ПередачаЗадолженностиНаФакторинг
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПередачаЗадолженностиНаФакторингСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПередачаЗадолженностиНаФакторингСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПередачаЗадолженностиНаФакторинг на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПередачаЗадолженностиНаФакторинг на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ПоступлениеНаРасчетныйСчет
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПоступлениеНаРасчетныйСчетСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПоступлениеНаРасчетныйСчетСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПоступлениеНаРасчетныйСчет на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПоступлениеНаРасчетныйСчет на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ПриходныйКассовыйОрдер
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПриходныйКассовыйОрдерСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПриходныйКассовыйОрдерСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПриходныйКассовыйОрдер на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПриходныйКассовыйОрдер на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ СчетНаОплатуПокупателю
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСчетНаОплатуПокупателюСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСчетНаОплатуПокупателюСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетНаОплатуПокупателю на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетНаОплатуПокупателю на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ТаможеннаяДекларацияЭкспорт
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументТаможеннаяДекларацияЭкспортСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументТаможеннаяДекларацияЭкспортСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ТаможеннаяДекларацияЭкспорт на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ТаможеннаяДекларацияЭкспорт на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ УведомлениеОПеремещенииПрослеживаемыхТоваров
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументУведомлениеОПеремещенииПрослеживаемыхТоваровСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументУведомлениеОПеремещенииПрослеживаемыхТоваровСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ УведомлениеОПеремещенииПрослеживаемыхТоваров на основании документа РеализацияТоваровУслуг" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ УведомлениеОПеремещенииПрослеживаемыхТоваров на основании документа РеализацияТоваровУслуг"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Списание с расчетного счета" (СписаниеСРасчетногоСчета)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.СписаниеСРасчетногоСчета КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа СписаниеСРасчетногоСчета"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа СписаниеСРасчетногоСчета"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ПлатежноеПоручение
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПлатежноеПоручениеСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПлатежноеПоручениеСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПлатежноеПоручение на основании документа СписаниеСРасчетногоСчета" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПлатежноеПоручение на основании документа СписаниеСРасчетногоСчета"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ СчетФактураПолученный
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументСчетФактураПолученныйСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументСчетФактураПолученныйСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетФактураПолученный на основании документа СписаниеСРасчетногоСчета" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ СчетФактураПолученный на основании документа СписаниеСРасчетногоСчета"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Счет-фактура выданный" (СчетФактураВыданный)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.СчетФактураВыданный КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа СчетФактураВыданный"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа СчетФактураВыданный"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ОтражениеНДСКВычету
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОтражениеНДСКВычетуСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОтражениеНДСКВычетуСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНДСКВычету на основании документа СчетФактураВыданный" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНДСКВычету на основании документа СчетФактураВыданный"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Счет-фактура полученный" (СчетФактураПолученный)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.СчетФактураПолученный КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа СчетФактураПолученный"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа СчетФактураПолученный"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ОтражениеНачисленияНДС
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументОтражениеНачисленияНДССоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументОтражениеНачисленияНДССоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНачисленияНДС на основании документа СчетФактураПолученный" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ОтражениеНачисленияНДС на основании документа СчетФактураПолученный"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'
