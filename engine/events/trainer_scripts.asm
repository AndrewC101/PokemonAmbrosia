TalkToTrainerScript::
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue RematchScript
	loadtemptrainer
	encountermusic
	sjump StartBattleWithMapTrainerScript

SeenByTrainerScript::
	loadtemptrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	sjump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript:
	opentext
	trainertext TRAINERTEXT_SEEN
	waitbutton
	closetext
	loadtemptrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadmem wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
	scripttalkafter

; DevNote - rematch all trainers
RematchScript:
    scall AlreadyBeatenTrainerScript
    readmem wNoRematch
    iftrue .noRematch
	opentext
	writetext RematchText
	nooryes
	iffalse .refused
    loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
    loadtemptrainer
	encountermusic
	sjump StartBattleWithMapTrainerScript
.refused
	writetext RematchRefuseText
	waitbutton
	closetext
	end
.noRematch
    loadmem wNoRematch, 0
    end

RematchText:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseText:
    text "Maybe next time."
    done