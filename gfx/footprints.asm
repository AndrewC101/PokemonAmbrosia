; Footprints are 2x2 tiles each, but are stored as a 16x64-tile image
; (32 rows of 8 footprints per row).
; That means there's a row of the top two tiles for eight footprints,
; then a row of the bottom two tiles for those eight footprints.

; These macros help extract the first and the last two tiles, respectively.
footprint_top    EQUS "0,                 2 * LEN_1BPP_TILE"
footprint_bottom EQUS "2 * LEN_1BPP_TILE, 2 * LEN_1BPP_TILE"

Footprints:
; Entries correspond to Pokémon species, two apiece, 8 tops then 8 bottoms
	table_width LEN_1BPP_TILE * 4, Footprints

; 001-008 top halves
INCBIN "gfx/footprints/bulbasaur.1bpp",  footprint_top
INCBIN "gfx/footprints/ivysaur.1bpp",    footprint_top
INCBIN "gfx/footprints/venusaur.1bpp",   footprint_top
INCBIN "gfx/footprints/charmander.1bpp", footprint_top
INCBIN "gfx/footprints/charmeleon.1bpp", footprint_top
INCBIN "gfx/footprints/charizard.1bpp",  footprint_top
INCBIN "gfx/footprints/squirtle.1bpp",   footprint_top
INCBIN "gfx/footprints/wartortle.1bpp",  footprint_top
; 001-008 bottom halves
INCBIN "gfx/footprints/bulbasaur.1bpp",  footprint_bottom
INCBIN "gfx/footprints/ivysaur.1bpp",    footprint_bottom
INCBIN "gfx/footprints/venusaur.1bpp",   footprint_bottom
INCBIN "gfx/footprints/charmander.1bpp", footprint_bottom
INCBIN "gfx/footprints/charmeleon.1bpp", footprint_bottom
INCBIN "gfx/footprints/charizard.1bpp",  footprint_bottom
INCBIN "gfx/footprints/squirtle.1bpp",   footprint_bottom
INCBIN "gfx/footprints/wartortle.1bpp",  footprint_bottom
; 009-016 top halves
INCBIN "gfx/footprints/blastoise.1bpp",  footprint_top
INCBIN "gfx/footprints/caterpie.1bpp",   footprint_top
INCBIN "gfx/footprints/metapod.1bpp",    footprint_top
INCBIN "gfx/footprints/butterfree.1bpp", footprint_top
INCBIN "gfx/footprints/honedge.1bpp",     footprint_top
INCBIN "gfx/footprints/doublade.1bpp",     footprint_top
INCBIN "gfx/footprints/aegislash.1bpp",   footprint_top
INCBIN "gfx/footprints/starly.1bpp",     footprint_top
; 009-016 bottom halves
INCBIN "gfx/footprints/blastoise.1bpp",  footprint_bottom
INCBIN "gfx/footprints/caterpie.1bpp",   footprint_bottom
INCBIN "gfx/footprints/metapod.1bpp",    footprint_bottom
INCBIN "gfx/footprints/butterfree.1bpp", footprint_bottom
INCBIN "gfx/footprints/honedge.1bpp",     footprint_bottom
INCBIN "gfx/footprints/doublade.1bpp",     footprint_bottom
INCBIN "gfx/footprints/aegislash.1bpp",   footprint_bottom
INCBIN "gfx/footprints/starly.1bpp",     footprint_bottom
; 017-024 top halves
INCBIN "gfx/footprints/staravia.1bpp",  footprint_top
INCBIN "gfx/footprints/staraptor.1bpp",    footprint_top
INCBIN "gfx/footprints/rattata.1bpp",    footprint_top
INCBIN "gfx/footprints/raticate.1bpp",   footprint_top
INCBIN "gfx/footprints/buneary.1bpp",    footprint_top
INCBIN "gfx/footprints/lopunny.1bpp",     footprint_top
INCBIN "gfx/footprints/ekans.1bpp",      footprint_top
INCBIN "gfx/footprints/arbok.1bpp",      footprint_top
; 017-024 bottom halves
INCBIN "gfx/footprints/staravia.1bpp",  footprint_bottom
INCBIN "gfx/footprints/staraptor.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rattata.1bpp",    footprint_bottom
INCBIN "gfx/footprints/raticate.1bpp",   footprint_bottom
INCBIN "gfx/footprints/buneary.1bpp",    footprint_bottom
INCBIN "gfx/footprints/lopunny.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ekans.1bpp",      footprint_bottom
INCBIN "gfx/footprints/arbok.1bpp",      footprint_bottom
; 025-032 top halves
INCBIN "gfx/footprints/pikachu.1bpp",    footprint_top
INCBIN "gfx/footprints/raichu.1bpp",     footprint_top
INCBIN "gfx/footprints/rotom.1bpp",  footprint_top
INCBIN "gfx/footprints/poltegeist.1bpp",  footprint_top
INCBIN "gfx/footprints/nidoran_f.1bpp",  footprint_top
INCBIN "gfx/footprints/nidorina.1bpp",   footprint_top
INCBIN "gfx/footprints/nidoqueen.1bpp",  footprint_top
INCBIN "gfx/footprints/nidoran_m.1bpp",  footprint_top
; 025-032 bottom halves
INCBIN "gfx/footprints/pikachu.1bpp",    footprint_bottom
INCBIN "gfx/footprints/raichu.1bpp",     footprint_bottom
INCBIN "gfx/footprints/rotom.1bpp",  footprint_bottom
INCBIN "gfx/footprints/poltegeist.1bpp",  footprint_bottom
INCBIN "gfx/footprints/nidoran_f.1bpp",  footprint_bottom
INCBIN "gfx/footprints/nidorina.1bpp",   footprint_bottom
INCBIN "gfx/footprints/nidoqueen.1bpp",  footprint_bottom
INCBIN "gfx/footprints/nidoran_m.1bpp",  footprint_bottom
; 033-040 top halves
INCBIN "gfx/footprints/nidorino.1bpp",   footprint_top
INCBIN "gfx/footprints/nidoking.1bpp",   footprint_top
INCBIN "gfx/footprints/clefairy.1bpp",   footprint_top
INCBIN "gfx/footprints/clefable.1bpp",   footprint_top
INCBIN "gfx/footprints/vulpix.1bpp",     footprint_top
INCBIN "gfx/footprints/ninetales.1bpp",  footprint_top
INCBIN "gfx/footprints/mawile.1bpp", footprint_top
INCBIN "gfx/footprints/kingambit.1bpp", footprint_top
; 033-040 bottom halves
INCBIN "gfx/footprints/nidorino.1bpp",   footprint_bottom
INCBIN "gfx/footprints/nidoking.1bpp",   footprint_bottom
INCBIN "gfx/footprints/clefairy.1bpp",   footprint_bottom
INCBIN "gfx/footprints/clefable.1bpp",   footprint_bottom
INCBIN "gfx/footprints/vulpix.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ninetales.1bpp",  footprint_bottom
INCBIN "gfx/footprints/mawile.1bpp", footprint_bottom
INCBIN "gfx/footprints/kingambit.1bpp", footprint_bottom
; 041-048 top halves
INCBIN "gfx/footprints/zubat.1bpp",      footprint_top
INCBIN "gfx/footprints/golbat.1bpp",     footprint_top
INCBIN "gfx/footprints/pawniard.1bpp",     footprint_top
INCBIN "gfx/footprints/bisharp.1bpp",      footprint_top
INCBIN "gfx/footprints/regigigas.1bpp",  footprint_top
INCBIN "gfx/footprints/zygarde.1bpp",      footprint_top
INCBIN "gfx/footprints/hawlucha.1bpp",   footprint_top
INCBIN "gfx/footprints/larvesta.1bpp",    footprint_top
; 041-048 bottom halves
INCBIN "gfx/footprints/zubat.1bpp",      footprint_bottom
INCBIN "gfx/footprints/golbat.1bpp",     footprint_bottom
INCBIN "gfx/footprints/pawniard.1bpp",     footprint_bottom
INCBIN "gfx/footprints/bisharp.1bpp",      footprint_bottom
INCBIN "gfx/footprints/regigigas.1bpp",  footprint_bottom
INCBIN "gfx/footprints/zygarde.1bpp",      footprint_bottom
INCBIN "gfx/footprints/hawlucha.1bpp",   footprint_bottom
INCBIN "gfx/footprints/larvesta.1bpp",    footprint_bottom
; 049-056 top halves
INCBIN "gfx/footprints/volcarona.1bpp",   footprint_top
INCBIN "gfx/footprints/arctozolt.1bpp",    footprint_top
INCBIN "gfx/footprints/dracovish.1bpp",    footprint_top
INCBIN "gfx/footprints/meowth.1bpp",     footprint_top
INCBIN "gfx/footprints/persian.1bpp",    footprint_top
INCBIN "gfx/footprints/snover.1bpp",    footprint_top
INCBIN "gfx/footprints/abomasnow.1bpp",    footprint_top
INCBIN "gfx/footprints/shroomish.1bpp",     footprint_top
; 049-056 bottom halves
INCBIN "gfx/footprints/volcarona.1bpp",   footprint_bottom
INCBIN "gfx/footprints/arctozolt.1bpp",    footprint_bottom
INCBIN "gfx/footprints/dracovish.1bpp",    footprint_bottom
INCBIN "gfx/footprints/meowth.1bpp",     footprint_bottom
INCBIN "gfx/footprints/persian.1bpp",    footprint_bottom
INCBIN "gfx/footprints/snover.1bpp",    footprint_bottom
INCBIN "gfx/footprints/abomasnow.1bpp",    footprint_bottom
INCBIN "gfx/footprints/shroomish.1bpp",     footprint_bottom
; 057-064 top halves
INCBIN "gfx/footprints/breloom.1bpp",   footprint_top
INCBIN "gfx/footprints/growlithe.1bpp",  footprint_top
INCBIN "gfx/footprints/arcanine.1bpp",   footprint_top
INCBIN "gfx/footprints/poliwag.1bpp",    footprint_top
INCBIN "gfx/footprints/poliwhirl.1bpp",  footprint_top
INCBIN "gfx/footprints/poliwrath.1bpp",  footprint_top
INCBIN "gfx/footprints/abra.1bpp",       footprint_top
INCBIN "gfx/footprints/kadabra.1bpp",    footprint_top
; 057-064 bottom halves
INCBIN "gfx/footprints/breloom.1bpp",   footprint_bottom
INCBIN "gfx/footprints/growlithe.1bpp",  footprint_bottom
INCBIN "gfx/footprints/arcanine.1bpp",   footprint_bottom
INCBIN "gfx/footprints/poliwag.1bpp",    footprint_bottom
INCBIN "gfx/footprints/poliwhirl.1bpp",  footprint_bottom
INCBIN "gfx/footprints/poliwrath.1bpp",  footprint_bottom
INCBIN "gfx/footprints/abra.1bpp",       footprint_bottom
INCBIN "gfx/footprints/kadabra.1bpp",    footprint_bottom
; 065-072 top halves
INCBIN "gfx/footprints/alakazam.1bpp",   footprint_top
INCBIN "gfx/footprints/machop.1bpp",     footprint_top
INCBIN "gfx/footprints/machoke.1bpp",    footprint_top
INCBIN "gfx/footprints/machamp.1bpp",    footprint_top
INCBIN "gfx/footprints/bellsprout.1bpp", footprint_top
INCBIN "gfx/footprints/weepinbell.1bpp", footprint_top
INCBIN "gfx/footprints/victreebel.1bpp", footprint_top
INCBIN "gfx/footprints/tentacool.1bpp",  footprint_top
; 065-072 bottom halves
INCBIN "gfx/footprints/alakazam.1bpp",   footprint_bottom
INCBIN "gfx/footprints/machop.1bpp",     footprint_bottom
INCBIN "gfx/footprints/machoke.1bpp",    footprint_bottom
INCBIN "gfx/footprints/machamp.1bpp",    footprint_bottom
INCBIN "gfx/footprints/bellsprout.1bpp", footprint_bottom
INCBIN "gfx/footprints/weepinbell.1bpp", footprint_bottom
INCBIN "gfx/footprints/victreebel.1bpp", footprint_bottom
INCBIN "gfx/footprints/tentacool.1bpp",  footprint_bottom
; 073-080 top halves
INCBIN "gfx/footprints/tentacruel.1bpp", footprint_top
INCBIN "gfx/footprints/geodude.1bpp",    footprint_top
INCBIN "gfx/footprints/graveler.1bpp",   footprint_top
INCBIN "gfx/footprints/golem.1bpp",      footprint_top
INCBIN "gfx/footprints/ponyta.1bpp",     footprint_top
INCBIN "gfx/footprints/rapidash.1bpp",   footprint_top
INCBIN "gfx/footprints/slowpoke.1bpp",   footprint_top
INCBIN "gfx/footprints/slowbro.1bpp",    footprint_top
; 073-080 bottom halves
INCBIN "gfx/footprints/tentacruel.1bpp", footprint_bottom
INCBIN "gfx/footprints/geodude.1bpp",    footprint_bottom
INCBIN "gfx/footprints/graveler.1bpp",   footprint_bottom
INCBIN "gfx/footprints/golem.1bpp",      footprint_bottom
INCBIN "gfx/footprints/ponyta.1bpp",     footprint_bottom
INCBIN "gfx/footprints/rapidash.1bpp",   footprint_bottom
INCBIN "gfx/footprints/slowpoke.1bpp",   footprint_bottom
INCBIN "gfx/footprints/slowbro.1bpp",    footprint_bottom
; 081-088 top halves
INCBIN "gfx/footprints/magnemite.1bpp",  footprint_top
INCBIN "gfx/footprints/magneton.1bpp",   footprint_top
INCBIN "gfx/footprints/mamoswine.1bpp", footprint_top
INCBIN "gfx/footprints/electivire.1bpp",      footprint_top
INCBIN "gfx/footprints/magnezone.1bpp",     footprint_top
INCBIN "gfx/footprints/yanmega.1bpp",       footprint_top
INCBIN "gfx/footprints/gliscor.1bpp",    footprint_top
INCBIN "gfx/footprints/ferroseed.1bpp",     footprint_top
; 081-088 bottom halves
INCBIN "gfx/footprints/magnemite.1bpp",  footprint_bottom
INCBIN "gfx/footprints/magneton.1bpp",   footprint_bottom
INCBIN "gfx/footprints/mamoswine.1bpp", footprint_bottom
INCBIN "gfx/footprints/electivire.1bpp",      footprint_bottom
INCBIN "gfx/footprints/magnezone.1bpp",     footprint_bottom
INCBIN "gfx/footprints/yanmega.1bpp",       footprint_bottom
INCBIN "gfx/footprints/gliscor.1bpp",    footprint_bottom
INCBIN "gfx/footprints/ferroseed.1bpp",     footprint_bottom
; 089-096 top halves
INCBIN "gfx/footprints/ferrothorn.1bpp",        footprint_top
INCBIN "gfx/footprints/shellder.1bpp",   footprint_top
INCBIN "gfx/footprints/cloyster.1bpp",   footprint_top
INCBIN "gfx/footprints/gastly.1bpp",     footprint_top
INCBIN "gfx/footprints/haunter.1bpp",    footprint_top
INCBIN "gfx/footprints/gengar.1bpp",     footprint_top
INCBIN "gfx/footprints/onix.1bpp",       footprint_top
INCBIN "gfx/footprints/ursaluna.1bpp",    footprint_top
; 089-096 bottom halves
INCBIN "gfx/footprints/ferrothorn.1bpp",        footprint_bottom
INCBIN "gfx/footprints/shellder.1bpp",   footprint_bottom
INCBIN "gfx/footprints/cloyster.1bpp",   footprint_bottom
INCBIN "gfx/footprints/gastly.1bpp",     footprint_bottom
INCBIN "gfx/footprints/haunter.1bpp",    footprint_bottom
INCBIN "gfx/footprints/gengar.1bpp",     footprint_bottom
INCBIN "gfx/footprints/onix.1bpp",       footprint_bottom
INCBIN "gfx/footprints/ursaluna.1bpp",    footprint_bottom
; 097-104 top halves
INCBIN "gfx/footprints/ursalunaB.1bpp",      footprint_top
INCBIN "gfx/footprints/feebas.1bpp",     footprint_top
INCBIN "gfx/footprints/milotic.1bpp",    footprint_top
INCBIN "gfx/footprints/mudkip.1bpp",    footprint_top
INCBIN "gfx/footprints/mimikyu.1bpp",  footprint_top
INCBIN "gfx/footprints/exeggcute.1bpp",  footprint_top
INCBIN "gfx/footprints/exeggutor.1bpp",  footprint_top
INCBIN "gfx/footprints/marill.1bpp",     footprint_top
; 097-104 bottom halves
INCBIN "gfx/footprints/ursalunaB.1bpp",      footprint_bottom
INCBIN "gfx/footprints/feebas.1bpp",     footprint_bottom
INCBIN "gfx/footprints/milotic.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mudkip.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mimikyu.1bpp",  footprint_bottom
INCBIN "gfx/footprints/exeggcute.1bpp",  footprint_bottom
INCBIN "gfx/footprints/exeggutor.1bpp",  footprint_bottom
INCBIN "gfx/footprints/marill.1bpp",     footprint_bottom
; 105-112 top halves
INCBIN "gfx/footprints/azumarill.1bpp",    footprint_top
INCBIN "gfx/footprints/solosis.1bpp",  footprint_top
INCBIN "gfx/footprints/duosion.1bpp", footprint_top
INCBIN "gfx/footprints/reuniclus.1bpp",  footprint_top
INCBIN "gfx/footprints/koffing.1bpp",    footprint_top
INCBIN "gfx/footprints/weezing.1bpp",    footprint_top
INCBIN "gfx/footprints/rhyhorn.1bpp",    footprint_top
INCBIN "gfx/footprints/rhydon.1bpp",     footprint_top
; 105-112 bottom halves
INCBIN "gfx/footprints/azumarill.1bpp",    footprint_bottom
INCBIN "gfx/footprints/solosis.1bpp",  footprint_bottom
INCBIN "gfx/footprints/duosion.1bpp", footprint_bottom
INCBIN "gfx/footprints/reuniclus.1bpp",  footprint_bottom
INCBIN "gfx/footprints/koffing.1bpp",    footprint_bottom
INCBIN "gfx/footprints/weezing.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rhyhorn.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rhydon.1bpp",     footprint_bottom
; 113-120 top halves
INCBIN "gfx/footprints/chansey.1bpp",    footprint_top
INCBIN "gfx/footprints/weavile.1bpp",    footprint_top
INCBIN "gfx/footprints/rhyperior.1bpp", footprint_top
INCBIN "gfx/footprints/horsea.1bpp",     footprint_top
INCBIN "gfx/footprints/seadra.1bpp",     footprint_top
INCBIN "gfx/footprints/magmortar.1bpp",    footprint_top
INCBIN "gfx/footprints/honchkrow.1bpp",    footprint_top
INCBIN "gfx/footprints/staryu.1bpp",     footprint_top
; 113-120 bottom halves
INCBIN "gfx/footprints/chansey.1bpp",    footprint_bottom
INCBIN "gfx/footprints/weavile.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rhyperior.1bpp", footprint_bottom
INCBIN "gfx/footprints/horsea.1bpp",     footprint_bottom
INCBIN "gfx/footprints/seadra.1bpp",     footprint_bottom
INCBIN "gfx/footprints/magmortar.1bpp",    footprint_bottom
INCBIN "gfx/footprints/honchkrow.1bpp",    footprint_bottom
INCBIN "gfx/footprints/staryu.1bpp",     footprint_bottom
; 121-128 top halves
INCBIN "gfx/footprints/starmie.1bpp",    footprint_top
INCBIN "gfx/footprints/mr__mime.1bpp",   footprint_top
INCBIN "gfx/footprints/scyther.1bpp",    footprint_top
INCBIN "gfx/footprints/jynx.1bpp",       footprint_top
INCBIN "gfx/footprints/electabuzz.1bpp", footprint_top
INCBIN "gfx/footprints/magmar.1bpp",     footprint_top
INCBIN "gfx/footprints/pinsir.1bpp",     footprint_top
INCBIN "gfx/footprints/tauros.1bpp",     footprint_top
; 121-128 bottom halves
INCBIN "gfx/footprints/starmie.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mr__mime.1bpp",   footprint_bottom
INCBIN "gfx/footprints/scyther.1bpp",    footprint_bottom
INCBIN "gfx/footprints/jynx.1bpp",       footprint_bottom
INCBIN "gfx/footprints/electabuzz.1bpp", footprint_bottom
INCBIN "gfx/footprints/magmar.1bpp",     footprint_bottom
INCBIN "gfx/footprints/pinsir.1bpp",     footprint_bottom
INCBIN "gfx/footprints/tauros.1bpp",     footprint_bottom
; 129-136 top halves
INCBIN "gfx/footprints/magikarp.1bpp",   footprint_top
INCBIN "gfx/footprints/gyarados.1bpp",   footprint_top
INCBIN "gfx/footprints/lapras.1bpp",     footprint_top
INCBIN "gfx/footprints/ditto.1bpp",      footprint_top
INCBIN "gfx/footprints/eevee.1bpp",      footprint_top
INCBIN "gfx/footprints/vaporeon.1bpp",   footprint_top
INCBIN "gfx/footprints/jolteon.1bpp",    footprint_top
INCBIN "gfx/footprints/flareon.1bpp",    footprint_top
; 129-136 bottom halves
INCBIN "gfx/footprints/magikarp.1bpp",   footprint_bottom
INCBIN "gfx/footprints/gyarados.1bpp",   footprint_bottom
INCBIN "gfx/footprints/lapras.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ditto.1bpp",      footprint_bottom
INCBIN "gfx/footprints/eevee.1bpp",      footprint_bottom
INCBIN "gfx/footprints/vaporeon.1bpp",   footprint_bottom
INCBIN "gfx/footprints/jolteon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/flareon.1bpp",    footprint_bottom
; 137-144 top halves
INCBIN "gfx/footprints/porygon.1bpp",    footprint_top
INCBIN "gfx/footprints/ralts.1bpp",    footprint_top
INCBIN "gfx/footprints/kirlia.1bpp",    footprint_top
INCBIN "gfx/footprints/gardevoir.1bpp",     footprint_top
INCBIN "gfx/footprints/galade.1bpp",   footprint_top
INCBIN "gfx/footprints/aerodactyl.1bpp", footprint_top
INCBIN "gfx/footprints/snorlax.1bpp",    footprint_top
INCBIN "gfx/footprints/articuno.1bpp",   footprint_top
; 137-144 bottom halves
INCBIN "gfx/footprints/porygon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/ralts.1bpp",    footprint_bottom
INCBIN "gfx/footprints/kirlia.1bpp",    footprint_bottom
INCBIN "gfx/footprints/gardevoir.1bpp",     footprint_bottom
INCBIN "gfx/footprints/galade.1bpp",   footprint_bottom
INCBIN "gfx/footprints/aerodactyl.1bpp", footprint_bottom
INCBIN "gfx/footprints/snorlax.1bpp",    footprint_bottom
INCBIN "gfx/footprints/articuno.1bpp",   footprint_bottom
; 145-152 top halves
INCBIN "gfx/footprints/zapdos.1bpp",     footprint_top
INCBIN "gfx/footprints/moltres.1bpp",    footprint_top
INCBIN "gfx/footprints/dratini.1bpp",    footprint_top
INCBIN "gfx/footprints/dragonair.1bpp",  footprint_top
INCBIN "gfx/footprints/dragonite.1bpp",  footprint_top
INCBIN "gfx/footprints/darkrai.1bpp",     footprint_top
INCBIN "gfx/footprints/mew.1bpp",        footprint_top
INCBIN "gfx/footprints/treecko.1bpp",  footprint_top
; 145-152 bottom halves
INCBIN "gfx/footprints/zapdos.1bpp",     footprint_bottom
INCBIN "gfx/footprints/moltres.1bpp",    footprint_bottom
INCBIN "gfx/footprints/dratini.1bpp",    footprint_bottom
INCBIN "gfx/footprints/dragonair.1bpp",  footprint_bottom
INCBIN "gfx/footprints/dragonite.1bpp",  footprint_bottom
INCBIN "gfx/footprints/darkrai.1bpp",     footprint_bottom
INCBIN "gfx/footprints/mew.1bpp",        footprint_bottom
INCBIN "gfx/footprints/treecko.1bpp",  footprint_bottom
; 153-160 top halves
INCBIN "gfx/footprints/grovyle.1bpp",    footprint_top
INCBIN "gfx/footprints/sceptile.1bpp",   footprint_top
INCBIN "gfx/footprints/chimchar.1bpp",  footprint_top
INCBIN "gfx/footprints/monferno.1bpp",    footprint_top
INCBIN "gfx/footprints/infernape.1bpp", footprint_top
INCBIN "gfx/footprints/froakie.1bpp",   footprint_top
INCBIN "gfx/footprints/frogadier.1bpp",   footprint_top
INCBIN "gfx/footprints/greninja.1bpp", footprint_top
; 153-160 bottom halves
INCBIN "gfx/footprints/grovyle.1bpp",    footprint_bottom
INCBIN "gfx/footprints/sceptile.1bpp",   footprint_bottom
INCBIN "gfx/footprints/chimchar.1bpp",  footprint_bottom
INCBIN "gfx/footprints/monferno.1bpp",    footprint_bottom
INCBIN "gfx/footprints/infernape.1bpp", footprint_bottom
INCBIN "gfx/footprints/froakie.1bpp",   footprint_bottom
INCBIN "gfx/footprints/frogadier.1bpp",   footprint_bottom
INCBIN "gfx/footprints/greninja.1bpp", footprint_bottom
; 161-168 top halves
INCBIN "gfx/footprints/riolu.1bpp",    footprint_top
INCBIN "gfx/footprints/lucario.1bpp",     footprint_top
INCBIN "gfx/footprints/hoothoot.1bpp",   footprint_top
INCBIN "gfx/footprints/noctowl.1bpp",    footprint_top
INCBIN "gfx/footprints/drilbur.1bpp",     footprint_top
INCBIN "gfx/footprints/excadrill.1bpp",     footprint_top
INCBIN "gfx/footprints/joltik.1bpp",   footprint_top
INCBIN "gfx/footprints/galvantula.1bpp",    footprint_top
; 161-168 bottom halves
INCBIN "gfx/footprints/riolu.1bpp",    footprint_bottom
INCBIN "gfx/footprints/lucario.1bpp",     footprint_bottom
INCBIN "gfx/footprints/hoothoot.1bpp",   footprint_bottom
INCBIN "gfx/footprints/noctowl.1bpp",    footprint_bottom
INCBIN "gfx/footprints/drilbur.1bpp",     footprint_bottom
INCBIN "gfx/footprints/excadrill.1bpp",     footprint_bottom
INCBIN "gfx/footprints/joltik.1bpp",   footprint_bottom
INCBIN "gfx/footprints/galvantula.1bpp",    footprint_bottom
; 169-176 top halves
INCBIN "gfx/footprints/crobat.1bpp",     footprint_top
INCBIN "gfx/footprints/chinchou.1bpp",   footprint_top
INCBIN "gfx/footprints/lanturn.1bpp",    footprint_top
INCBIN "gfx/footprints/litwick.1bpp",      footprint_top
INCBIN "gfx/footprints/lampent.1bpp",     footprint_top
INCBIN "gfx/footprints/chandelure.1bpp",  footprint_top
INCBIN "gfx/footprints/togepi.1bpp",     footprint_top
INCBIN "gfx/footprints/togetic.1bpp",    footprint_top
; 169-176 bottom halves
INCBIN "gfx/footprints/crobat.1bpp",     footprint_bottom
INCBIN "gfx/footprints/chinchou.1bpp",   footprint_bottom
INCBIN "gfx/footprints/lanturn.1bpp",    footprint_bottom
INCBIN "gfx/footprints/litwick.1bpp",      footprint_bottom
INCBIN "gfx/footprints/lampent.1bpp",     footprint_bottom
INCBIN "gfx/footprints/chandelure.1bpp",  footprint_bottom
INCBIN "gfx/footprints/togepi.1bpp",     footprint_bottom
INCBIN "gfx/footprints/togetic.1bpp",    footprint_bottom
; 177-184 top halves
INCBIN "gfx/footprints/togekiss.1bpp",       footprint_top
INCBIN "gfx/footprints/sigilyph.1bpp",       footprint_top
INCBIN "gfx/footprints/mareep.1bpp",     footprint_top
INCBIN "gfx/footprints/flaaffy.1bpp",    footprint_top
INCBIN "gfx/footprints/ampharos.1bpp",   footprint_top
INCBIN "gfx/footprints/sylveon.1bpp",  footprint_top
INCBIN "gfx/footprints/mismagius.1bpp",     footprint_top
INCBIN "gfx/footprints/porygonz.1bpp",  footprint_top
; 177-184 bottom halves
INCBIN "gfx/footprints/togekiss.1bpp",       footprint_bottom
INCBIN "gfx/footprints/sigilyph.1bpp",       footprint_bottom
INCBIN "gfx/footprints/mareep.1bpp",     footprint_bottom
INCBIN "gfx/footprints/flaaffy.1bpp",    footprint_bottom
INCBIN "gfx/footprints/ampharos.1bpp",   footprint_bottom
INCBIN "gfx/footprints/sylveon.1bpp",  footprint_bottom
INCBIN "gfx/footprints/mismagius.1bpp",     footprint_bottom
INCBIN "gfx/footprints/porygonz.1bpp",  footprint_bottom
; 185-192 top halves
INCBIN "gfx/footprints/genesect.1bpp",  footprint_top
INCBIN "gfx/footprints/politoed.1bpp",   footprint_top
INCBIN "gfx/footprints/timburr.1bpp",     footprint_top
INCBIN "gfx/footprints/gurdurr.1bpp",   footprint_top
INCBIN "gfx/footprints/conkeldurr.1bpp",   footprint_top
INCBIN "gfx/footprints/beldum.1bpp",      footprint_top
INCBIN "gfx/footprints/metang.1bpp",    footprint_top
INCBIN "gfx/footprints/metagross.1bpp",   footprint_top
; 185-192 bottom halves
INCBIN "gfx/footprints/genesect.1bpp",  footprint_bottom
INCBIN "gfx/footprints/politoed.1bpp",   footprint_bottom
INCBIN "gfx/footprints/timburr.1bpp",     footprint_bottom
INCBIN "gfx/footprints/gurdurr.1bpp",   footprint_bottom
INCBIN "gfx/footprints/conkeldurr.1bpp",   footprint_bottom
INCBIN "gfx/footprints/beldum.1bpp",      footprint_bottom
INCBIN "gfx/footprints/metang.1bpp",    footprint_bottom
INCBIN "gfx/footprints/metagross.1bpp",   footprint_bottom
; 193-200 top halves
INCBIN "gfx/footprints/yanma.1bpp",      footprint_top
INCBIN "gfx/footprints/marshtomp.1bpp",     footprint_top
INCBIN "gfx/footprints/swampert.1bpp",   footprint_top
INCBIN "gfx/footprints/espeon.1bpp",     footprint_top
INCBIN "gfx/footprints/umbreon.1bpp",    footprint_top
INCBIN "gfx/footprints/murkrow.1bpp",    footprint_top
INCBIN "gfx/footprints/slowking.1bpp",   footprint_top
INCBIN "gfx/footprints/misdreavus.1bpp", footprint_top
; 193-200 bottom halves
INCBIN "gfx/footprints/yanma.1bpp",      footprint_bottom
INCBIN "gfx/footprints/marshtomp.1bpp",     footprint_bottom
INCBIN "gfx/footprints/swampert.1bpp",   footprint_bottom
INCBIN "gfx/footprints/espeon.1bpp",     footprint_bottom
INCBIN "gfx/footprints/umbreon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/murkrow.1bpp",    footprint_bottom
INCBIN "gfx/footprints/slowking.1bpp",   footprint_bottom
INCBIN "gfx/footprints/misdreavus.1bpp", footprint_bottom
; 201-208 top halves
INCBIN "gfx/footprints/unown.1bpp",      footprint_top
INCBIN "gfx/footprints/wobbuffet.1bpp",  footprint_top
INCBIN "gfx/footprints/bagon.1bpp",  footprint_top
INCBIN "gfx/footprints/shelgon.1bpp",     footprint_top
INCBIN "gfx/footprints/salamence.1bpp", footprint_top
INCBIN "gfx/footprints/dunsparce.1bpp",  footprint_top
INCBIN "gfx/footprints/gligar.1bpp",     footprint_top
INCBIN "gfx/footprints/steelix.1bpp",    footprint_top
; 201-208 bottom halves
INCBIN "gfx/footprints/unown.1bpp",      footprint_bottom
INCBIN "gfx/footprints/wobbuffet.1bpp",  footprint_bottom
INCBIN "gfx/footprints/bagon.1bpp",  footprint_bottom
INCBIN "gfx/footprints/shelgon.1bpp",     footprint_bottom
INCBIN "gfx/footprints/salamence.1bpp", footprint_bottom
INCBIN "gfx/footprints/dunsparce.1bpp",  footprint_bottom
INCBIN "gfx/footprints/gligar.1bpp",     footprint_bottom
INCBIN "gfx/footprints/steelix.1bpp",    footprint_bottom
; 209-216 top halves
INCBIN "gfx/footprints/gible.1bpp",   footprint_top
INCBIN "gfx/footprints/gabite.1bpp",   footprint_top
INCBIN "gfx/footprints/garchomp.1bpp",   footprint_top
INCBIN "gfx/footprints/scizor.1bpp",     footprint_top
INCBIN "gfx/footprints/shaymin.1bpp",    footprint_top
INCBIN "gfx/footprints/heracross.1bpp",  footprint_top
INCBIN "gfx/footprints/sneasel.1bpp",    footprint_top
INCBIN "gfx/footprints/teddiursa.1bpp",  footprint_top
; 209-216 bottom halves
INCBIN "gfx/footprints/gible.1bpp",   footprint_bottom
INCBIN "gfx/footprints/gabite.1bpp",   footprint_bottom
INCBIN "gfx/footprints/garchomp.1bpp",   footprint_bottom
INCBIN "gfx/footprints/scizor.1bpp",     footprint_bottom
INCBIN "gfx/footprints/shaymin.1bpp",    footprint_bottom
INCBIN "gfx/footprints/heracross.1bpp",  footprint_bottom
INCBIN "gfx/footprints/sneasel.1bpp",    footprint_bottom
INCBIN "gfx/footprints/teddiursa.1bpp",  footprint_bottom
; 217-224 top halves
INCBIN "gfx/footprints/ursaring.1bpp",   footprint_top
INCBIN "gfx/footprints/latias.1bpp",     footprint_top
INCBIN "gfx/footprints/deoxys.1bpp",   footprint_top
INCBIN "gfx/footprints/swinub.1bpp",     footprint_top
INCBIN "gfx/footprints/piloswine.1bpp",  footprint_top
INCBIN "gfx/footprints/spiritomb.1bpp",    footprint_top
INCBIN "gfx/footprints/latios.1bpp",   footprint_top
INCBIN "gfx/footprints/palkia.1bpp",  footprint_top
; 217-224 bottom halves
INCBIN "gfx/footprints/ursaring.1bpp",   footprint_bottom
INCBIN "gfx/footprints/latias.1bpp",     footprint_bottom
INCBIN "gfx/footprints/deoxys.1bpp",   footprint_bottom
INCBIN "gfx/footprints/swinub.1bpp",     footprint_bottom
INCBIN "gfx/footprints/piloswine.1bpp",  footprint_bottom
INCBIN "gfx/footprints/spiritomb.1bpp",    footprint_bottom
INCBIN "gfx/footprints/latios.1bpp",   footprint_bottom
INCBIN "gfx/footprints/palkia.1bpp",  footprint_bottom
; 225-232 top halves
INCBIN "gfx/footprints/kyogre.1bpp",   footprint_top
INCBIN "gfx/footprints/groudon.1bpp",    footprint_top
INCBIN "gfx/footprints/skarmory.1bpp",   footprint_top
INCBIN "gfx/footprints/houndour.1bpp",   footprint_top
INCBIN "gfx/footprints/houndoom.1bpp",   footprint_top
INCBIN "gfx/footprints/kingdra.1bpp",    footprint_top
INCBIN "gfx/footprints/cottonee.1bpp",     footprint_top
INCBIN "gfx/footprints/whimsicott.1bpp",    footprint_top
; 225-232 bottom halves
INCBIN "gfx/footprints/kyogre.1bpp",   footprint_bottom
INCBIN "gfx/footprints/groudon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/skarmory.1bpp",   footprint_bottom
INCBIN "gfx/footprints/houndour.1bpp",   footprint_bottom
INCBIN "gfx/footprints/houndoom.1bpp",   footprint_bottom
INCBIN "gfx/footprints/kingdra.1bpp",    footprint_bottom
INCBIN "gfx/footprints/cottonee.1bpp",     footprint_bottom
INCBIN "gfx/footprints/whimsicott.1bpp",    footprint_bottom
; 233-240 top halves
INCBIN "gfx/footprints/porygon2.1bpp",   footprint_top
INCBIN "gfx/footprints/rayquaza.1bpp",   footprint_top
INCBIN "gfx/footprints/smeargle.1bpp",   footprint_top
INCBIN "gfx/footprints/dialga.1bpp",    footprint_top
INCBIN "gfx/footprints/klefki.1bpp",  footprint_top
INCBIN "gfx/footprints/xerneas.1bpp",   footprint_top
INCBIN "gfx/footprints/yveltal.1bpp",     footprint_top
INCBIN "gfx/footprints/giratina.1bpp",      footprint_top
; 233-240 bottom halves
INCBIN "gfx/footprints/porygon2.1bpp",   footprint_bottom
INCBIN "gfx/footprints/rayquaza.1bpp",   footprint_bottom
INCBIN "gfx/footprints/smeargle.1bpp",   footprint_bottom
INCBIN "gfx/footprints/dialga.1bpp",    footprint_bottom
INCBIN "gfx/footprints/klefki.1bpp",  footprint_bottom
INCBIN "gfx/footprints/xerneas.1bpp",   footprint_bottom
INCBIN "gfx/footprints/yveltal.1bpp",     footprint_bottom
INCBIN "gfx/footprints/giratina.1bpp",      footprint_bottom
; 241-248 top halves
INCBIN "gfx/footprints/miltank.1bpp",    footprint_top
INCBIN "gfx/footprints/blissey.1bpp",    footprint_top
INCBIN "gfx/footprints/raikou.1bpp",     footprint_top
INCBIN "gfx/footprints/entei.1bpp",      footprint_top
INCBIN "gfx/footprints/suicune.1bpp",    footprint_top
INCBIN "gfx/footprints/larvitar.1bpp",   footprint_top
INCBIN "gfx/footprints/pupitar.1bpp",    footprint_top
INCBIN "gfx/footprints/tyranitar.1bpp",  footprint_top
; 241-248 bottom halves
INCBIN "gfx/footprints/miltank.1bpp",    footprint_bottom
INCBIN "gfx/footprints/blissey.1bpp",    footprint_bottom
INCBIN "gfx/footprints/raikou.1bpp",     footprint_bottom
INCBIN "gfx/footprints/entei.1bpp",      footprint_bottom
INCBIN "gfx/footprints/suicune.1bpp",    footprint_bottom
INCBIN "gfx/footprints/larvitar.1bpp",   footprint_bottom
INCBIN "gfx/footprints/pupitar.1bpp",    footprint_bottom
INCBIN "gfx/footprints/tyranitar.1bpp",  footprint_bottom
; 249-256 top halves
INCBIN "gfx/footprints/lugia.1bpp",      footprint_top
INCBIN "gfx/footprints/ho_oh.1bpp",      footprint_top
INCBIN "gfx/footprints/celebi.1bpp",     footprint_top
INCBIN "gfx/footprints/mewtwo.1bpp",  footprint_top
INCBIN "gfx/footprints/arceus.1bpp",     footprint_top
INCBIN "gfx/footprints/254.1bpp",        footprint_top
INCBIN "gfx/footprints/255.1bpp",        footprint_top
INCBIN "gfx/footprints/256.1bpp",        footprint_top
; 249-256 bottom halves
INCBIN "gfx/footprints/lugia.1bpp",      footprint_bottom
INCBIN "gfx/footprints/ho_oh.1bpp",      footprint_bottom
INCBIN "gfx/footprints/celebi.1bpp",     footprint_bottom
INCBIN "gfx/footprints/mewtwo.1bpp",  footprint_bottom
INCBIN "gfx/footprints/arceus.1bpp",     footprint_bottom
INCBIN "gfx/footprints/254.1bpp",        footprint_bottom
INCBIN "gfx/footprints/255.1bpp",        footprint_bottom
INCBIN "gfx/footprints/256.1bpp",        footprint_bottom

	assert_table_length $100
