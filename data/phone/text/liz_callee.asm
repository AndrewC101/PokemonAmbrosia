LizAnswerPhoneText:
	text "Hello, @"
	text_ram wStringBuffer3
	text_start
	line "speaking."

	para "Oh, <PLAY_G>."
	line "Good morning."
	done

LizAnswerPhoneDayText:
	text "Hello, @"
	text_ram wStringBuffer3
	text_start
	line "speaking."

	para "Oh, <PLAY_G>."
	line "How are you?"
	done

LizAnswerPhoneNiteText:
	text "Hello, @"
	text_ram wStringBuffer3
	text_start
	line "speaking."

	para "Oh, <PLAY_G>."
	line "Good evening."
	done

LizGreetText:
	text "Good morning,"
	line "<PLAY_G>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Were you sleeping?"
	done

LizGreetDayText:
	text "Hi, <PLAY_G>."
	line "This is @"
	text_ram wStringBuffer3
	text "."

	para "How are things"
	line "going for you?"
	done

LizGreetNiteText:
	text "Good evening,"
	line "<PLAY_G>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Are you awake?"
	done

LizGenericText:
	text "Hey um..."
	para "I just thought I'd"
	line "call."
	para "How are your"
	line "#mon doing?"
	para "Do you have a"
	line "crush on anyone?"
	para "I'm sorry that"
	line "just came out!"
	para "I would never"
	line "normally ask if"
	cont "you had a crush on"
	cont "me..."
	para "Oh no."
	done
