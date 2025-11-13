BethAnswerPhoneText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Good morning."

	para ""
	done

BethAnswerPhoneDayText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh. Hi, <PLAY_G>."
	done

BethAnswerPhoneNiteText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Good evening."
	done

BethGreetText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Were you sleeping?"
	done

BethGreetDayText:
	text "<PLAY_G>, hi!"
	line "This is @"
	text_ram wStringBuffer3
	text "."

	para "Do you have some"
	line "time?"
	done

BethGreetNiteText:
	text "Hi, <PLAY_G>."
	line "Good evening."

	para "This is @"
	text_ram wStringBuffer3
	text "."

	para "I hope you were"
	line "awake."
	done

BethGenericText:
	text "I was about to"
	line "face the Elite"
	cont "Four but then I"
	cont "stopped myself."
	para "What am I"
	line "thinking?"
	para "I'm not ready yet."
	para "I don't even know"
	line "all of their"
	cont "movesets yet."
	done
