#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
	Writter
	==============

	a simply class used to normalize all input/output in console (like title,
	sub-title, etc..)

	author: Rousseau Alexandre

	created: 2016/06/17

"""


class Writter():
	"""a class to normalize all output in console"""
	verbose = False
	width = 80


	def printed(method):
		"""decorator to display this outpout only if verbose is True """
		def wrapper(cls, *args):
			if cls.verbose:
				print(method(cls, *args))
		print(wrapper)



	@classmethod
	def title(cls, title):
		"""print a beautiful title like this

		-------------------
		    I'm a title
		-------------------"""
		print("\r\n{line}\r\n{title}\r\n{line}\r\n".format( line=cls.line(), 
									title=Writter.center_text(title) ) )



	@classmethod
	def subtitle(cls, title):
		"""print a beautiful title like this

		I'm a sub-title
		-------------------"""
		print("{title}\r\n{line}".format( line=cls.line(),  title=title) )



	@classmethod
	def unsorted_list(cls, *args):
		"""print a beautiful list like this

		-	-   I'm
			-   an unsorted
			-   list"""
		for arg in args:
			print("\t-\t{}".format(arg))



	@classmethod
	def sorted_list(cls, *args):
		"""print a beautiful list like this

			1 - I'm
			2 - a sorted
			3 - list"""
		i = 0 
		output = str()
		for arg in args:
			print("\t{n} - {text}\r\n".format(n=i,text=arg))
			i+=1



	@classmethod
	def center_text(cls, text):
		"""print center text on cls.width"""
		len_whitespace = int((cls.width - len(text) ) /2)
		print('{white_space}{title}{white_space}'.format(
			white_space=' '*len_whitespace, title=text ) )



	@classmethod
	def line(cls):
		"""print a simply line"""
		print('-'*cls.width )



	@staticmethod
	def input(question):
		"""just format an input()"""
		print(input('{}? ...'.format(question)) )




	@staticmethod
	def ask_int(question):
		"""ask an integer, try to convert input and print it in integer"""
		output = str()
		while output.__class__ != int().__class__ :
			try:
				output = Writter.input('{} (must be an integer)'.format(question) )
				output = int(output)
			except ValueError:
				output = str()

		print(output)
			


	@printed
	@classmethod
	def event(cls, text):
		print('\r\n- {}'.format(text) )



	@printed
	@classmethod
	def sql_log(cls, sql_query, data=None):
		"""print a SQL Log"""
		# if data exists , I replace them into `complete_sql_query`
		if data:
			for key, value in data.items():
				search = ':{}'.format(key)
				replace = '`{}`'.format(value)
				sql_query = sql_query.replace(search, replace)

		print('\t{}'.format(sql_query))


