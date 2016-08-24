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

import tempfile
# require pywin32 (download at https://sourceforge.net/projects/pywin32/ )
import win32api 
import win32print

filename = tempfile.mktemp (".txt")
open (filename, "w").write ("This is a test")
win32api.ShellExecute (
  0,
  "print",
  filename,
  #
  # If this is None, the default printer will
  # be used anyway.
  #
  '/d:"%s"' % win32print.GetDefaultPrinter (),
  ".",
  0
)