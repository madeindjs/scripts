#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
	print_doe
	==============

	a simply script to print a complete technical Carrier project

	author: Rousseau Alexandre

	created: 2016/08/24
	updated: 2016/08/24

"""
import os, argparse, json
# require pywin32 (download at https://sourceforge.net/projects/pywin32/ )
import win32api, win32print

extensions_allowed = []
blacklist_files = []



def print_file(filepath):
	"""print a file on the default printer"""
	filename, extension = os.path.splitext(filepath)
	filename = os.path.basename(filename)
	if extension in extensions_allowed and not filename in blacklist_files:
		try:
			win32api.ShellExecute ( 0, "print", filepath,
				# If this is None, the default printer will  be used anyway.
				'/d:"%s"' % win32print.GetDefaultPrinter (),
				".", 0 )
			print("[*] request to print %s" % filepath)
		except :
			print("[ ] failed to print %s (maybe a wrong url?)" % filepath)
	else:
		print("[ ] not allowed to print %s (blacklisted)" % filepath)




def print_dir(directory, level=1):
	"""print all files on the default printer"""

	try:
		# get all directories to scan
		for root, dirs, files in os.walk(directory):
			if level > 0:
				for file in files:
					filepath = os.path.join(root, file )

					print_file(filepath)
			else:
				break

			level-=1

	except FileNotFoundError:
		print("[ ] failed to find files into %s (maybe a wrong url?)" % directory)
	



def main():
	# parse arg to find file(s)
	parser = argparse.ArgumentParser()
	parser.add_argument("-f", "--file", 		type=str, help="print a given file")
	parser.add_argument("-d", "--directory",type=str, help="print a given directory")
	parser.add_argument("-l", "--level", 		type=int, help="get deepth level in the given directory")
	parser.add_argument("-n", "--number", 	type=int, help="Number of copy to print")
	parser.add_argument("-a", "--doe", 	type=str, help="Print a complete DOE")
	args = parser.parse_args()


	# load settings
	with open('settings.json') as data_file:    
		data = json.load(data_file)
		global extensions_allowed
		global blacklist_files
		extensions_allowed = data['print_doe']['extensions_allowed']
		blacklist_files = data['print_doe']['blacklist_files']


	copy = args.number if args.number else 1
	level = args.level if args.level else 100

	for i in range(copy):

		if args.doe:
			print_dir(args.doe, 10)

		elif args.directory:# print the given directory
				print_dir(args.directory, level)

		elif args.file:# print the given file
				print_file(args.file)

		else:# print a test file
			url = "C:/Users/rousseaua/Desktop/DOE Metro Clermont/DESP/BOUTEILLES/Plan_2312066_230715.pdf"
			print_file(url)

		# display a message for copies
		n_copy = i+1
		rest_copy = copy - n_copy
		if rest_copy:
			print("End of copy n°%s (rest *%s)" % (n_copy,rest_copy ))
			os.system("pause")





if __name__ == '__main__':
	main()