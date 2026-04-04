# check_map_names_length.py
# automatically finds and checks the data\maps\map_names.asm file

import sys
import os
import re

cur_path = os.path.dirname(__file__)
map_names_file = "../data/maps/map_names.asm"
new_path = os.path.relpath(map_names_file, cur_path)
# new_path = os.path.relpath('..\\subfldr1\\testfile.txt', cur_path)

file1 = open(map_names_file, 'r')
Lines = file1.readlines()

charmaps = {"<POKE>": 2, "#" : 4, "<PKMN>": 2}

max_len = 18 # current max length of the map names

count = 0
bad_lines = 0
bad_lines_list = []
for line in Lines:
	count += 1
	m = re.search(r'\tdb \"(.*)\@\"', line)
	if m != None:
		line = line.strip()
		chunks = line.split('\"')
		# print(chunks)
		if (chunks[1][-1] != "@"):
			sys.exit("ERROR: line %d, you forgot the string delimiter '@'" % (count))#, chunks[1][-1]))	
		chunk = chunks[1][:-1]
		str_len = len(chunk)
		for spec_char in charmaps.keys():
			if spec_char in chunk:
				str_len -= len(spec_char)
				str_len += charmaps[spec_char]
		if (str_len > max_len):
			print("ERROR: Line %d: '%s', [cur len is %d, max len is %d]\n" % (count, m.group(1), str_len, max_len))	#line.strip()))
			bad_lines += 1
			bad_lines_list.append("ERROR: Line %d: '%s', [cur len is %d, max len is %d]\n" % (count, m.group(1), str_len, max_len))
		else:
			# print("OK: Line %d: '%s', [cur len is %d]\n" % (count, m.group(1), str_len))
			continue

if(bad_lines > 0):
	print("ERROR: total of %d lines are past the max length of %d characters\nNOTE: pay attention to charmap for special chars like '#' (actually 4 chars = Poke)" % (bad_lines, max_len))
	for line in bad_lines_list:
		print(line)
	keylist = [key for key in charmaps]
	print("This script is only accounting for: %s" % keylist)
else:
	print("All map names are currently 18 characters or under!")