#!/usr/bin/gawk -f

# Usage:  tools/free_space.awk [BANK=<bank_spec>] pokecrystal.map

BEGIN {
	nb_banks = 0
	free = 0
	rom_bank = 0 # Safety net for malformed files
	BANK="none"
}

# Only accept ROM banks, ignore everything else
toupper($0) ~ /^[ \t]*ROM[0X][ \t]+BANK[ \t]+#/ {
	nb_banks++
	rom_bank = 1
	split($0, fields, /[ \t]/)
	bank_num = strtonum(substr(fields[3], 2))
}

function register_bank(amount) {
	free += amount
	rom_bank = 0 # Reject upcoming banks by default
	# Removed per-bank printing
}

function register_bank_str(str) {
    if (str ~ /\$[0-9A-F]+/) {
        register_bank(strtonum("0x" substr(str, 2)))
    } else {
        printf "Malformed number? \"%s\" does not start with '$'\n", str
    }
}

rom_bank && toupper($0) ~ /^[ \t]*EMPTY$/ {
	register_bank(16384)
}
rom_bank && toupper($0) ~ /^[ \t]*SLACK:[ \t]/ {
    register_bank_str($2)
}
rom_bank && toupper($0) ~ /^[ \t]*TOTAL EMPTY:[ \t]/ {
    register_bank_str($3)
}

END {
	total_banks = 2
	while (total_banks < nb_banks) {
		total_banks *= 2
	}

	bank_num = nb_banks
	while (bank_num < total_banks) {
		register_bank(16384)
		bank_num++
	}

	total = total_banks * 16384
	printf "Free space: %5d/%5d (%.2f%%)\n", free, total, free * 100 / total
}
