/datum/preferences
	var/public_record = ""
	var/conf_record = ""
	var/med_record = ""
	var/sec_record = ""
	var/gen_record = ""
	var/list/public_blank
	var/list/conf_blank
	var/list/med_blank
	var/list/gen_blank
	var/list/sec_blank
	var/memory = ""
	var/email_addr = ""
	var/email_pass = ""

/datum/category_item/player_setup_item/background/records
	name = "Records"
	sort_order = 3
	var/blank_ussed

/datum/category_item/player_setup_item/background/records/load_character(datum/pref_record_reader/R)
	pref.public_record = R.read("public_record")
	pref.med_record = R.read("med_record")
	pref.sec_record = R.read("sec_record")
	pref.gen_record = R.read("gen_record")
	pref.memory = R.read("memory")
	pref.email_addr = R.read("email_addr")
	pref.email_pass = R.read("email_pass")

/datum/category_item/player_setup_item/background/records/save_character(datum/pref_record_writer/W)
	W.write("public_record", pref.public_record)
	W.write("med_record", pref.med_record)
	W.write("sec_record", pref.sec_record)
	W.write("gen_record", pref.gen_record)
	W.write("memory", pref.memory)
	W.write("email_addr", pref.email_addr)
	W.write("email_pass", pref.email_pass)

/datum/category_item/player_setup_item/background/records/proc/allow_email_branch_check(datum/mil_branch/B)
	return B.allow_custom_email

/datum/category_item/player_setup_item/background/records/content(mob/user)
	. = list()

	. += "<br><b>Records</b>:"
	. += VBTN("set_blank", blank_ussed ,"Использование бланка")
	if (jobban_isbanned(user, "Records"))
		. += "[SPAN_WARNING("You are banned from using character records.")]"
	else if (!blank_ussed)
		for(var/ID in pref.public_blank)
			var/R = pref.public_blank[ID]
			if(!R)
				. += "<b>[ID]</b>: <a href='?src=\ref[src];recedit=[ID]'><i>Необходимо заполнить</i></a><br>"

			else if(islist(R))
				. += "<b>[ID]</b>:"
				var/list/L = R

				if(L.len == 2 && islist(L[1])) // list(list(...), ...) aka selectable
					//                                   Value  ---^
					. += "<a href='?src=\ref[src];receditlp=[ID];' [L[2] ? "" : "class = 'requiredToBeFull'"]>[L[2] || "<i>Заполнить</i>"]</a><br>"
					continue

				. += "<br/>"

				if(L.len && (!L[1]))
					. += "\t<a href='?src=\ref[src];recappend=[ID];' class = 'requiredToBeFull'><i>Необходимо добавить</i></a><br>"
					continue

				var/i = 1
				for(var/E in L)
					var/buttons = "<a href='?src=\ref[src];receditl=[ID];count=[i]'><i>Редактировать</i></a>"
					buttons += "<a href='?src=\ref[src];recerasel=[ID];count=[i]'><i>X</i></a>"

					. += "\t[E] [buttons]<br/>"
					++i

				. += "\t<a href='?src=\ref[src];recappend=[ID];'><i>Добавить</i></a><br>"

			else if(is_record_title(ID))
				. += "<h1>\[[R]\]<hr></h1>"
				continue
			else
				. += "<b>[ID]</b>: <a href='?src=\ref[src];recedit=[ID]'>[R]</a><br>"
		.+= TBTN("set_memory", TextPreview(pref.memory, 40), "Memory")
	else
		.+= TBTN("set_public_record", TextPreview(pref.public_record, 40), "Public")
		.+= TBTN("set_medical_records", TextPreview(pref.med_record, 40), "Medical")
		.+= TBTN("set_general_records", TextPreview(pref.gen_record, 40), "Employment")
		.+= TBTN("set_security_records", TextPreview(pref.sec_record, 40), "Security")
		.+= TBTN("set_memory", TextPreview(pref.memory, 40), "Memory")

	. += "<br><b>Other</b>:"
	var/set_addr_button = TBTN("set_email_addr", pref.email_addr ? pref.email_addr : "(default)", "Email Address")
	var/list/branches = pref.for_each_selected_branch(new Callback(src, .proc/allow_email_branch_check))
	for (var/name in branches)
		set_addr_button += "  " + (branches[name] ? UI_FONT_GOOD(name) : UI_FONT_BAD(name))
	. += set_addr_button

	. += TBTN("set_email_pass", pref.email_pass ? pref.email_pass : "(random)", "Email Password")
	. = jointext(., "<br>")

/datum/category_item/player_setup_item/background/records/OnTopic(href,list/href_list, mob/user)
	if (href_list["set_blank"])
		blank_ussed = !blank_ussed
		return TOPIC_REFRESH

	else if(href_list["recedit"])
		var/ID = href_list["recedit"]
		if(!(ID in pref.public_blank) || jobban_isbanned(user, "Records") || !CanUseTopic(user))
			return TOPIC_NOACTION

		var/nr

		nr = sanitize(input(user, "[ID]", "Записи", pref.public_blank[ID]) as null|message, 500, extra = 0)

		if(!nr)
			return TOPIC_NOACTION

		/*switch(ID)
			if(RECORD_BIRTHDAY)
				var/global/regex/regex = regex(@"^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$")
				if(!regex.Find(nr))
					return TOPIC_NOACTION

				nr = ValidateDate(nr) // Before FindDate because we need validated date

				var/list/dates = FindDate(nr)

				pref.birth_day   = text2num(dates[1])
				pref.birth_month = text2num(dates[2])
				pref.birth_year  = text2num(dates[3])
				pref.age 		 = global.game_year - pref.birth_year
			if(RECORD_HEIGHT)
				pref.height = clamp(text2num(nr), 150, 200)
				nr = "[pref.height]"
			if(RECORD_WEIGHT)
				pref.weight = clamp(text2num(nr), 40, 120)
				nr = "[pref.weight]"*/

		pref.public_blank[ID] = nr

		return TOPIC_REFRESH

	else if(href_list["receditl"])
		var/ID = href_list["receditl"]
		var/count = text2num(href_list["count"])
		if(!(ID in pref.public_blank) \
			|| !CanUseTopic(user) \
			|| count < 1 \
			|| count > pref.public_blank[ID].len \
			|| !islist(pref.public_blank[ID]) \
			|| jobban_isbanned(user, "Records"))
			return TOPIC_NOACTION

		var/nr = sanitize(input(user, "[ID]", "Записи", pref.public_blank[ID][count]) as null|message, 500, extra = 0)
		if(!nr)
			return TOPIC_NOACTION
		pref.public_blank[ID][count] = nr

		return TOPIC_REFRESH

	else if(href_list["recerasel"])
		var/ID = href_list["recerasel"]
		var/count = text2num(href_list["count"])

		if(!(ID in pref.public_blank) \
			|| !CanUseTopic(user) \
			|| count < 1 \
			|| count > pref.public_blank[ID].len \
			|| !islist(pref.public_blank[ID]) \
			|| jobban_isbanned(user, "Records"))
			return TOPIC_NOACTION
		var/list/R = pref.public_blank[ID]
		R.Remove(R[count])

		return TOPIC_REFRESH

	else if(href_list["receditlp"])
		var/ID = href_list["receditlp"]
		if(!(ID in pref.public_blank) \
			|| !CanUseTopic(user) \
			|| !islist(pref.public_blank[ID]) \
			|| !islist(pref.public_blank[ID][1]) \
			|| jobban_isbanned(user, "Records"))
			return TOPIC_NOACTION
		var/list/choices = pref.public_blank[ID][1]
		var/lc = length(choices)
		if(lc < 2)
			return
		else if(lc > 2)
			pref.public_blank[ID][2] = input(user, "[ID]", "Записи", pref.public_blank[ID][2]) in choices
		else
			var/current = choices.Find(pref.public_blank[ID][2])
			pref.public_blank[ID][2] = choices[current % 2 + 1]
		return TOPIC_REFRESH
	else if(href_list["recappend"])
		var/ID = href_list["recappend"]

		if(!(ID in pref.public_blank) \
			|| !CanUseTopic(user) \
			|| !islist(pref.public_blank[ID]) \
			|| jobban_isbanned(user, "Records"))
			return TOPIC_NOACTION

		var/nr = sanitize(input(user, "[ID]", "Записи") as null|message, 500, extra = 0)
		if(!nr)
			return TOPIC_NOACTION

		var/list/L = pref.public_blank[ID]
		if(L.len == 1 && isnull(L[1]))
			L[1] = nr
		else
			pref.public_blank[ID] += nr


	else if (href_list["set_public_record"])
		var/new_public = sanitize(input(user,"Enter general public record information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.public_record)) as message|null, MAX_PAPER_MESSAGE_LEN, extra = 0)
		if (!isnull(new_public) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.public_record = new_public
		return TOPIC_REFRESH

	else if(href_list["set_medical_records"])
		var/new_medical = sanitize(input(user,"Enter medical information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.med_record)) as message|null, MAX_PAPER_MESSAGE_LEN, extra = 0)
		if(!isnull(new_medical) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.med_record = new_medical
		return TOPIC_REFRESH

	else if(href_list["set_general_records"])
		var/new_general = sanitize(input(user,"Enter employment information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.gen_record)) as message|null, MAX_PAPER_MESSAGE_LEN, extra = 0)
		if(!isnull(new_general) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.gen_record = new_general
		return TOPIC_REFRESH

	else if(href_list["set_security_records"])
		var/sec_medical = sanitize(input(user,"Enter security information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.sec_record)) as message|null, MAX_PAPER_MESSAGE_LEN, extra = 0)
		if(!isnull(sec_medical) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.sec_record = sec_medical
		return TOPIC_REFRESH

	else if(href_list["set_memory"])
		var/memes = sanitize(input(user,"Enter memorized information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.memory)) as message|null, MAX_PAPER_MESSAGE_LEN, extra = 0)
		if(!isnull(memes) && CanUseTopic(user))
			pref.memory = memes
		return TOPIC_REFRESH

	else if (href_list["set_email_pass"])
		var/value = input(user, "Enter email password:", "Email Password", pref.email_pass) as text
		if (isnull(value) || !CanUseTopic(user))
			return TOPIC_NOACTION
		if (value != "")
			var/clean = sanitize(value)
			var/chars = length(clean)
			if (chars < 4 || chars > 16)
				to_chat(user, SPAN_WARNING("Invalid Email Password '[clean]': must be 4..16 safe glyphs."))
				return TOPIC_NOACTION
			value = clean
		pref.email_pass = value
		return TOPIC_REFRESH

	else if (href_list["set_email_addr"])
		var/value = input(user, "Enter email username:", "Email Address", pref.email_addr) as text
		if (isnull(value) || !CanUseTopic(user))
			return TOPIC_NOACTION
		if (value != "")
			var/clean = sanitize_for_email(value)
			var/chars = length(clean)
			if (chars < 4 || chars > 24)
				to_chat(user, SPAN_WARNING("Invalid Email Username '[clean]': must be 4..24 glyphs from /a-z0-9./"))
				return TOPIC_NOACTION
			value = clean
		pref.email_addr = value
		return TOPIC_REFRESH

	. =  ..()
