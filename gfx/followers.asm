MACRO follower_gfx
    assert _NARG == 4
    assert \2 == 0 || \2 == 1
    assert \3 == 2 || \3 == 3
    assert \4 == 4 || \4 == 5
    INCBIN \1, \2 * 4 tiles, 4 tiles
    INCBIN \1, (\2 ^ 1) * 4 tiles, 4 tiles
    INCBIN \1, (\3 ^ 1) * 4 tiles, 4 tiles
    INCBIN \1, \3 * 4 tiles, 4 tiles
    INCBIN \1, (\4 ^ 1) * 4 tiles, 4 tiles
    INCBIN \1, \4 * 4 tiles, 4 tiles
ENDM

; Follower graphics use the current PNGs in gfx/followers/.
SECTION "Follower initial art", ROMX, BANK[$7a]

; Monster's original frame order is down/up/side rest, then down/up/side step.
GenericFollowerGFX::
    INCBIN "gfx/sprites/monster.2bpp",  0 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp", 12 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp", 16 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp",  4 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp", 20 tiles, 4 tiles
    INCBIN "gfx/sprites/monster.2bpp",  8 tiles, 4 tiles
assert @ - GenericFollowerGFX == FOLLOWER_GFX_SIZE

BulbasaurFollowerGFX::
    INCBIN "gfx/followers/bulbasaur.2bpp"
assert @ - BulbasaurFollowerGFX == FOLLOWER_GFX_SIZE

CharizardFollowerGFX::
    INCBIN "gfx/followers/charizard.2bpp"
assert @ - CharizardFollowerGFX == FOLLOWER_GFX_SIZE

PikachuFollowerGFX::
    follower_gfx "gfx/followers/pikachu.2bpp", 0, 2, 5
assert @ - PikachuFollowerGFX == FOLLOWER_GFX_SIZE

GengarFollowerGFX::
    INCBIN "gfx/followers/gengar.2bpp"
assert @ - GengarFollowerGFX == FOLLOWER_GFX_SIZE

LaprasFollowerGFX::
    INCBIN "gfx/followers/lapras.2bpp"
assert @ - LaprasFollowerGFX == FOLLOWER_GFX_SIZE

TyranitarFollowerGFX::
    follower_gfx "gfx/followers/tyranitar.2bpp", 0, 2, 5
assert @ - TyranitarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art IVYSAUR", ROMX
IvysaurFollowerGFX::
    INCBIN "gfx/followers/ivysaur.2bpp"
assert @ - IvysaurFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VENUSAUR", ROMX
VenusaurFollowerGFX::
    INCBIN "gfx/followers/venusaur.2bpp"
assert @ - VenusaurFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHARMANDER", ROMX
CharmanderFollowerGFX::
    INCBIN "gfx/followers/charmander.2bpp"
assert @ - CharmanderFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHARMELEON", ROMX
CharmeleonFollowerGFX::
    INCBIN "gfx/followers/charmeleon.2bpp"
assert @ - CharmeleonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SQUIRTLE", ROMX
SquirtleFollowerGFX::
    INCBIN "gfx/followers/squirtle.2bpp"
assert @ - SquirtleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WARTORTLE", ROMX
WartortleFollowerGFX::
    INCBIN "gfx/followers/wartortle.2bpp"
assert @ - WartortleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BLASTOISE", ROMX
BlastoiseFollowerGFX::
    INCBIN "gfx/followers/blastoise.2bpp"
assert @ - BlastoiseFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VENIPEDE", ROMX
VenipedeFollowerGFX::
    follower_gfx "gfx/followers/venipede.2bpp", 0, 3, 4
assert @ - VenipedeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WHIRLIPEDE", ROMX
WhirlipedeFollowerGFX::
    follower_gfx "gfx/followers/whirlipede.2bpp", 0, 3, 4
assert @ - WhirlipedeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCOLIPEDE", ROMX
ScolipedeFollowerGFX::
    follower_gfx "gfx/followers/scolipede.2bpp", 0, 3, 4
assert @ - ScolipedeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HONEDGE", ROMX
HonedgeFollowerGFX::
    follower_gfx "gfx/followers/honedge.2bpp", 0, 3, 4
assert @ - HonedgeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DOUBLADE", ROMX
DoubladeFollowerGFX::
    follower_gfx "gfx/followers/doublade.2bpp", 0, 3, 4
assert @ - DoubladeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AEGISLASH", ROMX
AegislashFollowerGFX::
    follower_gfx "gfx/followers/aegislash.2bpp", 0, 3, 4
assert @ - AegislashFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARLY", ROMX
StarlyFollowerGFX::
    INCBIN "gfx/followers/starly.2bpp"
assert @ - StarlyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARAVIA", ROMX
StaraviaFollowerGFX::
    follower_gfx "gfx/followers/staravia.2bpp", 0, 3, 4
assert @ - StaraviaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARAPTOR", ROMX
StaraptorFollowerGFX::
    follower_gfx "gfx/followers/staraptor.2bpp", 0, 2, 4
assert @ - StaraptorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RATTATA", ROMX
RattataFollowerGFX::
    INCBIN "gfx/followers/rattata.2bpp"
assert @ - RattataFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RATICATE", ROMX
RaticateFollowerGFX::
    INCBIN "gfx/followers/raticate.2bpp"
assert @ - RaticateFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BUNEARY", ROMX
BunearyFollowerGFX::
    follower_gfx "gfx/followers/buneary.2bpp", 0, 2, 5
assert @ - BunearyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LOPUNNY", ROMX
LopunnyFollowerGFX::
    follower_gfx "gfx/followers/lopunny.2bpp", 0, 2, 5
assert @ - LopunnyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DEINO", ROMX
DeinoFollowerGFX::
    INCBIN "gfx/followers/deino.2bpp"
assert @ - DeinoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARBOK", ROMX
ArbokFollowerGFX::
    INCBIN "gfx/followers/arbok.2bpp"
assert @ - ArbokFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAICHU", ROMX
RaichuFollowerGFX::
    follower_gfx "gfx/followers/raichu.2bpp", 0, 2, 5
assert @ - RaichuFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ROTOM", ROMX
RotomFollowerGFX::
    follower_gfx "gfx/followers/rotom.2bpp", 0, 3, 4
assert @ - RotomFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLTEGEIST", ROMX
PoltegeistFollowerGFX::
    follower_gfx "gfx/followers/poltegeist.2bpp", 0, 3, 4
assert @ - PoltegeistFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORAN_F", ROMX
NidoranFFollowerGFX::
    INCBIN "gfx/followers/nidoran_f.2bpp"
assert @ - NidoranFFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORINA", ROMX
NidorinaFollowerGFX::
    INCBIN "gfx/followers/nidorina.2bpp"
assert @ - NidorinaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDOQUEEN", ROMX
NidoqueenFollowerGFX::
    INCBIN "gfx/followers/nidoqueen.2bpp"
assert @ - NidoqueenFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORAN_M", ROMX
NidoranMFollowerGFX::
    INCBIN "gfx/followers/nidoran_m.2bpp"
assert @ - NidoranMFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDORINO", ROMX
NidorinoFollowerGFX::
    INCBIN "gfx/followers/nidorino.2bpp"
assert @ - NidorinoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NIDOKING", ROMX
NidokingFollowerGFX::
    INCBIN "gfx/followers/nidoking.2bpp"
assert @ - NidokingFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CLEFAIRY", ROMX
ClefairyFollowerGFX::
    INCBIN "gfx/followers/clefairy.2bpp"
assert @ - ClefairyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CLEFABLE", ROMX
ClefableFollowerGFX::
    INCBIN "gfx/followers/clefable.2bpp"
assert @ - ClefableFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VULPIX", ROMX
VulpixFollowerGFX::
    INCBIN "gfx/followers/vulpix.2bpp"
assert @ - VulpixFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NINETALES", ROMX
NinetalesFollowerGFX::
    INCBIN "gfx/followers/ninetales.2bpp"
assert @ - NinetalesFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAWILE", ROMX
MawileFollowerGFX::
    INCBIN "gfx/followers/mawile.2bpp"
assert @ - MawileFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZUBAT", ROMX
ZubatFollowerGFX::
    INCBIN "gfx/followers/zubat.2bpp"
assert @ - ZubatFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GOLBAT", ROMX
GolbatFollowerGFX::
    INCBIN "gfx/followers/golbat.2bpp"
assert @ - GolbatFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PAWNIARD", ROMX
PawniardFollowerGFX::
    follower_gfx "gfx/followers/pawniard.2bpp", 1, 3, 5
assert @ - PawniardFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BISHARP", ROMX
BisharpFollowerGFX::
    follower_gfx "gfx/followers/bisharp.2bpp", 1, 3, 5
assert @ - BisharpFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art REGIGIGAS", ROMX
RegigigasFollowerGFX::
    follower_gfx "gfx/followers/regigigas.2bpp", 1, 3, 5
assert @ - RegigigasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HAWLUCHA", ROMX
HawluchaFollowerGFX::
    INCBIN "gfx/followers/hawlucha.2bpp"
assert @ - HawluchaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LARVESTA", ROMX
LarvestaFollowerGFX::
    follower_gfx "gfx/followers/larvesta.2bpp", 0, 3, 4
assert @ - LarvestaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VOLCARONA", ROMX
VolcaronaFollowerGFX::
    follower_gfx "gfx/followers/volcarona.2bpp", 0, 2, 4
assert @ - VolcaronaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MEOWTH", ROMX
MeowthFollowerGFX::
    INCBIN "gfx/followers/meowth.2bpp"
assert @ - MeowthFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PERSIAN", ROMX
PersianFollowerGFX::
    INCBIN "gfx/followers/persian.2bpp"
assert @ - PersianFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNOVER", ROMX
SnoverFollowerGFX::
    follower_gfx "gfx/followers/snover.2bpp", 0, 3, 4
assert @ - SnoverFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ABOMASNOW", ROMX
AbomasnowFollowerGFX::
    INCBIN "gfx/followers/abomasnow.2bpp"
assert @ - AbomasnowFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHROOMISH", ROMX
ShroomishFollowerGFX::
    INCBIN "gfx/followers/shroomish.2bpp"
assert @ - ShroomishFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BRELOOM", ROMX
BreloomFollowerGFX::
    INCBIN "gfx/followers/breloom.2bpp"
assert @ - BreloomFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GROWLITHE", ROMX
GrowlitheFollowerGFX::
    INCBIN "gfx/followers/growlithe.2bpp"
assert @ - GrowlitheFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARCANINE", ROMX
ArcanineFollowerGFX::
    INCBIN "gfx/followers/arcanine.2bpp"
assert @ - ArcanineFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLIWAG", ROMX
PoliwagFollowerGFX::
    INCBIN "gfx/followers/poliwag.2bpp"
assert @ - PoliwagFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLIWHIRL", ROMX
PoliwhirlFollowerGFX::
    INCBIN "gfx/followers/poliwhirl.2bpp"
assert @ - PoliwhirlFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLIWRATH", ROMX
PoliwrathFollowerGFX::
    INCBIN "gfx/followers/poliwrath.2bpp"
assert @ - PoliwrathFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ABRA", ROMX
AbraFollowerGFX::
    INCBIN "gfx/followers/abra.2bpp"
assert @ - AbraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KADABRA", ROMX
KadabraFollowerGFX::
    INCBIN "gfx/followers/kadabra.2bpp"
assert @ - KadabraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ALAKAZAM", ROMX
AlakazamFollowerGFX::
    INCBIN "gfx/followers/alakazam.2bpp"
assert @ - AlakazamFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MACHOP", ROMX
MachopFollowerGFX::
    INCBIN "gfx/followers/machop.2bpp"
assert @ - MachopFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MACHOKE", ROMX
MachokeFollowerGFX::
    INCBIN "gfx/followers/machoke.2bpp"
assert @ - MachokeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MACHAMP", ROMX
MachampFollowerGFX::
    INCBIN "gfx/followers/machamp.2bpp"
assert @ - MachampFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BELLSPROUT", ROMX
BellsproutFollowerGFX::
    INCBIN "gfx/followers/bellsprout.2bpp"
assert @ - BellsproutFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MIMIKYU", ROMX
MimikyuFollowerGFX::
    follower_gfx "gfx/followers/mimikyu.2bpp", 0, 2, 4
assert @ - MimikyuFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VICTREEBEL", ROMX
VictreebelFollowerGFX::
    INCBIN "gfx/followers/victreebel.2bpp"
assert @ - VictreebelFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TENTACOOL", ROMX
TentacoolFollowerGFX::
    INCBIN "gfx/followers/tentacool.2bpp"
assert @ - TentacoolFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TENTACRUEL", ROMX
TentacruelFollowerGFX::
    INCBIN "gfx/followers/tentacruel.2bpp"
assert @ - TentacruelFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GEODUDE", ROMX
GeodudeFollowerGFX::
    INCBIN "gfx/followers/geodude.2bpp"
assert @ - GeodudeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GRAVELER", ROMX
GravelerFollowerGFX::
    INCBIN "gfx/followers/graveler.2bpp"
assert @ - GravelerFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GOLEM", ROMX
GolemFollowerGFX::
    INCBIN "gfx/followers/golem.2bpp"
assert @ - GolemFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PONYTA", ROMX
PonytaFollowerGFX::
    INCBIN "gfx/followers/ponyta.2bpp"
assert @ - PonytaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAPIDASH", ROMX
RapidashFollowerGFX::
    INCBIN "gfx/followers/rapidash.2bpp"
assert @ - RapidashFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SLOWPOKE", ROMX
SlowpokeFollowerGFX::
    INCBIN "gfx/followers/slowpoke.2bpp"
assert @ - SlowpokeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SLOWBRO", ROMX
SlowbroFollowerGFX::
    INCBIN "gfx/followers/slowbro.2bpp"
assert @ - SlowbroFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGNEMITE", ROMX
MagnemiteFollowerGFX::
    INCBIN "gfx/followers/magnemite.2bpp"
assert @ - MagnemiteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGNETON", ROMX
MagnetonFollowerGFX::
    follower_gfx "gfx/followers/magneton.2bpp", 0, 2, 5
assert @ - MagnetonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAMOSWINE", ROMX
MamoswineFollowerGFX::
    INCBIN "gfx/followers/mamoswine.2bpp"
assert @ - MamoswineFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ELECTIVIRE", ROMX
ElectivireFollowerGFX::
    INCBIN "gfx/followers/electivire.2bpp"
assert @ - ElectivireFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGNEZONE", ROMX
MagnezoneFollowerGFX::
    INCBIN "gfx/followers/magnezone.2bpp"
assert @ - MagnezoneFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art YANMEGA", ROMX
YanmegaFollowerGFX::
    INCBIN "gfx/followers/yanmega.2bpp"
assert @ - YanmegaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GLISCOR", ROMX
GliscorFollowerGFX::
    INCBIN "gfx/followers/gliscor.2bpp"
assert @ - GliscorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHELLDER", ROMX
ShellderFollowerGFX::
    INCBIN "gfx/followers/shellder.2bpp"
assert @ - ShellderFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CLOYSTER", ROMX
CloysterFollowerGFX::
    INCBIN "gfx/followers/cloyster.2bpp"
assert @ - CloysterFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GASTLY", ROMX
GastlyFollowerGFX::
    INCBIN "gfx/followers/gastly.2bpp"
assert @ - GastlyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HAUNTER", ROMX
HaunterFollowerGFX::
    INCBIN "gfx/followers/haunter.2bpp"
assert @ - HaunterFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ONIX", ROMX
OnixFollowerGFX::
    INCBIN "gfx/followers/onix.2bpp"
assert @ - OnixFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art URSALUNA", ROMX
UrsalunaFollowerGFX::
    follower_gfx "gfx/followers/ursaluna.2bpp", 0, 3, 4
assert @ - UrsalunaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art URSALUNA_B", ROMX
UrsalunaBFollowerGFX::
    follower_gfx "gfx/followers/ursaluna_b.2bpp", 0, 3, 4
assert @ - UrsalunaBFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FEEBAS", ROMX
FeebasFollowerGFX::
    INCBIN "gfx/followers/feebas.2bpp"
assert @ - FeebasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MILOTIC", ROMX
MiloticFollowerGFX::
    follower_gfx "gfx/followers/milotic.2bpp", 0, 2, 5
assert @ - MiloticFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MUDKIP", ROMX
MudkipFollowerGFX::
    INCBIN "gfx/followers/mudkip.2bpp"
assert @ - MudkipFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EXEGGCUTE", ROMX
ExeggcuteFollowerGFX::
    follower_gfx "gfx/followers/exeggcute.2bpp", 0, 2, 5
assert @ - ExeggcuteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EXEGGUTOR", ROMX
ExeggutorFollowerGFX::
    INCBIN "gfx/followers/exeggutor.2bpp"
assert @ - ExeggutorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MARILL", ROMX
MarillFollowerGFX::
    INCBIN "gfx/followers/marill.2bpp"
assert @ - MarillFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AZUMARILL", ROMX
AzumarillFollowerGFX::
    INCBIN "gfx/followers/azumarill.2bpp"
assert @ - AzumarillFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SOLOSIS", ROMX
SolosisFollowerGFX::
    follower_gfx "gfx/followers/solosis.2bpp", 0, 3, 4
assert @ - SolosisFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DUOSION", ROMX
DuosionFollowerGFX::
    follower_gfx "gfx/followers/duosion.2bpp", 0, 3, 4
assert @ - DuosionFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art REUNICLUS", ROMX
ReuniclusFollowerGFX::
    follower_gfx "gfx/followers/reuniclus.2bpp", 0, 3, 4
assert @ - ReuniclusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZWEILOUS", ROMX
ZweilousFollowerGFX::
    follower_gfx "gfx/followers/zweilous.2bpp", 1, 3, 4
assert @ - ZweilousFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WEEZING", ROMX
WeezingFollowerGFX::
    follower_gfx "gfx/followers/weezing.2bpp", 0, 2, 5
assert @ - WeezingFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RHYHORN", ROMX
RhyhornFollowerGFX::
    INCBIN "gfx/followers/rhyhorn.2bpp"
assert @ - RhyhornFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RHYDON", ROMX
RhydonFollowerGFX::
    INCBIN "gfx/followers/rhydon.2bpp"
assert @ - RhydonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHANSEY", ROMX
ChanseyFollowerGFX::
    INCBIN "gfx/followers/chansey.2bpp"
assert @ - ChanseyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WEAVILE", ROMX
WeavileFollowerGFX::
    INCBIN "gfx/followers/weavile.2bpp"
assert @ - WeavileFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RHYPERIOR", ROMX
RhyperiorFollowerGFX::
    INCBIN "gfx/followers/rhyperior.2bpp"
assert @ - RhyperiorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SEADRA", ROMX
SeadraFollowerGFX::
    INCBIN "gfx/followers/seadra.2bpp"
assert @ - SeadraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGMORTAR", ROMX
MagmortarFollowerGFX::
    INCBIN "gfx/followers/magmortar.2bpp"
assert @ - MagmortarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HONCHKROW", ROMX
HonchkrowFollowerGFX::
    INCBIN "gfx/followers/honchkrow.2bpp"
assert @ - HonchkrowFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARYU", ROMX
StaryuFollowerGFX::
    INCBIN "gfx/followers/staryu.2bpp"
assert @ - StaryuFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STARMIE", ROMX
StarmieFollowerGFX::
    INCBIN "gfx/followers/starmie.2bpp"
assert @ - StarmieFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MR__MIME", ROMX
MrMimeFollowerGFX::
    INCBIN "gfx/followers/mr__mime.2bpp"
assert @ - MrMimeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCYTHER", ROMX
ScytherFollowerGFX::
    INCBIN "gfx/followers/scyther.2bpp"
assert @ - ScytherFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art JYNX", ROMX
JynxFollowerGFX::
    INCBIN "gfx/followers/jynx.2bpp"
assert @ - JynxFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ELECTABUZZ", ROMX
ElectabuzzFollowerGFX::
    INCBIN "gfx/followers/electabuzz.2bpp"
assert @ - ElectabuzzFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGMAR", ROMX
MagmarFollowerGFX::
    INCBIN "gfx/followers/magmar.2bpp"
assert @ - MagmarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PINSIR", ROMX
PinsirFollowerGFX::
    INCBIN "gfx/followers/pinsir.2bpp"
assert @ - PinsirFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TAUROS", ROMX
TaurosFollowerGFX::
    INCBIN "gfx/followers/tauros.2bpp"
assert @ - TaurosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAGIKARP", ROMX
MagikarpFollowerGFX::
    follower_gfx "gfx/followers/magikarp.2bpp", 0, 2, 5
assert @ - MagikarpFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GYARADOS", ROMX
GyaradosFollowerGFX::
    INCBIN "gfx/followers/gyarados.2bpp"
assert @ - GyaradosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DITTO", ROMX
DittoFollowerGFX::
    INCBIN "gfx/followers/ditto.2bpp"
assert @ - DittoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EEVEE", ROMX
EeveeFollowerGFX::
    INCBIN "gfx/followers/eevee.2bpp"
assert @ - EeveeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art VAPOREON", ROMX
VaporeonFollowerGFX::
    INCBIN "gfx/followers/vaporeon.2bpp"
assert @ - VaporeonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art JOLTEON", ROMX
JolteonFollowerGFX::
    INCBIN "gfx/followers/jolteon.2bpp"
assert @ - JolteonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FLAREON", ROMX
FlareonFollowerGFX::
    INCBIN "gfx/followers/flareon.2bpp"
assert @ - FlareonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PORYGON", ROMX
PorygonFollowerGFX::
    INCBIN "gfx/followers/porygon.2bpp"
assert @ - PorygonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RALTS", ROMX
RaltsFollowerGFX::
    INCBIN "gfx/followers/ralts.2bpp"
assert @ - RaltsFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KIRLIA", ROMX
KirliaFollowerGFX::
    INCBIN "gfx/followers/kirlia.2bpp"
assert @ - KirliaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GARDEVOIR", ROMX
GardevoirFollowerGFX::
    INCBIN "gfx/followers/gardevoir.2bpp"
assert @ - GardevoirFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GALLADE", ROMX
GalladeFollowerGFX::
    INCBIN "gfx/followers/gallade.2bpp"
assert @ - GalladeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AERODACTYL", ROMX
AerodactylFollowerGFX::
    INCBIN "gfx/followers/aerodactyl.2bpp"
assert @ - AerodactylFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNORLAX", ROMX
SnorlaxFollowerGFX::
    INCBIN "gfx/followers/snorlax.2bpp"
assert @ - SnorlaxFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARTICUNO", ROMX
ArticunoFollowerGFX::
    INCBIN "gfx/followers/articuno.2bpp"
assert @ - ArticunoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZAPDOS", ROMX
ZapdosFollowerGFX::
    INCBIN "gfx/followers/zapdos.2bpp"
assert @ - ZapdosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MOLTRES", ROMX
MoltresFollowerGFX::
    INCBIN "gfx/followers/moltres.2bpp"
assert @ - MoltresFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRATINI", ROMX
DratiniFollowerGFX::
    INCBIN "gfx/followers/dratini.2bpp"
assert @ - DratiniFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRAGONAIR", ROMX
DragonairFollowerGFX::
    INCBIN "gfx/followers/dragonair.2bpp"
assert @ - DragonairFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRAGONITE", ROMX
DragoniteFollowerGFX::
    INCBIN "gfx/followers/dragonite.2bpp"
assert @ - DragoniteFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MEW", ROMX
MewFollowerGFX::
    INCBIN "gfx/followers/mew.2bpp"
assert @ - MewFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TREECKO", ROMX
TreeckoFollowerGFX::
    INCBIN "gfx/followers/treecko.2bpp"
assert @ - TreeckoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GROVYLE", ROMX
GrovyleFollowerGFX::
    INCBIN "gfx/followers/grovyle.2bpp"
assert @ - GrovyleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SCEPTILE", ROMX
SceptileFollowerGFX::
    INCBIN "gfx/followers/sceptile.2bpp"
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
    follower_gfx "gfx/followers/infernape.2bpp", 0, 2, 5
assert @ - InfernapeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FROAKIE", ROMX
FroakieFollowerGFX::
    follower_gfx "gfx/followers/froakie.2bpp", 0, 2, 4
assert @ - FroakieFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FROGADIER", ROMX
FrogadierFollowerGFX::
    follower_gfx "gfx/followers/frogadier.2bpp", 0, 3, 4
assert @ - FrogadierFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GRENINJA", ROMX
GreninjaFollowerGFX::
    follower_gfx "gfx/followers/greninja.2bpp", 0, 3, 4
assert @ - GreninjaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RIOLU", ROMX
RioluFollowerGFX::
    follower_gfx "gfx/followers/riolu.2bpp", 1, 3, 5
assert @ - RioluFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LUCARIO", ROMX
LucarioFollowerGFX::
    INCBIN "gfx/followers/lucario.2bpp"
assert @ - LucarioFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HOOTHOOT", ROMX
HoothootFollowerGFX::
    INCBIN "gfx/followers/hoothoot.2bpp"
assert @ - HoothootFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NOCTOWL", ROMX
NoctowlFollowerGFX::
    INCBIN "gfx/followers/noctowl.2bpp"
assert @ - NoctowlFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRILBUR", ROMX
DrilburFollowerGFX::
    follower_gfx "gfx/followers/drilbur.2bpp", 1, 3, 5
assert @ - DrilburFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art EXCADRILL", ROMX
ExcadrillFollowerGFX::
    INCBIN "gfx/followers/excadrill.2bpp"
assert @ - ExcadrillFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art JOLTIK", ROMX
JoltikFollowerGFX::
    follower_gfx "gfx/followers/joltik.2bpp", 1, 3, 4
assert @ - JoltikFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GALVANTULA", ROMX
GalvantulaFollowerGFX::
    follower_gfx "gfx/followers/galvantula.2bpp", 1, 3, 4
assert @ - GalvantulaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CROBAT", ROMX
CrobatFollowerGFX::
    INCBIN "gfx/followers/crobat.2bpp"
assert @ - CrobatFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LITWICK", ROMX
LitwickFollowerGFX::
    follower_gfx "gfx/followers/litwick.2bpp", 0, 3, 4
assert @ - LitwickFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LAMPENT", ROMX
LampentFollowerGFX::
    follower_gfx "gfx/followers/lampent.2bpp", 0, 2, 4
assert @ - LampentFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CHANDELURE", ROMX
ChandelureFollowerGFX::
    follower_gfx "gfx/followers/chandelure.2bpp", 0, 2, 4
assert @ - ChandelureFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TOGEPI", ROMX
TogepiFollowerGFX::
    INCBIN "gfx/followers/togepi.2bpp"
assert @ - TogepiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TOGETIC", ROMX
TogeticFollowerGFX::
    INCBIN "gfx/followers/togetic.2bpp"
assert @ - TogeticFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TOGEKISS", ROMX
TogekissFollowerGFX::
    INCBIN "gfx/followers/togekiss.2bpp"
assert @ - TogekissFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NINETALES_A", ROMX
NinetalesAFollowerGFX::
    follower_gfx "gfx/followers/ninetales_a.2bpp", 0, 3, 4
assert @ - NinetalesAFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MAREEP", ROMX
MareepFollowerGFX::
    INCBIN "gfx/followers/mareep.2bpp"
assert @ - MareepFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FLAAFFY", ROMX
FlaaffyFollowerGFX::
    INCBIN "gfx/followers/flaaffy.2bpp"
assert @ - FlaaffyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art AMPHAROS", ROMX
AmpharosFollowerGFX::
    INCBIN "gfx/followers/ampharos.2bpp"
assert @ - AmpharosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SYLVEON", ROMX
SylveonFollowerGFX::
    follower_gfx "gfx/followers/sylveon.2bpp", 0, 3, 4
assert @ - SylveonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MISMAGIUS", ROMX
MismagiusFollowerGFX::
    INCBIN "gfx/followers/mismagius.2bpp"
assert @ - MismagiusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PORYGONZ", ROMX
PorygonzFollowerGFX::
    INCBIN "gfx/followers/porygonz.2bpp"
assert @ - PorygonzFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art POLITOED", ROMX
PolitoedFollowerGFX::
    INCBIN "gfx/followers/politoed.2bpp"
assert @ - PolitoedFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TIMBURR", ROMX
TimburrFollowerGFX::
    INCBIN "gfx/followers/timburr.2bpp"
assert @ - TimburrFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GURDURR", ROMX
GurdurrFollowerGFX::
    follower_gfx "gfx/followers/gurdurr.2bpp", 1, 3, 5
assert @ - GurdurrFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CONKELDURR", ROMX
ConkeldurrFollowerGFX::
    INCBIN "gfx/followers/conkeldurr.2bpp"
assert @ - ConkeldurrFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BELDUM", ROMX
BeldumFollowerGFX::
    INCBIN "gfx/followers/beldum.2bpp"
assert @ - BeldumFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art METANG", ROMX
MetangFollowerGFX::
    INCBIN "gfx/followers/metang.2bpp"
assert @ - MetangFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art METAGROSS", ROMX
MetagrossFollowerGFX::
    INCBIN "gfx/followers/metagross.2bpp"
assert @ - MetagrossFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art YANMA", ROMX
YanmaFollowerGFX::
    INCBIN "gfx/followers/yanma.2bpp"
assert @ - YanmaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MARSHTOMP", ROMX
MarshtompFollowerGFX::
    INCBIN "gfx/followers/marshtomp.2bpp"
assert @ - MarshtompFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SWAMPERT", ROMX
SwampertFollowerGFX::
    INCBIN "gfx/followers/swampert.2bpp"
assert @ - SwampertFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ESPEON", ROMX
EspeonFollowerGFX::
    INCBIN "gfx/followers/espeon.2bpp"
assert @ - EspeonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art UMBREON", ROMX
UmbreonFollowerGFX::
    INCBIN "gfx/followers/umbreon.2bpp"
assert @ - UmbreonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MURKROW", ROMX
MurkrowFollowerGFX::
    INCBIN "gfx/followers/murkrow.2bpp"
assert @ - MurkrowFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MISDREAVUS", ROMX
MisdreavusFollowerGFX::
    INCBIN "gfx/followers/misdreavus.2bpp"
assert @ - MisdreavusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art UNOWN", ROMX
UnownFollowerGFX::
    INCBIN "gfx/followers/unown.2bpp"
assert @ - UnownFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MELTAN", ROMX
MeltanFollowerGFX::
    follower_gfx "gfx/followers/meltan.2bpp", 0, 2, 4
assert @ - MeltanFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BAGON", ROMX
BagonFollowerGFX::
    INCBIN "gfx/followers/bagon.2bpp"
assert @ - BagonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHELGON", ROMX
ShelgonFollowerGFX::
    INCBIN "gfx/followers/shelgon.2bpp"
assert @ - ShelgonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SALAMENCE", ROMX
SalamenceFollowerGFX::
    INCBIN "gfx/followers/salamence.2bpp"
assert @ - SalamenceFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HYDREIGON", ROMX
HydreigonFollowerGFX::
    follower_gfx "gfx/followers/hydreigon.2bpp", 0, 3, 4
assert @ - HydreigonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GLIGAR", ROMX
GligarFollowerGFX::
    INCBIN "gfx/followers/gligar.2bpp"
assert @ - GligarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art STEELIX", ROMX
SteelixFollowerGFX::
    INCBIN "gfx/followers/steelix.2bpp"
assert @ - SteelixFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GIBLE", ROMX
GibleFollowerGFX::
    follower_gfx "gfx/followers/gible.2bpp", 1, 3, 4
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
    INCBIN "gfx/followers/scizor.2bpp"
assert @ - ScizorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HERACROSS", ROMX
HeracrossFollowerGFX::
    INCBIN "gfx/followers/heracross.2bpp"
assert @ - HeracrossFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNEASEL", ROMX
SneaselFollowerGFX::
    INCBIN "gfx/followers/sneasel.2bpp"
assert @ - SneaselFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art TEDDIURSA", ROMX
TeddiursaFollowerGFX::
    INCBIN "gfx/followers/teddiursa.2bpp"
assert @ - TeddiursaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art URSARING", ROMX
UrsaringFollowerGFX::
    INCBIN "gfx/followers/ursaring.2bpp"
assert @ - UrsaringFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LATIAS", ROMX
LatiasFollowerGFX::
    follower_gfx "gfx/followers/latias.2bpp", 0, 2, 5
assert @ - LatiasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DEOXYS", ROMX
DeoxysFollowerGFX::
    follower_gfx "gfx/followers/deoxys.2bpp", 0, 3, 4
assert @ - DeoxysFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SWINUB", ROMX
SwinubFollowerGFX::
    INCBIN "gfx/followers/swinub.2bpp"
assert @ - SwinubFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PILOSWINE", ROMX
PiloswineFollowerGFX::
    INCBIN "gfx/followers/piloswine.2bpp"
assert @ - PiloswineFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LATIOS", ROMX
LatiosFollowerGFX::
    follower_gfx "gfx/followers/latios.2bpp", 0, 2, 5
assert @ - LatiosFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PALKIA", ROMX
PalkiaFollowerGFX::
    follower_gfx "gfx/followers/palkia.2bpp", 0, 2, 4
assert @ - PalkiaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KYOGRE", ROMX
KyogreFollowerGFX::
    follower_gfx "gfx/followers/kyogre.2bpp", 0, 2, 5
assert @ - KyogreFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GROUDON", ROMX
GroudonFollowerGFX::
    INCBIN "gfx/followers/groudon.2bpp"
assert @ - GroudonFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SKARMORY", ROMX
SkarmoryFollowerGFX::
    INCBIN "gfx/followers/skarmory.2bpp"
assert @ - SkarmoryFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HOUNDOUR", ROMX
HoundourFollowerGFX::
    INCBIN "gfx/followers/houndour.2bpp"
assert @ - HoundourFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HOUNDOOM", ROMX
HoundoomFollowerGFX::
    INCBIN "gfx/followers/houndoom.2bpp"
assert @ - HoundoomFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KINGDRA", ROMX
KingdraFollowerGFX::
    INCBIN "gfx/followers/kingdra.2bpp"
assert @ - KingdraFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art COTTONEE", ROMX
CottoneeFollowerGFX::
    follower_gfx "gfx/followers/cottonee.2bpp", 0, 3, 4
assert @ - CottoneeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art WHIMSICOTT", ROMX
WhimsicottFollowerGFX::
    follower_gfx "gfx/followers/whimsicott.2bpp", 0, 3, 4
assert @ - WhimsicottFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PORYGON2", ROMX
Porygon2FollowerGFX::
    INCBIN "gfx/followers/porygon2.2bpp"
assert @ - Porygon2FollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAYQUAZA", ROMX
RayquazaFollowerGFX::
    INCBIN "gfx/followers/rayquaza.2bpp"
assert @ - RayquazaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SMEARGLE", ROMX
SmeargleFollowerGFX::
    INCBIN "gfx/followers/smeargle.2bpp"
assert @ - SmeargleFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DIALGA", ROMX
DialgaFollowerGFX::
    follower_gfx "gfx/followers/dialga.2bpp", 0, 2, 4
assert @ - DialgaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KLEAVOR", ROMX
KleavorFollowerGFX::
    follower_gfx "gfx/followers/kleavor.2bpp", 1, 3, 5
assert @ - KleavorFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art XERNEAS", ROMX
XerneasFollowerGFX::
    follower_gfx "gfx/followers/xerneas.2bpp", 0, 2, 4
assert @ - XerneasFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art YVELTAL", ROMX
YveltalFollowerGFX::
    follower_gfx "gfx/followers/yveltal.2bpp", 0, 2, 4
assert @ - YveltalFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MILTANK", ROMX
MiltankFollowerGFX::
    INCBIN "gfx/followers/miltank.2bpp"
assert @ - MiltankFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BLISSEY", ROMX
BlisseyFollowerGFX::
    INCBIN "gfx/followers/blissey.2bpp"
assert @ - BlisseyFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art RAIKOU", ROMX
RaikouFollowerGFX::
    INCBIN "gfx/followers/raikou.2bpp"
assert @ - RaikouFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ENTEI", ROMX
EnteiFollowerGFX::
    INCBIN "gfx/followers/entei.2bpp"
assert @ - EnteiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SUICUNE", ROMX
SuicuneFollowerGFX::
    INCBIN "gfx/followers/suicune.2bpp"
assert @ - SuicuneFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LARVITAR", ROMX
LarvitarFollowerGFX::
    INCBIN "gfx/followers/larvitar.2bpp"
assert @ - LarvitarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art PUPITAR", ROMX
PupitarFollowerGFX::
    INCBIN "gfx/followers/pupitar.2bpp"
assert @ - PupitarFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art LUGIA", ROMX
LugiaFollowerGFX::
    INCBIN "gfx/followers/lugia.2bpp"
assert @ - LugiaFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art HO_OH", ROMX
HoOhFollowerGFX::
    INCBIN "gfx/followers/ho_oh.2bpp"
assert @ - HoOhFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art CELEBI", ROMX
CelebiFollowerGFX::
    INCBIN "gfx/followers/celebi.2bpp"
assert @ - CelebiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MEWTWO", ROMX
MewtwoFollowerGFX::
    follower_gfx "gfx/followers/mewtwo.2bpp", 0, 2, 5
assert @ - MewtwoFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARCEUS", ROMX
ArceusFollowerGFX::
    follower_gfx "gfx/followers/arceus.2bpp", 0, 2, 4
assert @ - ArceusFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art NOWN", ROMX
NownFollowerGFX::
    follower_gfx "gfx/followers/nown.2bpp", 0, 2, 4
assert @ - NownFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SNEASLER", ROMX
SneaslerFollowerGFX::
    follower_gfx "gfx/followers/sneasler.2bpp", 0, 2, 4
assert @ - SneaslerFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art SHAYMIN", ROMX
ShayminFollowerGFX::
    follower_gfx "gfx/followers/shaymin.2bpp", 0, 2, 4
assert @ - ShayminFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FERROSEED", ROMX
FerroseedFollowerGFX::
    follower_gfx "gfx/followers/ferroseed.2bpp", 0, 2, 4
assert @ - FerroseedFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FERROTHORN", ROMX
FerrothornFollowerGFX::
    follower_gfx "gfx/followers/ferrothorn.2bpp", 0, 2, 4
assert @ - FerrothornFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GENESECT", ROMX
GenesectFollowerGFX::
    follower_gfx "gfx/followers/genesect.2bpp", 0, 2, 4
assert @ - GenesectFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art FRIGIBAX", ROMX
FrigibaxFollowerGFX::
    follower_gfx "gfx/followers/frigibax.2bpp", 0, 2, 4
assert @ - FrigibaxFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARCTIBAX", ROMX
ArctibaxFollowerGFX::
    follower_gfx "gfx/followers/arctibax.2bpp", 0, 2, 4
assert @ - ArctibaxFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art BAXCALIBUR", ROMX
BaxcaliburFollowerGFX::
    follower_gfx "gfx/followers/baxcalibur.2bpp", 0, 2, 4
assert @ - BaxcaliburFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art KINGAMBIT", ROMX
KingambitFollowerGFX::
    follower_gfx "gfx/followers/kingambit.2bpp", 0, 2, 4
assert @ - KingambitFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ZYGARDE", ROMX
ZygardeFollowerGFX::
    follower_gfx "gfx/followers/zygarde.2bpp", 0, 2, 4
assert @ - ZygardeFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art ARCTOZOLT", ROMX
ArctozoltFollowerGFX::
    follower_gfx "gfx/followers/arctozolt.2bpp", 0, 2, 4
assert @ - ArctozoltFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DRACOVISH", ROMX
DracovishFollowerGFX::
    follower_gfx "gfx/followers/dracovish.2bpp", 0, 2, 4
assert @ - DracovishFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art DARKRAI", ROMX
DarkraiFollowerGFX::
    follower_gfx "gfx/followers/darkrai.2bpp", 0, 2, 4
assert @ - DarkraiFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art MELMETAL", ROMX
MelmetalFollowerGFX::
    follower_gfx "gfx/followers/melmetal.2bpp", 0, 2, 4
assert @ - MelmetalFollowerGFX == FOLLOWER_GFX_SIZE

SECTION "Follower art GIRATINA", ROMX
GiratinaFollowerGFX::
    follower_gfx "gfx/followers/giratina.2bpp", 0, 2, 4
assert @ - GiratinaFollowerGFX == FOLLOWER_GFX_SIZE

PURGE follower_gfx
