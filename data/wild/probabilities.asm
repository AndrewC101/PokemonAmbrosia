MACRO mon_prob
; percent, index
	db \1, \2 * 2
ENDM

; DevNote - Encounter probabilities
GrassMonProbTable:
	table_width 2, GrassMonProbTable
	mon_prob 24,  0 ; 24% chance
	mon_prob 48,  1 ; 24% chance
	mon_prob 63,  2 ; 15% chance
	mon_prob 78,  3 ; 15% chance
	mon_prob 88,  4 ; 10% chance
	mon_prob 98,  5 ; 10% chance
	mon_prob 100, 6 ;  2% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 2, WaterMonProbTable
	mon_prob 50,  0 ; 50% chance
	mon_prob 80,  1 ; 30% chance
	mon_prob 100, 2 ; 20% chance
	assert_table_length NUM_WATERMON
