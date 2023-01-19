﻿
#language: ru

@tree

Функциональность: Дымовые тесты - ПланыВидовХарактеристик - Запись
# Конфигурация: Налоговый мониторинг
# Версия: 3.2.3.31

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Запись элемента плана видов характеристик "Виды аналитик (корпоративные)" (ВидыСубконтоКорпоративные)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	ПланВидовХарактеристик.ВидыСубконтоКорпоративные КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Записываем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"

		* Пересчитаем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПеречитать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПеречитать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"

		* Помечаем на удаление существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно '1С:Предприятие'
				И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент плана видов характеристик ВидыСубконтоКорпоративные"

		* Снимаем пометку на удаление с существующего элемента
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно '1С:Предприятие'
				И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента плана видов характеристик ВидыСубконтоКорпоративные"

		* Откроем элемент в списке
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПоказатьВСписке' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПоказатьВСписке'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось показать в списке элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось показать в списке элемент плана видов характеристик ВидыСубконтоКорпоративные"
				И я закрываю текущее окно
			
		* Запишем и закроем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписатьИЗакрыть' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать и закрыть элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать и закрыть элемент плана видов характеристик ВидыСубконтоКорпоративные"

Сценарий: Запись элемента плана видов характеристик "Категории новостей" (КатегорииНовостей)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	ПланВидовХарактеристик.КатегорииНовостей КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик КатегорииНовостей"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик КатегорииНовостей"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Записываем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент плана видов характеристик КатегорииНовостей"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент плана видов характеристик КатегорииНовостей"

		* Пересчитаем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПеречитать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПеречитать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент плана видов характеристик КатегорииНовостей"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент плана видов характеристик КатегорииНовостей"

		* Помечаем на удаление существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно '1С:Предприятие'
				И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент плана видов характеристик КатегорииНовостей"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент плана видов характеристик КатегорииНовостей"

		* Снимаем пометку на удаление с существующего элемента
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно '1С:Предприятие'
				И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента плана видов характеристик КатегорииНовостей"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента плана видов характеристик КатегорииНовостей"

		* Откроем элемент в списке
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПоказатьВСписке' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПоказатьВСписке'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось показать в списке элемент плана видов характеристик КатегорииНовостей"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось показать в списке элемент плана видов характеристик КатегорииНовостей"
				И я закрываю текущее окно
			
		* Запишем и закроем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписатьИЗакрыть' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать и закрыть элемент плана видов характеристик КатегорииНовостей"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать и закрыть элемент плана видов характеристик КатегорииНовостей"

Сценарий: Запись элемента плана видов характеристик "Разделы дат запрета изменения" (РазделыДатЗапретаИзменения)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	ПланВидовХарактеристик.РазделыДатЗапретаИзменения КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик РазделыДатЗапретаИзменения"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик РазделыДатЗапретаИзменения"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Записываем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент плана видов характеристик РазделыДатЗапретаИзменения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент плана видов характеристик РазделыДатЗапретаИзменения"

		* Пересчитаем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПеречитать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПеречитать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент плана видов характеристик РазделыДатЗапретаИзменения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент плана видов характеристик РазделыДатЗапретаИзменения"

		* Помечаем на удаление существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно '1С:Предприятие'
				И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент плана видов характеристик РазделыДатЗапретаИзменения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент плана видов характеристик РазделыДатЗапретаИзменения"

		* Снимаем пометку на удаление с существующего элемента
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно '1С:Предприятие'
				И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента плана видов характеристик РазделыДатЗапретаИзменения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента плана видов характеристик РазделыДатЗапретаИзменения"

		* Откроем элемент в списке
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПоказатьВСписке' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПоказатьВСписке'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось показать в списке элемент плана видов характеристик РазделыДатЗапретаИзменения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось показать в списке элемент плана видов характеристик РазделыДатЗапретаИзменения"
				И я закрываю текущее окно
			
		* Запишем и закроем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписатьИЗакрыть' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать и закрыть элемент плана видов характеристик РазделыДатЗапретаИзменения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать и закрыть элемент плана видов характеристик РазделыДатЗапретаИзменения"
