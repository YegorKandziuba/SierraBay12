#define RECORD_BIRTHDAY "ДАТА РОЖДЕНИЯ"
#define RECORD_HEIGHT "РОСТ (В СМ)"
#define RECORD_WEIGHT "ВЕС (В КГ)"
#define RECORD_LANGUAGES "ВЛАДЕЕТ ЯЗЫКАМИ"
#define RECORD_LAST_CHANGE "ПОСЛЕДНЕЕ ИЗМЕНЕНИЕ"
#define starts_with(string, substring) (copytext(string,1,1+length(substring)) == substring)

/proc/is_record_title(record)
	return starts_with(record, "@")
// To Do поменять методы на актуальные беевски
/*/proc/ValidateDate(Dates)
	if(istext(Dates)) Dates = FindDate(Dates)
	else if(istype(Dates,/list))
	else return
	var/Day		= text2num(Dates[1])
	var/Month	= text2num(Dates[2])
	var/Year	= text2num(Dates[3])
	while(Month > 12)
		Month -= 12
		Year++
	while(Day > DaysInMonth(Month,Year))
		Day -= DaysInMonth(Month,Year)
		Month++
		while(Month > 12)
			Month -= 12
			Year++
	while(Day <= 0)
		Month--
		Day += DaysInMonth(Month,Year)
	while(Month <= 0)
		Year--
		Month += 12
	return "[Day]/[Month]/[Year]"*/

/proc/get_publical_records_blank()
	return list(
		"@1" = "ОБЩИЕ ДАННЫЕ"
		, "ПОЛНОЕ ИМЯ" = null
		, RECORD_BIRTHDAY = "1/1/2311" // This has custom behaviour
		, RECORD_WEIGHT = null
		, RECORD_HEIGHT = null
		, "ЦВЕТ ВОЛОС" = null
		, "ЦВЕТ ГЛАЗ" = null
		, "ЭТНИЧНОСТЬ" = list(list("Меонец", "Марсианин (Тунеллер)", "Марсианин (Монсинец)", "Венерианец", "Селениан (Низший)", "Селениан (Высший)", "Землянин", "Фобос", "Цереровец", "Плутонец", "Цетит", "Спейсер (Центральный)", "Спейсер (Фронтир)", "Терранец", "Магнитовец", "Гайец (ЦПСС)", "Гайец (ГГК)"), null)
		, RECORD_LANGUAGES = list(null)
		, "ПРЕДПОЧИТАЕМЫЙ ЯЗЫК" = null
		, RECORD_LAST_CHANGE = "1/1/2311"
	)


/proc/get_confidential_records_blank()
	return list(
		"@2" = "КОНФИДЕНЦИАЛЬНАЯ ИНФОРМАЦИЯ"
		, "СЕМЕЙНОЕ ПОЛОЖЕНИЕ" = list(list("Женат", "Не женат", "Замужем", "Не замужем"), null)
		, "РОДСТВЕННИКИ" = list()
		, "ЭКСТРЕННЫЙ КОНТАКТ" = null
		, "МЕСТО ПРОЖИВАНИЯ" = null
	)

/proc/get_medical_records_blank()
	return list(
		"@3" = "МЕДИЦИНСКАЯ СПРАВКА"
		, "ГИПЕРТОНИЯ" = list(list("Да", "Нет"), "Нет")
		, "АЛЛЕРГИИ" = list()
		, "ПОСМЕРТНЫЕ ИНСТРУКЦИИ" = list(list("Кремация", "Сохранение в морге", "Традиционное погребение", "Передача родственникам"), null)
		, "ДОНОР ОРГАНОВ" = list(list("Да", "Нет"), "Да")
		, "ПРОТЕЗЫ, ИМПЛАНТЫ" = list()
		, "ХИРУРГИЧЕСКИЕ ЗАПИСИ" = list()
		, "АКУШЕРСКИЕ ЗАПИСИ" = "N/A"
		, "ЗАПИСИ О МЕДИКАМЕНТАХ" = list()
		, "ТЕКУЩИЕ РЕЦЕПТЫ" = list()
		, "ЗАДОКУМЕНТИРОВАННЫЕ ФИЗИОЛОГИЧЕСКИЕ ОСОБЕННОСТИ" = list()
		, "ЗАКЛЮЧЕНИЕ ПСИХИАТРА" = null
	)

/proc/get_general_records_blank()
	return list(
		"@4" = "ЗАПИСИ ОТДЕЛА КАДРОВ"
		, "ОБРАЗОВАНИЕ" = null
		, "КВАЛИФИКАЦИЯ" = list(null)
		, "ЛИЦЕНЗИИ" = list(null)
		, "ПРОХОДИТ СТАЖИРОВКУ" = list(null)
		, "ИСТОРИЯ ТРУДОУСТРОЙСТВА" = list(null)
		, "ЗАМЕТКИ ВЕРБОВЩИКА" = null
	)

/proc/get_security_records_blank()
	return list(
		"@5" = "ОТЧЕТ ОТДЕЛА БЕЗОПАСНОСТИ"
		, "НАХОДИТСЯ ПОД ОФИЦИАЛЬНЫМ НАБЛЮДЕНИЕМ" = list(list("Да", "Нет"), "Нет")
		, "ИЗВЕСТНЫЕ КРИМИНАЛЬНЫЕ СООБЩНИКИ" = list(null)
		, "ИСТОРИЯ АРЕСТОВ" = list(null)
		, "ОЦЕНКА УРОВНЯ УГРОЗЫ ПРОТИВ КОРПОРАЦИИ" = list(list("Очень низкий","Низкий","Средний","Высокий","ОЧЕНЬ ВЫСОКИЙ"),null)
		, "ОЦЕНКА УРОВНЯ УГРОЗЫ ПРОТИВ ЭКИПАЖА" = list(list("Очень низкий","Низкий","Средний","Высокий","ОЧЕНЬ ВЫСОКИЙ"),null)
		, "ОБЩИЕ ЗАМЕТКИ" = null
	)
