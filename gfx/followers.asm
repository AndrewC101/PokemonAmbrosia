; Follower graphics use the current PNGs in gfx/followers/.
; Original imports swap their side pair below; new sheets use direct INCBIN.
SECTION "Follower initial art", ROMX, BANK[$7a]

; Monster's original frame order is down/up/side rest, then down/up/side step.
GenericFollowerGFX::
    INCBIN "gfx/sprites/monster.2bpp",  0 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp", 12 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp",  4 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp", 16 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp",  8 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp", 20 tiles, 4 tiles
assert @ - GenericFollowerGFX == FOLLOWER_GFX_SIZE

BulbasaurFollowerGFX::
    INCBIN "gfx/followers/bulbasaur.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/bulbasaur.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/bulbasaur.2bpp", 16 tiles, 4 tiles
assert @ - BulbasaurFollowerGFX == FOLLOWER_GFX_SIZE

CharizardFollowerGFX::
    INCBIN "gfx/followers/charizard.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/charizard.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/charizard.2bpp", 16 tiles, 4 tiles
assert @ - CharizardFollowerGFX == FOLLOWER_GFX_SIZE

PikachuFollowerGFX::
    INCBIN "gfx/followers/pikachu.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/pikachu.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/pikachu.2bpp", 16 tiles, 4 tiles
assert @ - PikachuFollowerGFX == FOLLOWER_GFX_SIZE

GengarFollowerGFX::
    INCBIN "gfx/followers/gengar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gengar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gengar.2bpp", 16 tiles, 4 tiles
assert @ - GengarFollowerGFX == FOLLOWER_GFX_SIZE

LaprasFollowerGFX::
    INCBIN "gfx/followers/lapras.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/lapras.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/lapras.2bpp", 16 tiles, 4 tiles
assert @ - LaprasFollowerGFX == FOLLOWER_GFX_SIZE

TyranitarFollowerGFX::
    INCBIN "gfx/followers/tyranitar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/tyranitar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/tyranitar.2bpp", 16 tiles, 4 tiles
assert @ - TyranitarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art IVYSAUR", ROMX
IvysaurFollowerGFX::
    INCBIN "gfx/followers/ivysaur.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ivysaur.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ivysaur.2bpp", 16 tiles, 4 tiles
assert @ - IvysaurFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VENUSAUR", ROMX
VenusaurFollowerGFX::
    INCBIN "gfx/followers/venusaur.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/venusaur.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/venusaur.2bpp", 16 tiles, 4 tiles
assert @ - VenusaurFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHARMANDER", ROMX
CharmanderFollowerGFX::
    INCBIN "gfx/followers/charmander.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/charmander.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/charmander.2bpp", 16 tiles, 4 tiles
assert @ - CharmanderFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHARMELEON", ROMX
CharmeleonFollowerGFX::
    INCBIN "gfx/followers/charmeleon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/charmeleon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/charmeleon.2bpp", 16 tiles, 4 tiles
assert @ - CharmeleonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SQUIRTLE", ROMX
SquirtleFollowerGFX::
    INCBIN "gfx/followers/squirtle.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/squirtle.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/squirtle.2bpp", 16 tiles, 4 tiles
assert @ - SquirtleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WARTORTLE", ROMX
WartortleFollowerGFX::
    INCBIN "gfx/followers/wartortle.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/wartortle.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/wartortle.2bpp", 16 tiles, 4 tiles
assert @ - WartortleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BLASTOISE", ROMX
BlastoiseFollowerGFX::
    INCBIN "gfx/followers/blastoise.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/blastoise.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/blastoise.2bpp", 16 tiles, 4 tiles
assert @ - BlastoiseFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VENIPEDE", ROMX
VenipedeFollowerGFX::
    INCBIN "gfx/followers/venipede.2bpp"
assert @ - VenipedeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WHIRLIPEDE", ROMX
WhirlipedeFollowerGFX::
    INCBIN "gfx/followers/whirlipede.2bpp"
assert @ - WhirlipedeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCOLIPEDE", ROMX
ScolipedeFollowerGFX::
    INCBIN "gfx/followers/scolipede.2bpp"
assert @ - ScolipedeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HONEDGE", ROMX
HonedgeFollowerGFX::
    INCBIN "gfx/followers/honedge.2bpp"
assert @ - HonedgeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DOUBLADE", ROMX
DoubladeFollowerGFX::
    INCBIN "gfx/followers/doublade.2bpp"
assert @ - DoubladeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AEGISLASH", ROMX
AegislashFollowerGFX::
    INCBIN "gfx/followers/aegislash.2bpp"
assert @ - AegislashFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARLY", ROMX
StarlyFollowerGFX::
    INCBIN "gfx/followers/starly.2bpp"
assert @ - StarlyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARAVIA", ROMX
StaraviaFollowerGFX::
    INCBIN "gfx/followers/staravia.2bpp"
assert @ - StaraviaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARAPTOR", ROMX
StaraptorFollowerGFX::
    INCBIN "gfx/followers/staraptor.2bpp"
assert @ - StaraptorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RATTATA", ROMX
RattataFollowerGFX::
    INCBIN "gfx/followers/rattata.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/rattata.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/rattata.2bpp", 16 tiles, 4 tiles
assert @ - RattataFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RATICATE", ROMX
RaticateFollowerGFX::
    INCBIN "gfx/followers/raticate.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/raticate.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/raticate.2bpp", 16 tiles, 4 tiles
assert @ - RaticateFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BUNEARY", ROMX
BunearyFollowerGFX::
    INCBIN "gfx/followers/buneary.2bpp"
assert @ - BunearyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LOPUNNY", ROMX
LopunnyFollowerGFX::
    INCBIN "gfx/followers/lopunny.2bpp"
assert @ - LopunnyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DEINO", ROMX
DeinoFollowerGFX::
    INCBIN "gfx/followers/deino.2bpp"
assert @ - DeinoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARBOK", ROMX
ArbokFollowerGFX::
    INCBIN "gfx/followers/arbok.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/arbok.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/arbok.2bpp", 16 tiles, 4 tiles
assert @ - ArbokFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAICHU", ROMX
RaichuFollowerGFX::
    INCBIN "gfx/followers/raichu.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/raichu.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/raichu.2bpp", 16 tiles, 4 tiles
assert @ - RaichuFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ROTOM", ROMX
RotomFollowerGFX::
    INCBIN "gfx/followers/rotom.2bpp"
assert @ - RotomFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLTEGEIST", ROMX
PoltegeistFollowerGFX::
    INCBIN "gfx/followers/poltegeist.2bpp"
assert @ - PoltegeistFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORAN_F", ROMX
NidoranFFollowerGFX::
    INCBIN "gfx/followers/nidoran_f.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/nidoran_f.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/nidoran_f.2bpp", 16 tiles, 4 tiles
assert @ - NidoranFFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORINA", ROMX
NidorinaFollowerGFX::
    INCBIN "gfx/followers/nidorina.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/nidorina.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/nidorina.2bpp", 16 tiles, 4 tiles
assert @ - NidorinaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDOQUEEN", ROMX
NidoqueenFollowerGFX::
    INCBIN "gfx/followers/nidoqueen.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/nidoqueen.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/nidoqueen.2bpp", 16 tiles, 4 tiles
assert @ - NidoqueenFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORAN_M", ROMX
NidoranMFollowerGFX::
    INCBIN "gfx/followers/nidoran_m.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/nidoran_m.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/nidoran_m.2bpp", 16 tiles, 4 tiles
assert @ - NidoranMFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORINO", ROMX
NidorinoFollowerGFX::
    INCBIN "gfx/followers/nidorino.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/nidorino.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/nidorino.2bpp", 16 tiles, 4 tiles
assert @ - NidorinoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDOKING", ROMX
NidokingFollowerGFX::
    INCBIN "gfx/followers/nidoking.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/nidoking.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/nidoking.2bpp", 16 tiles, 4 tiles
assert @ - NidokingFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CLEFAIRY", ROMX
ClefairyFollowerGFX::
    INCBIN "gfx/followers/clefairy.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/clefairy.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/clefairy.2bpp", 16 tiles, 4 tiles
assert @ - ClefairyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CLEFABLE", ROMX
ClefableFollowerGFX::
    INCBIN "gfx/followers/clefable.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/clefable.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/clefable.2bpp", 16 tiles, 4 tiles
assert @ - ClefableFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VULPIX", ROMX
VulpixFollowerGFX::
    INCBIN "gfx/followers/vulpix.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/vulpix.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/vulpix.2bpp", 16 tiles, 4 tiles
assert @ - VulpixFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NINETALES", ROMX
NinetalesFollowerGFX::
    INCBIN "gfx/followers/ninetales.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ninetales.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ninetales.2bpp", 16 tiles, 4 tiles
assert @ - NinetalesFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAWILE", ROMX
MawileFollowerGFX::
    INCBIN "gfx/followers/mawile.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mawile.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mawile.2bpp", 16 tiles, 4 tiles
assert @ - MawileFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZUBAT", ROMX
ZubatFollowerGFX::
    INCBIN "gfx/followers/zubat.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/zubat.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/zubat.2bpp", 16 tiles, 4 tiles
assert @ - ZubatFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GOLBAT", ROMX
GolbatFollowerGFX::
    INCBIN "gfx/followers/golbat.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/golbat.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/golbat.2bpp", 16 tiles, 4 tiles
assert @ - GolbatFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PAWNIARD", ROMX
PawniardFollowerGFX::
    INCBIN "gfx/followers/pawniard.2bpp"
assert @ - PawniardFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BISHARP", ROMX
BisharpFollowerGFX::
    INCBIN "gfx/followers/bisharp.2bpp"
assert @ - BisharpFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art REGIGIGAS", ROMX
RegigigasFollowerGFX::
    INCBIN "gfx/followers/regigigas.2bpp"
assert @ - RegigigasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HAWLUCHA", ROMX
HawluchaFollowerGFX::
    INCBIN "gfx/followers/hawlucha.2bpp"
assert @ - HawluchaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LARVESTA", ROMX
LarvestaFollowerGFX::
    INCBIN "gfx/followers/larvesta.2bpp"
assert @ - LarvestaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VOLCARONA", ROMX
VolcaronaFollowerGFX::
    INCBIN "gfx/followers/volcarona.2bpp"
assert @ - VolcaronaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MEOWTH", ROMX
MeowthFollowerGFX::
    INCBIN "gfx/followers/meowth.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/meowth.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/meowth.2bpp", 16 tiles, 4 tiles
assert @ - MeowthFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PERSIAN", ROMX
PersianFollowerGFX::
    INCBIN "gfx/followers/persian.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/persian.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/persian.2bpp", 16 tiles, 4 tiles
assert @ - PersianFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNOVER", ROMX
SnoverFollowerGFX::
    INCBIN "gfx/followers/snover.2bpp"
assert @ - SnoverFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ABOMASNOW", ROMX
AbomasnowFollowerGFX::
    INCBIN "gfx/followers/abomasnow.2bpp"
assert @ - AbomasnowFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHROOMISH", ROMX
ShroomishFollowerGFX::
    INCBIN "gfx/followers/shroomish.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/shroomish.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/shroomish.2bpp", 16 tiles, 4 tiles
assert @ - ShroomishFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BRELOOM", ROMX
BreloomFollowerGFX::
    INCBIN "gfx/followers/breloom.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/breloom.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/breloom.2bpp", 16 tiles, 4 tiles
assert @ - BreloomFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GROWLITHE", ROMX
GrowlitheFollowerGFX::
    INCBIN "gfx/followers/growlithe.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/growlithe.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/growlithe.2bpp", 16 tiles, 4 tiles
assert @ - GrowlitheFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARCANINE", ROMX
ArcanineFollowerGFX::
    INCBIN "gfx/followers/arcanine.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/arcanine.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/arcanine.2bpp", 16 tiles, 4 tiles
assert @ - ArcanineFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLIWAG", ROMX
PoliwagFollowerGFX::
    INCBIN "gfx/followers/poliwag.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/poliwag.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/poliwag.2bpp", 16 tiles, 4 tiles
assert @ - PoliwagFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLIWHIRL", ROMX
PoliwhirlFollowerGFX::
    INCBIN "gfx/followers/poliwhirl.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/poliwhirl.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/poliwhirl.2bpp", 16 tiles, 4 tiles
assert @ - PoliwhirlFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLIWRATH", ROMX
PoliwrathFollowerGFX::
    INCBIN "gfx/followers/poliwrath.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/poliwrath.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/poliwrath.2bpp", 16 tiles, 4 tiles
assert @ - PoliwrathFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ABRA", ROMX
AbraFollowerGFX::
    INCBIN "gfx/followers/abra.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/abra.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/abra.2bpp", 16 tiles, 4 tiles
assert @ - AbraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KADABRA", ROMX
KadabraFollowerGFX::
    INCBIN "gfx/followers/kadabra.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/kadabra.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/kadabra.2bpp", 16 tiles, 4 tiles
assert @ - KadabraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ALAKAZAM", ROMX
AlakazamFollowerGFX::
    INCBIN "gfx/followers/alakazam.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/alakazam.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/alakazam.2bpp", 16 tiles, 4 tiles
assert @ - AlakazamFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MACHOP", ROMX
MachopFollowerGFX::
    INCBIN "gfx/followers/machop.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/machop.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/machop.2bpp", 16 tiles, 4 tiles
assert @ - MachopFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MACHOKE", ROMX
MachokeFollowerGFX::
    INCBIN "gfx/followers/machoke.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/machoke.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/machoke.2bpp", 16 tiles, 4 tiles
assert @ - MachokeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MACHAMP", ROMX
MachampFollowerGFX::
    INCBIN "gfx/followers/machamp.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/machamp.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/machamp.2bpp", 16 tiles, 4 tiles
assert @ - MachampFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BELLSPROUT", ROMX
BellsproutFollowerGFX::
    INCBIN "gfx/followers/bellsprout.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/bellsprout.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/bellsprout.2bpp", 16 tiles, 4 tiles
assert @ - BellsproutFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MIMIKYU", ROMX
MimikyuFollowerGFX::
    INCBIN "gfx/followers/mimikyu.2bpp"
assert @ - MimikyuFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VICTREEBEL", ROMX
VictreebelFollowerGFX::
    INCBIN "gfx/followers/victreebel.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/victreebel.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/victreebel.2bpp", 16 tiles, 4 tiles
assert @ - VictreebelFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TENTACOOL", ROMX
TentacoolFollowerGFX::
    INCBIN "gfx/followers/tentacool.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/tentacool.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/tentacool.2bpp", 16 tiles, 4 tiles
assert @ - TentacoolFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TENTACRUEL", ROMX
TentacruelFollowerGFX::
    INCBIN "gfx/followers/tentacruel.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/tentacruel.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/tentacruel.2bpp", 16 tiles, 4 tiles
assert @ - TentacruelFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GEODUDE", ROMX
GeodudeFollowerGFX::
    INCBIN "gfx/followers/geodude.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/geodude.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/geodude.2bpp", 16 tiles, 4 tiles
assert @ - GeodudeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GRAVELER", ROMX
GravelerFollowerGFX::
    INCBIN "gfx/followers/graveler.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/graveler.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/graveler.2bpp", 16 tiles, 4 tiles
assert @ - GravelerFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GOLEM", ROMX
GolemFollowerGFX::
    INCBIN "gfx/followers/golem.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/golem.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/golem.2bpp", 16 tiles, 4 tiles
assert @ - GolemFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PONYTA", ROMX
PonytaFollowerGFX::
    INCBIN "gfx/followers/ponyta.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ponyta.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ponyta.2bpp", 16 tiles, 4 tiles
assert @ - PonytaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAPIDASH", ROMX
RapidashFollowerGFX::
    INCBIN "gfx/followers/rapidash.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/rapidash.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/rapidash.2bpp", 16 tiles, 4 tiles
assert @ - RapidashFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SLOWPOKE", ROMX
SlowpokeFollowerGFX::
    INCBIN "gfx/followers/slowpoke.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/slowpoke.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/slowpoke.2bpp", 16 tiles, 4 tiles
assert @ - SlowpokeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SLOWBRO", ROMX
SlowbroFollowerGFX::
    INCBIN "gfx/followers/slowbro.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/slowbro.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/slowbro.2bpp", 16 tiles, 4 tiles
assert @ - SlowbroFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGNEMITE", ROMX
MagnemiteFollowerGFX::
    INCBIN "gfx/followers/magnemite.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/magnemite.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/magnemite.2bpp", 16 tiles, 4 tiles
assert @ - MagnemiteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGNETON", ROMX
MagnetonFollowerGFX::
    INCBIN "gfx/followers/magneton.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/magneton.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/magneton.2bpp", 16 tiles, 4 tiles
assert @ - MagnetonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAMOSWINE", ROMX
MamoswineFollowerGFX::
    INCBIN "gfx/followers/mamoswine.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mamoswine.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mamoswine.2bpp", 16 tiles, 4 tiles
assert @ - MamoswineFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ELECTIVIRE", ROMX
ElectivireFollowerGFX::
    INCBIN "gfx/followers/electivire.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/electivire.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/electivire.2bpp", 16 tiles, 4 tiles
assert @ - ElectivireFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGNEZONE", ROMX
MagnezoneFollowerGFX::
    INCBIN "gfx/followers/magnezone.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/magnezone.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/magnezone.2bpp", 16 tiles, 4 tiles
assert @ - MagnezoneFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art YANMEGA", ROMX
YanmegaFollowerGFX::
    INCBIN "gfx/followers/yanmega.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/yanmega.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/yanmega.2bpp", 16 tiles, 4 tiles
assert @ - YanmegaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GLISCOR", ROMX
GliscorFollowerGFX::
    INCBIN "gfx/followers/gliscor.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gliscor.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gliscor.2bpp", 16 tiles, 4 tiles
assert @ - GliscorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHELLDER", ROMX
ShellderFollowerGFX::
    INCBIN "gfx/followers/shellder.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/shellder.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/shellder.2bpp", 16 tiles, 4 tiles
assert @ - ShellderFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CLOYSTER", ROMX
CloysterFollowerGFX::
    INCBIN "gfx/followers/cloyster.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/cloyster.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/cloyster.2bpp", 16 tiles, 4 tiles
assert @ - CloysterFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GASTLY", ROMX
GastlyFollowerGFX::
    INCBIN "gfx/followers/gastly.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gastly.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gastly.2bpp", 16 tiles, 4 tiles
assert @ - GastlyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HAUNTER", ROMX
HaunterFollowerGFX::
    INCBIN "gfx/followers/haunter.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/haunter.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/haunter.2bpp", 16 tiles, 4 tiles
assert @ - HaunterFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ONIX", ROMX
OnixFollowerGFX::
    INCBIN "gfx/followers/onix.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/onix.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/onix.2bpp", 16 tiles, 4 tiles
assert @ - OnixFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art URSALUNA", ROMX
UrsalunaFollowerGFX::
    INCBIN "gfx/followers/ursaluna.2bpp"
assert @ - UrsalunaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FEEBAS", ROMX
FeebasFollowerGFX::
    INCBIN "gfx/followers/feebas.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/feebas.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/feebas.2bpp", 16 tiles, 4 tiles
assert @ - FeebasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MILOTIC", ROMX
MiloticFollowerGFX::
    INCBIN "gfx/followers/milotic.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/milotic.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/milotic.2bpp", 16 tiles, 4 tiles
assert @ - MiloticFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MUDKIP", ROMX
MudkipFollowerGFX::
    INCBIN "gfx/followers/mudkip.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mudkip.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mudkip.2bpp", 16 tiles, 4 tiles
assert @ - MudkipFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EXEGGCUTE", ROMX
ExeggcuteFollowerGFX::
    INCBIN "gfx/followers/exeggcute.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/exeggcute.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/exeggcute.2bpp", 16 tiles, 4 tiles
assert @ - ExeggcuteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EXEGGUTOR", ROMX
ExeggutorFollowerGFX::
    INCBIN "gfx/followers/exeggutor.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/exeggutor.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/exeggutor.2bpp", 16 tiles, 4 tiles
assert @ - ExeggutorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MARILL", ROMX
MarillFollowerGFX::
    INCBIN "gfx/followers/marill.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/marill.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/marill.2bpp", 16 tiles, 4 tiles
assert @ - MarillFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AZUMARILL", ROMX
AzumarillFollowerGFX::
    INCBIN "gfx/followers/azumarill.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/azumarill.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/azumarill.2bpp", 16 tiles, 4 tiles
assert @ - AzumarillFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SOLOSIS", ROMX
SolosisFollowerGFX::
    INCBIN "gfx/followers/solosis.2bpp"
assert @ - SolosisFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DUOSION", ROMX
DuosionFollowerGFX::
    INCBIN "gfx/followers/duosion.2bpp"
assert @ - DuosionFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art REUNICLUS", ROMX
ReuniclusFollowerGFX::
    INCBIN "gfx/followers/reuniclus.2bpp"
assert @ - ReuniclusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZWEILOUS", ROMX
ZweilousFollowerGFX::
    INCBIN "gfx/followers/zweilous.2bpp"
assert @ - ZweilousFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WEEZING", ROMX
WeezingFollowerGFX::
    INCBIN "gfx/followers/weezing.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/weezing.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/weezing.2bpp", 16 tiles, 4 tiles
assert @ - WeezingFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RHYHORN", ROMX
RhyhornFollowerGFX::
    INCBIN "gfx/followers/rhyhorn.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/rhyhorn.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/rhyhorn.2bpp", 16 tiles, 4 tiles
assert @ - RhyhornFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RHYDON", ROMX
RhydonFollowerGFX::
    INCBIN "gfx/followers/rhydon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/rhydon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/rhydon.2bpp", 16 tiles, 4 tiles
assert @ - RhydonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHANSEY", ROMX
ChanseyFollowerGFX::
    INCBIN "gfx/followers/chansey.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/chansey.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/chansey.2bpp", 16 tiles, 4 tiles
assert @ - ChanseyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WEAVILE", ROMX
WeavileFollowerGFX::
    INCBIN "gfx/followers/weavile.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/weavile.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/weavile.2bpp", 16 tiles, 4 tiles
assert @ - WeavileFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RHYPERIOR", ROMX
RhyperiorFollowerGFX::
    INCBIN "gfx/followers/rhyperior.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/rhyperior.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/rhyperior.2bpp", 16 tiles, 4 tiles
assert @ - RhyperiorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SEADRA", ROMX
SeadraFollowerGFX::
    INCBIN "gfx/followers/seadra.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/seadra.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/seadra.2bpp", 16 tiles, 4 tiles
assert @ - SeadraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGMORTAR", ROMX
MagmortarFollowerGFX::
    INCBIN "gfx/followers/magmortar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/magmortar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/magmortar.2bpp", 16 tiles, 4 tiles
assert @ - MagmortarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HONCHKROW", ROMX
HonchkrowFollowerGFX::
    INCBIN "gfx/followers/honchkrow.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/honchkrow.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/honchkrow.2bpp", 16 tiles, 4 tiles
assert @ - HonchkrowFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARYU", ROMX
StaryuFollowerGFX::
    INCBIN "gfx/followers/staryu.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/staryu.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/staryu.2bpp", 16 tiles, 4 tiles
assert @ - StaryuFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARMIE", ROMX
StarmieFollowerGFX::
    INCBIN "gfx/followers/starmie.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/starmie.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/starmie.2bpp", 16 tiles, 4 tiles
assert @ - StarmieFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MR__MIME", ROMX
MrMimeFollowerGFX::
    INCBIN "gfx/followers/mr__mime.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mr__mime.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mr__mime.2bpp", 16 tiles, 4 tiles
assert @ - MrMimeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCYTHER", ROMX
ScytherFollowerGFX::
    INCBIN "gfx/followers/scyther.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/scyther.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/scyther.2bpp", 16 tiles, 4 tiles
assert @ - ScytherFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art JYNX", ROMX
JynxFollowerGFX::
    INCBIN "gfx/followers/jynx.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/jynx.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/jynx.2bpp", 16 tiles, 4 tiles
assert @ - JynxFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ELECTABUZZ", ROMX
ElectabuzzFollowerGFX::
    INCBIN "gfx/followers/electabuzz.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/electabuzz.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/electabuzz.2bpp", 16 tiles, 4 tiles
assert @ - ElectabuzzFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGMAR", ROMX
MagmarFollowerGFX::
    INCBIN "gfx/followers/magmar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/magmar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/magmar.2bpp", 16 tiles, 4 tiles
assert @ - MagmarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PINSIR", ROMX
PinsirFollowerGFX::
    INCBIN "gfx/followers/pinsir.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/pinsir.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/pinsir.2bpp", 16 tiles, 4 tiles
assert @ - PinsirFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TAUROS", ROMX
TaurosFollowerGFX::
    INCBIN "gfx/followers/tauros.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/tauros.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/tauros.2bpp", 16 tiles, 4 tiles
assert @ - TaurosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGIKARP", ROMX
MagikarpFollowerGFX::
    INCBIN "gfx/followers/magikarp.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/magikarp.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/magikarp.2bpp", 16 tiles, 4 tiles
assert @ - MagikarpFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GYARADOS", ROMX
GyaradosFollowerGFX::
    INCBIN "gfx/followers/gyarados.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gyarados.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gyarados.2bpp", 16 tiles, 4 tiles
assert @ - GyaradosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DITTO", ROMX
DittoFollowerGFX::
    INCBIN "gfx/followers/ditto.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ditto.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ditto.2bpp", 16 tiles, 4 tiles
assert @ - DittoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EEVEE", ROMX
EeveeFollowerGFX::
    INCBIN "gfx/followers/eevee.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/eevee.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/eevee.2bpp", 16 tiles, 4 tiles
assert @ - EeveeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VAPOREON", ROMX
VaporeonFollowerGFX::
    INCBIN "gfx/followers/vaporeon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/vaporeon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/vaporeon.2bpp", 16 tiles, 4 tiles
assert @ - VaporeonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art JOLTEON", ROMX
JolteonFollowerGFX::
    INCBIN "gfx/followers/jolteon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/jolteon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/jolteon.2bpp", 16 tiles, 4 tiles
assert @ - JolteonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FLAREON", ROMX
FlareonFollowerGFX::
    INCBIN "gfx/followers/flareon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/flareon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/flareon.2bpp", 16 tiles, 4 tiles
assert @ - FlareonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PORYGON", ROMX
PorygonFollowerGFX::
    INCBIN "gfx/followers/porygon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/porygon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/porygon.2bpp", 16 tiles, 4 tiles
assert @ - PorygonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RALTS", ROMX
RaltsFollowerGFX::
    INCBIN "gfx/followers/ralts.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ralts.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ralts.2bpp", 16 tiles, 4 tiles
assert @ - RaltsFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KIRLIA", ROMX
KirliaFollowerGFX::
    INCBIN "gfx/followers/kirlia.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/kirlia.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/kirlia.2bpp", 16 tiles, 4 tiles
assert @ - KirliaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GARDEVOIR", ROMX
GardevoirFollowerGFX::
    INCBIN "gfx/followers/gardevoir.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gardevoir.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gardevoir.2bpp", 16 tiles, 4 tiles
assert @ - GardevoirFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GALLADE", ROMX
GalladeFollowerGFX::
    INCBIN "gfx/followers/gallade.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gallade.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gallade.2bpp", 16 tiles, 4 tiles
assert @ - GalladeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AERODACTYL", ROMX
AerodactylFollowerGFX::
    INCBIN "gfx/followers/aerodactyl.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/aerodactyl.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/aerodactyl.2bpp", 16 tiles, 4 tiles
assert @ - AerodactylFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNORLAX", ROMX
SnorlaxFollowerGFX::
    INCBIN "gfx/followers/snorlax.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/snorlax.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/snorlax.2bpp", 16 tiles, 4 tiles
assert @ - SnorlaxFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARTICUNO", ROMX
ArticunoFollowerGFX::
    INCBIN "gfx/followers/articuno.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/articuno.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/articuno.2bpp", 16 tiles, 4 tiles
assert @ - ArticunoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZAPDOS", ROMX
ZapdosFollowerGFX::
    INCBIN "gfx/followers/zapdos.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/zapdos.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/zapdos.2bpp", 16 tiles, 4 tiles
assert @ - ZapdosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MOLTRES", ROMX
MoltresFollowerGFX::
    INCBIN "gfx/followers/moltres.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/moltres.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/moltres.2bpp", 16 tiles, 4 tiles
assert @ - MoltresFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRATINI", ROMX
DratiniFollowerGFX::
    INCBIN "gfx/followers/dratini.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/dratini.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/dratini.2bpp", 16 tiles, 4 tiles
assert @ - DratiniFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRAGONAIR", ROMX
DragonairFollowerGFX::
    INCBIN "gfx/followers/dragonair.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/dragonair.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/dragonair.2bpp", 16 tiles, 4 tiles
assert @ - DragonairFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRAGONITE", ROMX
DragoniteFollowerGFX::
    INCBIN "gfx/followers/dragonite.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/dragonite.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/dragonite.2bpp", 16 tiles, 4 tiles
assert @ - DragoniteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MEW", ROMX
MewFollowerGFX::
    INCBIN "gfx/followers/mew.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mew.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mew.2bpp", 16 tiles, 4 tiles
assert @ - MewFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TREECKO", ROMX
TreeckoFollowerGFX::
    INCBIN "gfx/followers/treecko.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/treecko.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/treecko.2bpp", 16 tiles, 4 tiles
assert @ - TreeckoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GROVYLE", ROMX
GrovyleFollowerGFX::
    INCBIN "gfx/followers/grovyle.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/grovyle.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/grovyle.2bpp", 16 tiles, 4 tiles
assert @ - GrovyleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCEPTILE", ROMX
SceptileFollowerGFX::
    INCBIN "gfx/followers/sceptile.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/sceptile.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/sceptile.2bpp", 16 tiles, 4 tiles
assert @ - SceptileFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHIMCHAR", ROMX
ChimcharFollowerGFX::
    INCBIN "gfx/followers/chimchar.2bpp"
assert @ - ChimcharFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MONFERNO", ROMX
MonfernoFollowerGFX::
    INCBIN "gfx/followers/monferno.2bpp"
assert @ - MonfernoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art INFERNAPE", ROMX
InfernapeFollowerGFX::
    INCBIN "gfx/followers/infernape.2bpp"
assert @ - InfernapeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FROAKIE", ROMX
FroakieFollowerGFX::
    INCBIN "gfx/followers/froakie.2bpp"
assert @ - FroakieFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FROGADIER", ROMX
FrogadierFollowerGFX::
    INCBIN "gfx/followers/frogadier.2bpp"
assert @ - FrogadierFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GRENINJA", ROMX
GreninjaFollowerGFX::
    INCBIN "gfx/followers/greninja.2bpp"
assert @ - GreninjaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RIOLU", ROMX
RioluFollowerGFX::
    INCBIN "gfx/followers/riolu.2bpp"
assert @ - RioluFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LUCARIO", ROMX
LucarioFollowerGFX::
    INCBIN "gfx/followers/lucario.2bpp"
assert @ - LucarioFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HOOTHOOT", ROMX
HoothootFollowerGFX::
    INCBIN "gfx/followers/hoothoot.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/hoothoot.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/hoothoot.2bpp", 16 tiles, 4 tiles
assert @ - HoothootFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NOCTOWL", ROMX
NoctowlFollowerGFX::
    INCBIN "gfx/followers/noctowl.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/noctowl.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/noctowl.2bpp", 16 tiles, 4 tiles
assert @ - NoctowlFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRILBUR", ROMX
DrilburFollowerGFX::
    INCBIN "gfx/followers/drilbur.2bpp"
assert @ - DrilburFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EXCADRILL", ROMX
ExcadrillFollowerGFX::
    INCBIN "gfx/followers/excadrill.2bpp"
assert @ - ExcadrillFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art JOLTIK", ROMX
JoltikFollowerGFX::
    INCBIN "gfx/followers/joltik.2bpp"
assert @ - JoltikFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GALVANTULA", ROMX
GalvantulaFollowerGFX::
    INCBIN "gfx/followers/galvantula.2bpp"
assert @ - GalvantulaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CROBAT", ROMX
CrobatFollowerGFX::
    INCBIN "gfx/followers/crobat.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/crobat.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/crobat.2bpp", 16 tiles, 4 tiles
assert @ - CrobatFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LITWICK", ROMX
LitwickFollowerGFX::
    INCBIN "gfx/followers/litwick.2bpp"
assert @ - LitwickFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LAMPENT", ROMX
LampentFollowerGFX::
    INCBIN "gfx/followers/lampent.2bpp"
assert @ - LampentFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHANDELURE", ROMX
ChandelureFollowerGFX::
    INCBIN "gfx/followers/chandelure.2bpp"
assert @ - ChandelureFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TOGEPI", ROMX
TogepiFollowerGFX::
    INCBIN "gfx/followers/togepi.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/togepi.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/togepi.2bpp", 16 tiles, 4 tiles
assert @ - TogepiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TOGETIC", ROMX
TogeticFollowerGFX::
    INCBIN "gfx/followers/togetic.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/togetic.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/togetic.2bpp", 16 tiles, 4 tiles
assert @ - TogeticFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TOGEKISS", ROMX
TogekissFollowerGFX::
    INCBIN "gfx/followers/togekiss.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/togekiss.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/togekiss.2bpp", 16 tiles, 4 tiles
assert @ - TogekissFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAREEP", ROMX
MareepFollowerGFX::
    INCBIN "gfx/followers/mareep.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mareep.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mareep.2bpp", 16 tiles, 4 tiles
assert @ - MareepFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FLAAFFY", ROMX
FlaaffyFollowerGFX::
    INCBIN "gfx/followers/flaaffy.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/flaaffy.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/flaaffy.2bpp", 16 tiles, 4 tiles
assert @ - FlaaffyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AMPHAROS", ROMX
AmpharosFollowerGFX::
    INCBIN "gfx/followers/ampharos.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ampharos.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ampharos.2bpp", 16 tiles, 4 tiles
assert @ - AmpharosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SYLVEON", ROMX
SylveonFollowerGFX::
    INCBIN "gfx/followers/sylveon.2bpp"
assert @ - SylveonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MISMAGIUS", ROMX
MismagiusFollowerGFX::
    INCBIN "gfx/followers/mismagius.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mismagius.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mismagius.2bpp", 16 tiles, 4 tiles
assert @ - MismagiusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PORYGONZ", ROMX
PorygonzFollowerGFX::
    INCBIN "gfx/followers/porygonz.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/porygonz.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/porygonz.2bpp", 16 tiles, 4 tiles
assert @ - PorygonzFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLITOED", ROMX
PolitoedFollowerGFX::
    INCBIN "gfx/followers/politoed.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/politoed.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/politoed.2bpp", 16 tiles, 4 tiles
assert @ - PolitoedFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TIMBURR", ROMX
TimburrFollowerGFX::
    INCBIN "gfx/followers/timburr.2bpp"
assert @ - TimburrFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GURDURR", ROMX
GurdurrFollowerGFX::
    INCBIN "gfx/followers/gurdurr.2bpp"
assert @ - GurdurrFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CONKELDURR", ROMX
ConkeldurrFollowerGFX::
    INCBIN "gfx/followers/conkeldurr.2bpp"
assert @ - ConkeldurrFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BELDUM", ROMX
BeldumFollowerGFX::
    INCBIN "gfx/followers/beldum.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/beldum.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/beldum.2bpp", 16 tiles, 4 tiles
assert @ - BeldumFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art METANG", ROMX
MetangFollowerGFX::
    INCBIN "gfx/followers/metang.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/metang.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/metang.2bpp", 16 tiles, 4 tiles
assert @ - MetangFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art METAGROSS", ROMX
MetagrossFollowerGFX::
    INCBIN "gfx/followers/metagross.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/metagross.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/metagross.2bpp", 16 tiles, 4 tiles
assert @ - MetagrossFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art YANMA", ROMX
YanmaFollowerGFX::
    INCBIN "gfx/followers/yanma.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/yanma.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/yanma.2bpp", 16 tiles, 4 tiles
assert @ - YanmaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MARSHTOMP", ROMX
MarshtompFollowerGFX::
    INCBIN "gfx/followers/marshtomp.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/marshtomp.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/marshtomp.2bpp", 16 tiles, 4 tiles
assert @ - MarshtompFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SWAMPERT", ROMX
SwampertFollowerGFX::
    INCBIN "gfx/followers/swampert.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/swampert.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/swampert.2bpp", 16 tiles, 4 tiles
assert @ - SwampertFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ESPEON", ROMX
EspeonFollowerGFX::
    INCBIN "gfx/followers/espeon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/espeon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/espeon.2bpp", 16 tiles, 4 tiles
assert @ - EspeonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art UMBREON", ROMX
UmbreonFollowerGFX::
    INCBIN "gfx/followers/umbreon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/umbreon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/umbreon.2bpp", 16 tiles, 4 tiles
assert @ - UmbreonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MURKROW", ROMX
MurkrowFollowerGFX::
    INCBIN "gfx/followers/murkrow.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/murkrow.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/murkrow.2bpp", 16 tiles, 4 tiles
assert @ - MurkrowFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MISDREAVUS", ROMX
MisdreavusFollowerGFX::
    INCBIN "gfx/followers/misdreavus.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/misdreavus.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/misdreavus.2bpp", 16 tiles, 4 tiles
assert @ - MisdreavusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art UNOWN", ROMX
UnownFollowerGFX::
    INCBIN "gfx/followers/unown.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/unown.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/unown.2bpp", 16 tiles, 4 tiles
assert @ - UnownFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MELTAN", ROMX
MeltanFollowerGFX::
    INCBIN "gfx/followers/meltan.2bpp"
assert @ - MeltanFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BAGON", ROMX
BagonFollowerGFX::
    INCBIN "gfx/followers/bagon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/bagon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/bagon.2bpp", 16 tiles, 4 tiles
assert @ - BagonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHELGON", ROMX
ShelgonFollowerGFX::
    INCBIN "gfx/followers/shelgon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/shelgon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/shelgon.2bpp", 16 tiles, 4 tiles
assert @ - ShelgonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SALAMENCE", ROMX
SalamenceFollowerGFX::
    INCBIN "gfx/followers/salamence.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/salamence.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/salamence.2bpp", 16 tiles, 4 tiles
assert @ - SalamenceFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HYDREIGON", ROMX
HydreigonFollowerGFX::
    INCBIN "gfx/followers/hydreigon.2bpp"
assert @ - HydreigonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GLIGAR", ROMX
GligarFollowerGFX::
    INCBIN "gfx/followers/gligar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/gligar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/gligar.2bpp", 16 tiles, 4 tiles
assert @ - GligarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STEELIX", ROMX
SteelixFollowerGFX::
    INCBIN "gfx/followers/steelix.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/steelix.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/steelix.2bpp", 16 tiles, 4 tiles
assert @ - SteelixFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GIBLE", ROMX
GibleFollowerGFX::
    INCBIN "gfx/followers/gible.2bpp"
assert @ - GibleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GABITE", ROMX
GabiteFollowerGFX::
    INCBIN "gfx/followers/gabite.2bpp"
assert @ - GabiteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GARCHOMP", ROMX
GarchompFollowerGFX::
    INCBIN "gfx/followers/garchomp.2bpp"
assert @ - GarchompFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCIZOR", ROMX
ScizorFollowerGFX::
    INCBIN "gfx/followers/scizor.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/scizor.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/scizor.2bpp", 16 tiles, 4 tiles
assert @ - ScizorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HERACROSS", ROMX
HeracrossFollowerGFX::
    INCBIN "gfx/followers/heracross.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/heracross.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/heracross.2bpp", 16 tiles, 4 tiles
assert @ - HeracrossFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNEASEL", ROMX
SneaselFollowerGFX::
    INCBIN "gfx/followers/sneasel.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/sneasel.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/sneasel.2bpp", 16 tiles, 4 tiles
assert @ - SneaselFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TEDDIURSA", ROMX
TeddiursaFollowerGFX::
    INCBIN "gfx/followers/teddiursa.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/teddiursa.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/teddiursa.2bpp", 16 tiles, 4 tiles
assert @ - TeddiursaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art URSARING", ROMX
UrsaringFollowerGFX::
    INCBIN "gfx/followers/ursaring.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ursaring.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ursaring.2bpp", 16 tiles, 4 tiles
assert @ - UrsaringFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LATIAS", ROMX
LatiasFollowerGFX::
    INCBIN "gfx/followers/latias.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/latias.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/latias.2bpp", 16 tiles, 4 tiles
assert @ - LatiasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DEOXYS", ROMX
DeoxysFollowerGFX::
    INCBIN "gfx/followers/deoxys.2bpp"
assert @ - DeoxysFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SWINUB", ROMX
SwinubFollowerGFX::
    INCBIN "gfx/followers/swinub.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/swinub.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/swinub.2bpp", 16 tiles, 4 tiles
assert @ - SwinubFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PILOSWINE", ROMX
PiloswineFollowerGFX::
    INCBIN "gfx/followers/piloswine.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/piloswine.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/piloswine.2bpp", 16 tiles, 4 tiles
assert @ - PiloswineFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LATIOS", ROMX
LatiosFollowerGFX::
    INCBIN "gfx/followers/latios.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/latios.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/latios.2bpp", 16 tiles, 4 tiles
assert @ - LatiosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PALKIA", ROMX
PalkiaFollowerGFX::
    INCBIN "gfx/followers/palkia.2bpp"
assert @ - PalkiaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KYOGRE", ROMX
KyogreFollowerGFX::
    INCBIN "gfx/followers/kyogre.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/kyogre.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/kyogre.2bpp", 16 tiles, 4 tiles
assert @ - KyogreFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GROUDON", ROMX
GroudonFollowerGFX::
    INCBIN "gfx/followers/groudon.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/groudon.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/groudon.2bpp", 16 tiles, 4 tiles
assert @ - GroudonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SKARMORY", ROMX
SkarmoryFollowerGFX::
    INCBIN "gfx/followers/skarmory.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/skarmory.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/skarmory.2bpp", 16 tiles, 4 tiles
assert @ - SkarmoryFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HOUNDOUR", ROMX
HoundourFollowerGFX::
    INCBIN "gfx/followers/houndour.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/houndour.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/houndour.2bpp", 16 tiles, 4 tiles
assert @ - HoundourFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HOUNDOOM", ROMX
HoundoomFollowerGFX::
    INCBIN "gfx/followers/houndoom.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/houndoom.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/houndoom.2bpp", 16 tiles, 4 tiles
assert @ - HoundoomFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KINGDRA", ROMX
KingdraFollowerGFX::
    INCBIN "gfx/followers/kingdra.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/kingdra.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/kingdra.2bpp", 16 tiles, 4 tiles
assert @ - KingdraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art COTTONEE", ROMX
CottoneeFollowerGFX::
    INCBIN "gfx/followers/cottonee.2bpp"
assert @ - CottoneeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WHIMSICOTT", ROMX
WhimsicottFollowerGFX::
    INCBIN "gfx/followers/whimsicott.2bpp"
assert @ - WhimsicottFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PORYGON2", ROMX
Porygon2FollowerGFX::
    INCBIN "gfx/followers/porygon2.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/porygon2.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/porygon2.2bpp", 16 tiles, 4 tiles
assert @ - Porygon2FollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAYQUAZA", ROMX
RayquazaFollowerGFX::
    INCBIN "gfx/followers/rayquaza.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/rayquaza.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/rayquaza.2bpp", 16 tiles, 4 tiles
assert @ - RayquazaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SMEARGLE", ROMX
SmeargleFollowerGFX::
    INCBIN "gfx/followers/smeargle.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/smeargle.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/smeargle.2bpp", 16 tiles, 4 tiles
assert @ - SmeargleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DIALGA", ROMX
DialgaFollowerGFX::
    INCBIN "gfx/followers/dialga.2bpp"
assert @ - DialgaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KLEAVOR", ROMX
KleavorFollowerGFX::
    INCBIN "gfx/followers/kleavor.2bpp"
assert @ - KleavorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art XERNEAS", ROMX
XerneasFollowerGFX::
    INCBIN "gfx/followers/xerneas.2bpp"
assert @ - XerneasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MILTANK", ROMX
MiltankFollowerGFX::
    INCBIN "gfx/followers/miltank.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/miltank.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/miltank.2bpp", 16 tiles, 4 tiles
assert @ - MiltankFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BLISSEY", ROMX
BlisseyFollowerGFX::
    INCBIN "gfx/followers/blissey.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/blissey.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/blissey.2bpp", 16 tiles, 4 tiles
assert @ - BlisseyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAIKOU", ROMX
RaikouFollowerGFX::
    INCBIN "gfx/followers/raikou.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/raikou.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/raikou.2bpp", 16 tiles, 4 tiles
assert @ - RaikouFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ENTEI", ROMX
EnteiFollowerGFX::
    INCBIN "gfx/followers/entei.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/entei.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/entei.2bpp", 16 tiles, 4 tiles
assert @ - EnteiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SUICUNE", ROMX
SuicuneFollowerGFX::
    INCBIN "gfx/followers/suicune.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/suicune.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/suicune.2bpp", 16 tiles, 4 tiles
assert @ - SuicuneFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LARVITAR", ROMX
LarvitarFollowerGFX::
    INCBIN "gfx/followers/larvitar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/larvitar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/larvitar.2bpp", 16 tiles, 4 tiles
assert @ - LarvitarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PUPITAR", ROMX
PupitarFollowerGFX::
    INCBIN "gfx/followers/pupitar.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/pupitar.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/pupitar.2bpp", 16 tiles, 4 tiles
assert @ - PupitarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LUGIA", ROMX
LugiaFollowerGFX::
    INCBIN "gfx/followers/lugia.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/lugia.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/lugia.2bpp", 16 tiles, 4 tiles
assert @ - LugiaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HO_OH", ROMX
HoOhFollowerGFX::
    INCBIN "gfx/followers/ho_oh.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/ho_oh.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/ho_oh.2bpp", 16 tiles, 4 tiles
assert @ - HoOhFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CELEBI", ROMX
CelebiFollowerGFX::
    INCBIN "gfx/followers/celebi.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/celebi.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/celebi.2bpp", 16 tiles, 4 tiles
assert @ - CelebiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MEWTWO", ROMX
MewtwoFollowerGFX::
    INCBIN "gfx/followers/mewtwo.2bpp", 0, 16 tiles
    INCBIN "gfx/followers/mewtwo.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/followers/mewtwo.2bpp", 16 tiles, 4 tiles
assert @ - MewtwoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARCEUS", ROMX
ArceusFollowerGFX::
    INCBIN "gfx/followers/arceus.2bpp"
assert @ - ArceusFollowerGFX == FOLLOWER_GFX_SIZE
