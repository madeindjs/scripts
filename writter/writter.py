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
				return method(cls, *args)
		return wrapper



	@classmethod
	def title(cls, title):
		"""return a beautiful title like this

		-------------------
		    I'm a title
		-------------------"""
		return "\r\n{line}\r\n{title}\r\n{line}\r\n".format( line=cls.line(), 
									title=Writter.center_text(title) )



	@classmethod
	def subtitle(cls, title):
		"""return a beautiful title like this

		I'm a sub-title
		-------------------"""
		return "{title}\r\n{line}".format( line=cls.line(),  title=title)



	@classmethod
	def unsorted_list(cls, *args):
		"""return a beautiful list like this

		-	-   I'm
			-   an unsorted
			-   list"""
		output = str()
		for arg in args:
			output += "\t-\t{}".format(arg)
		return output



	@classmethod
	def sorted_list(cls, *args):
		"""return a beautiful list like this

			1 - I'm
			2 - a sorted
			3 - list"""
		i = 0 
		output = str()
		for arg in args:
			output += "\t{n} - {text}\r\n".format(n=i,text=arg)
			i+=1
		return output



	@classmethod
	def center_text(cls, text):
		"""return center text on cls.width"""
		len_whitespace = int((cls.width - len(text) ) /2)
		return '{white_space}{title}{white_space}'.format(
			white_space=' '*len_whitespace, title=text )



	@classmethod
	def line(cls):
		"""return a simply line"""
		return '-'*cls.width



	@staticmethod
	def input(question):
		"""just format an input()"""
		return input('{}? ...'.format(question))




	@staticmethod
	def ask_int(question):
		"""ask an integer, try to convert input and return it in integer"""
		output = str()
		while output.__class__ != int().__class__ :
			try:
				output = Writter.input('{} (must be an integer)'.format(question) )
				output = int(output)
			except ValueError:
				output = str()

		return output
			


	@printed
	@classmethod
	def event(cls, text):
		return '\r\n- {}'.format(text)



	@printed
	@classmethod
	def sql_log(cls, sql_query, data=None):
		"""return a SQL Log"""
		# if data exists , I replace them into `complete_sql_query`
		if data:
			for key, value in data.items():
				search = ':{}'.format(key)
				replace = '`{}`'.format(value)
				sql_query = sql_query.replace(search, replace)

		return '\t{}'.format(sql_query)


