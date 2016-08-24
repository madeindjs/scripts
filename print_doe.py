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
import argparse
# require pywin32 (download at https://sourceforge.net/projects/pywin32/ )
import win32api, win32print



def print_file(filename):
	"""print a file on the default printer"""
	win32api.ShellExecute ( 0, "print", filename,
		# If this is None, the default printer will  be used anyway.
		'/d:"%s"' % win32print.GetDefaultPrinter (),
		".", 0 )
	print("request to print %s" % filename)




def main():
	# parse arg to find file(s)
	parser = argparse.ArgumentParser()
	parser.add_argument("-f", "--file", help="print a given file")
	parser.add_argument("-d", "--directory", help="print a given directory")
	args = parser.parse_args()

	if args.directory:# print the given directory
		pass

	elif args.file:# print the given file
		print_file(args.file)

	else:# print a test file
		print_file("C:/Users/rousseaua/Desktop/DOE Metro Clermont/DESP/BOUTEILLES/Plan_2312066_230715.pdf")




if __name__ == '__main__':
	main()