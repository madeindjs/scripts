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
import os, argparse
# require pywin32 (download at https://sourceforge.net/projects/pywin32/ )
import win32api, win32print



def print_file(filename, copy=1):
	"""print a file on the default printer"""
	try:
		for _ in range(copy):
			win32api.ShellExecute ( 0, "print", filename,
				# If this is None, the default printer will  be used anyway.
				'/d:"%s"' % win32print.GetDefaultPrinter (),
				".", 0 )
		print("[*] request to print %s" % filename)
	except pywintypes.error:
		print("[ ] failed to print %s (maybe a wrong url?)" % filename)




def print_dir(directory, copy=1):
	"""print all files on the default printer"""
	directory = directory.replace('\\', '/')
	# get all files in the folder
	try:
		files=[directory+"/"+file for file in os.listdir(directory) if not os.path.isdir(file)]
		print("[*] search file into %s" % directory)
		for file in files:
			print_file(file, copy)
	except FileNotFoundError:
		print("[ ] failed to find files into %s (maybe a wrong url?)" % directory)
	



def main():
	# parse arg to find file(s)
	parser = argparse.ArgumentParser()
	parser.add_argument("-f", "--file", type=str, help="print a given file")
	parser.add_argument("-d", "--directory",type=str, help="print a given directory")
	parser.add_argument("-n", "--number",type=int, help="Number of copy to print")
	args = parser.parse_args()

	copy = args.number if args.number else 1

	if args.directory:# print the given directory
		print_dir(args.directory, copy)

	elif args.file:# print the given file
		print_file(args.file, copy)

	else:# print a test file
		url = "C:/Users/rousseaua/Desktop/DOE Metro Clermont/DESP/BOUTEILLES/Plan_2312066_230715.pdf"
		print_file(url, copy)




if __name__ == '__main__':
	main()