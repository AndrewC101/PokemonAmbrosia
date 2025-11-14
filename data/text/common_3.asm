_OakText6::
	text "Now remember,"
	line "what is your name?"
	prompt

_OakText7::
	text "I am proud of you"
	line "<PLAYER>."
	para "The world is a"
	line "dangerous place"
	cont "but with your"
	cont "#mon you can"
	cont "do anything."
	para "Now it is time to"
	line "wake up and start"
	cont "your adventure."
	done
	;text "<PLAYER>, are you"
	;line "ready?"
	;para "Your very own"
	;line "#mon story is"
	;cont "about to unfold."0
	;para "You'll face fun"
	;line "times and tough"
	;cont "challenges."
	;para "A world of dreams"
	;line "and adventures"
	;para "with #mon"
	;line "awaits! Let's go!"
	;para "I'll be seeing you"
	;line "later!"
	;done

_ClockTimeMayBeWrongText::
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt

_ClockSetWithControlPadText::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done

_ClockIsThisOKText::
	text "Is this OK?"
	done

_ClockHasResetText::
	text "The clock has been"
	line "reset."
	done

_LinkTimeoutText::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

_LinkTradeCantBattleText::
	text "If you trade that"
	line "#mon, you won't"
	cont "be able to battle."
	prompt

_LinkAbnormalMonText::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

_LinkAskTradeForText::
	text "Trade @"
	text_ram wBufferTrademonNickname
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #mon."

	para "Is that OK?"
	done

_MobileBattleMoreInfoText::
	text "Need more info on"
	line "mobile battles?"
	done

_MobileBattleRulesText::
	text "For a mobile"
	line "battle, choose"
	cont "three #mon."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#mon wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

_WouldYouLikeToMobileBattleText::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

_WantAQuickMobileBattleText::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

_WantToRushThroughAMobileBattleText::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

_PleaseTryAgainTomorrowText::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

_TryAgainUsingSameSettingsText::
	text "Try again using"
	line "the same settings?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "There is less than"
	line "1 min. left today!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "No time left for"
	line "linking today."
	done

_PickThreeMonForMobileBattleText::
	text "Pick three #mon"
	line "for battle."
	done

_MobileBattleRemainingTimeText::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "Would you like to"
	line "save the game?"
	done

_SavingDontTurnOffThePowerText::
	text "Saving Don't turn"
	line "off the Power."
	done

_SavedTheGameText::
	text "<PLAYER> saved"
	line "the game."
	done

_AlreadyASaveFileText::
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

_AnotherSaveFileText::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

_SaveFileCorruptedText::
	text "The save file is"
	line "corrupted!"
	prompt

_ChangeBoxSaveText::
	text "When you change a"
	line "#mon Box, data"
	cont "will be saved. OK?"
	done

_MoveMonWOMailSaveText::
	text "Each time you move"
	line "a #mon, data"
	cont "will be saved. OK?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "The window save"
	line "area was exceeded."
	done

_WindowPoppingErrorText::
	text "No windows avail-"
	line "able for popping."
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

_BGEventText::
	text "BG event"
	done

_CoordinatesEventText::
	text "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

_SeerSeeAllText::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #mon!"
	done

_SeerCantTellAThingText::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

_SeerNameLocationText::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

_SeerTradeText::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOT
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOT
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

_SeerNoLocationText::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

_SeerEggText::
	text "Hey!"

	para "That's an Egg!"

	para "You can't say that"
	line "you've met it yet…"
	done

_SeerDoNothingText::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

_SeerMoreCareText::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#mon with a"
	line "little more care."
	done

_SeerMoreConfidentText::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

_SeerMuchStrengthText::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

_SeerMightyText::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#mon battles."

	para "It looks brimming"
	line "with confidence."
	done

_SeerImpressedText::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #mon as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
	done

_CongratulationsYourPokemonText::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

_EvolvingText::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

_MartHowManyText::
	text "How many?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #mon may"
	line "not like them."

	para "Hehehehe…"
	done

_HerbalLadyHowManyText::
	text "How many?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Thank you, dear."
	line "Hehehehe…"
	done

_HerbalLadyPackFullText::
	text "Oh? Your Pack is"
	line "full, dear."
	done

_HerbalLadyNoMoneyText::
	text "Hehehe… You don't"
	line "have the money."
	done

_HerbalLadyComeAgainText::
	text "Come again, dear."
	line "Hehehehe…"
	done

_BargainShopIntroText::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

_BargainShopThanksText::
	text "Thanks."
	done

_BargainShopPackFullText::
	text "Uh-oh, your Pack"
	line "is chock-full."
	done

_BargainShopSoldOutText::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

_BargainShopNoFundsText::
	text "Uh-oh, you're"
	line "short on funds."
	done

_BargainShopComeAgainText::
	text "Come by again"
	line "sometime."
	done

_PharmacyIntroText::
	text "What's up? Need"
	line "some medicine?"
	done

_PharmacyHowManyText::
	text "How many?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Thanks much!"
	done

_PharmacyPackFullText::
	text "You don't have any"
	line "more space."
	done

_PharmacyNoMoneyText::
	text "Huh? That's not"
	line "enough money."
	done

_PharmacyComeAgainText::
	text "All right."
	line "See you around."
	done

_NothingToSellText::
	text "You don't have"
	line "anything to sell."
	prompt

_MartSellHowManyText::
	text "How many?"
	done

_MartSellPriceText::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

_MartWelcomeText::
	text "Welcome! How may I"
	line "help you?"
	done

_MartThanksText::
	text "Here you are."
	line "Thank you!"
	done

_MartNoMoneyText::
	text "You don't have"
	line "enough money."
	done

_MartPackFullText::
	text "You can't carry"
	line "any more items."
	done

_MartCantBuyText::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

_MartComeAgainText::
	text "Please come again!"
	done

_MartAskMoreText::
	text "Can I do anything"
	line "else for you?"
	done

_MartBoughtText::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

_SlotsBetHowManyCoinsText::
	text "Bet how many"
	line "coins?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Not enough"
	line "coins."
	prompt

_SlotsRanOutOfCoinsText::
	text "Darn… Ran out of"
	line "coins…"
	done

_SlotsPlayAgainText::
	text "Play again?"
	done

_SlotsLinedUpText::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

_SlotsDarnText::
	text "Darn!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the Mobile Stadium"

	para "of the N64 #mon"
	line "Stadium 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "Mobile Stadium"

	para "battles in the N64"
	line "#mon Stadium 2."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Clock time unknown"
	done

_DeleteSavedLoginPasswordText::
	text "Delete the saved"
	line "Login Password?"
	done

_DeletedTheLoginPasswordText::
	text "Deleted the Login"
	line "Password."
	done

_MobilePickThreeMonForBattleText::
	text "Pick three #mon"
	line "for battle."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Only three #mon"
	line "may enter."
	prompt

_MobileCardFolderIntro1Text::
	text "The Card Folder"
	line "stores your and"

	para "your friends'"
	line "Cards."

	para "A Card contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "This is your Card."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade Cards with"
	cont "your friends."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "If you have your"
	line "friend's Card, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#mon Center."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "To safely store"
	line "your collection of"

	para "Cards, you must"
	line "set a Passcode for"
	cont "your Card Folder."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "If the Card Folder"
	line "is deleted, all"

	para "its cards and the"
	line "Passcode will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "Card Folder can't"
	cont "be restored."

	para "Want to delete"
	line "your Card Folder?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Are you sure you"
	line "want to delete it?"
	done

_MobileCardFolderDeletedText::
	text "The Card Folder"
	line "has been deleted."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "There is an older"
	line "Card Folder from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Delete the old"
	line "Card Folder?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Finish registering"
	line "Cards?"
	done

_PhoneWrongNumberText::
	text "Huh? Sorry, wrong"
	line "number!"
	done

_PhoneClickText::
	text "Click!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "That number is out"
	line "of the area."
	done

_PhoneJustTalkToThemText::
	text "Just go talk to"
	line "that person!"
	done

_PhoneThankYouText::
	text "Thank you!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Select Continue &"
	line "reset settings."
	prompt

_PasswordAskResetClockText::
	text "Reset the clock?"
	done

_ClearAllSaveDataText::
	text "Clear all save"
	line "data?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Which move should"
	next "be forgotten?"
	done

_StopLearningMoveText::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "did not learn"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "But @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 and…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

_MoveCantForgetHMText::
	text "HM moves can't be"
	line "forgotten now."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Play with three"
	line "coins?"
	done

_CardFlipNotEnoughCoinsText::
	text "Not enough coins…"
	prompt

_CardFlipChooseACardText::
	text "Choose a card."
	done

_CardFlipPlaceYourBetText::
	text "Place your bet."
	done

_CardFlipPlayAgainText::
	text "Want to play"
	line "again?"
	done

_CardFlipShuffledText::
	text "The cards have"
	line "been shuffled."
	prompt

_CardFlipYeahText::
	text "Yeah!"
	done

_CardFlipDarnText::
	text "Darn…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "You're out of the"
	line "service area."
	prompt

_PokegearAskWhoCallText::
	text "Whom do you want"
	line "to call?"
	done

_PokegearPressButtonText::
	text "Press any button"
	line "to exit."
	done

_PokegearAskDeleteText::
	text "Delete this stored"
	line "phone number?"
	done

_BuenaAskWhichPrizeText::
	text "Which prize would"
	line "you like?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

_BuenaHereYouGoText::
	text "Here you go!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "You don't have"
	line "enough points."

	para ""
	done

_BuenaNoRoomText::
	text "You have no room"
	line "for it."

	para ""
	done

_BuenaComeAgainText::
	text "Oh. Please come"
	line "back again!"
	done

_BTExcuseMeText::
	text "Excuse me!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Please return when"
	line "you're ready."
	done

_NeedAtLeastThreeMonText::
	text "You need at least"
	line "three #mon."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, an Egg"
	line "doesn't qualify."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Only three #mon"
	line "may be entered."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "The @"
	text_ram wStringBuffer2
	text " #mon"
	line "must all be"
	cont "different kinds."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "The @"
	text_ram wStringBuffer2
	text " #mon"
	line "must not hold the"
	cont "same items."

	para ""
	done

_YouCantTakeAnEggText::
	text "You can't take an"
	line "Egg!"

	para ""
	done

_BallDodgedText::
	text "It dodged the"
	line "thrown Ball!"

	para "This #mon"
	line "can't be caught!"
	prompt

_BallMissedText::
	text "You missed the"
	line "#mon!"
	prompt

_BallBrokeFreeText::
	text "Oh no! The #mon"
	line "broke free!"
	prompt

_BallAppearedCaughtText::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

_BallAlmostHadItText::
	text "Aargh!"
	line "Almost had it!"
	prompt

_BallSoCloseText::
	text "Shoot! It was so"
	line "close too!"
	prompt

_LevelTooHighText::
    text "Enemy level is"
    line "too high!"
    prompt

_MoreBadgesText::
    text "More badges are"
    line "needed!"
    prompt

Text_BallCaught::
	text "Gotcha! @"
	text_ram wEnemyMonNickname
	text_start
	line "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to Bill's PC."
	prompt

_NewDexDataText::
	text_ram wEnemyMonNickname
	text "'s data"
	line "was newly added to"
	cont "the #dex.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

_AmbrosiaText::
    text "Full Potential"
    line "Awakened!"
    prompt

_RepulsorTurnOffText::
	text "Repulsor is off."
	prompt

_RepulsorTurnOnText::
	text "Repulsor is on."
	prompt

_ItemCantUseOnMonText::
	text "That can't be used"
	line "on this #mon."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "The Repel used"
	line "earlier is still"
	cont "in effect."
	prompt

_PlayedFluteText::
	text "Played the #"
	line "Flute."

	para "Now, that's a"
	line "catchy tune!"
	prompt

_FluteWakeUpText::
	text "All sleeping"
	line "#mon woke up."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> played the"
	line "# Flute.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

_CoinCaseCountText::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Raise the PP of"
	line "which move?"
	done

_RestoreThePPOfWhichMoveText::
	text "Restore the PP of"
	line "which move?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2
	text "'s PP"
	line "maximised."
	prompt

_PPRestoredText::
	text "PP was restored."
	prompt

_SentDecorationsHomeText::
    text "Congratulations!"
    para "Your Bedroom is"
    line "now decked out!"
    prompt

_SentTrophyHomeText::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

_ItemLooksBitterText::
	text "It looks bitter…"
	prompt

_ItemCantUseOnEggText::
	text "That can't be used"
	line "on an Egg."
	prompt

_ItemOakWarningText::
	text "This can't be"
	line "used here!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "That belongs to"
	line "someone else!"
	prompt

_ItemWontHaveEffectText::
	text "It won't have any"
	line "effect."
	prompt

_BallBlockedText::
	text "The trainer"
	line "blocked the Ball!"
	prompt

_BallDontBeAThiefText::
	text "Don't be a thief!"
	prompt

_NoCyclingText::
	text "Cycling isn't"
	line "allowed here."
	prompt

_ItemCantGetOnText::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

_BallBoxFullText::
	text "The #mon Box"
	line "is full. That"
	cont "can't be used now."
	prompt

_ItemUsedText::
	text "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

_ExpShareToggleOn::
	text "The Exp Share was"
	line "turned on."
	prompt

_ExpShareToggleOff::
	text "The Exp Share was"
	line "turned off."
	prompt

_RunningShoesOn::
	text "Running Shoes"
	line "are put on."
	prompt

_RunningShoesOff::
	text "Running Shoes"
	line "are taken off."
	prompt

_HandOfGodOn::
	text "Hand Of God"
	line "is at work."
	prompt

_HandOfGodOff::
	text "Hand Of God"
	line "is at rest."
	prompt

_MarkOfGodOn::
	text "Ascension to"
	line "God form."
	prompt

_RestoreTeamText::
    text "Restore team"
    line "from last save."
    done

_MarkOfGodOff::
	text "assume mortal"
	line "form once more."
	prompt

_InvadingAnotherWorld::
    text "Invading another"
    line "world."
    prompt

_ReturningToYourWorld::
    text "Returning to"
    line "your world."
    prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "That #mon knows"
	line "only one move."
	done

_AskDeleteMoveText::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "Whack!"

	para "One good pop from"
	line "my Mallet and the"
	cont "#mon forgot"
	cont "the move."
	done

_DeleterEggText::
	text "An Egg doesn't"
	line "know any moves!"
	done

_DeleterNoComeAgainText::
	text "No? Come visit me"
	line "again."
	done

_DeleterAskWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	prompt

_DeleterIntroText::
	text "Um… Oh, yes, I'm"
	line "the Move Deleter."

	para "I can make #mon"
	line "forget moves."

	para "Shall I make a"
	line "#mon forget?"
	done

_DeleterAskWhichMonText::
	text "Which #mon?"
	prompt

_DSTIsThatOKText::
	text " DST,"
	line "is that OK?"
	done

_TimeAskOkayText::
	text ","
	line "is that OK?"
	done

_TimesetAskDSTText::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

_TimesetDSTText::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

_TimesetAskNotDSTText::
	text "Is Daylight Saving"
	line "Time over?"
	done

_TimesetNotDSTText::
	text "I put the clock"
	line "back one hour."
	prompt

_TimesetAskAdjustDSTText::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

_MomLostGearBookletText::
	text "I lost the in-"
	line "struction booklet"
	cont "for the #gear."

	para "Come back again in"
	line "a while."
	prompt

AlreadyHaveTMText::
	text "You already have"
	line "that TM."
	done
