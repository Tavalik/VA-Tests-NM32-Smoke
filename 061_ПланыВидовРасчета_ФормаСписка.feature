﻿
#language: ru

@tree

Функциональность: Дымовые тесты - ПланыВидовРасчета - ФормаСписка
# Конфигурация: Налоговый мониторинг
# Версия: 3.2.3.31

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Открытие формы списка плана видов расчета "Начисления"

	Дано Я открываю основную форму списка плана видов расчета "Начисления"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов расчета Начисления"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов расчета Начисления"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка плана видов расчета "Удержания"

	Дано Я открываю основную форму списка плана видов расчета "Удержания"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов расчета Удержания"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов расчета Удержания"
	И Я закрываю текущее окно
