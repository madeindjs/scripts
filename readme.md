Scripts
=======

My personnally scripts to automate boring stuffs

create_project.py
-----------------

A simply script to build a skeleton of a technical project (i'm a design office assistant).

* ask the name of the new project
* build some folders
* move files into theses folder

### Use

    python create_project.py

### requirements

* [Writer](https://pypi.python.org/pypi/writer) `pip install writer`

or you can do `pip install -r requirements.txt` to install all requiremnts in once time.


### To Do

* [ ]: edit Excel file with [openpyxl](http://pypi.python.org/pypi/openpyxl) librairy


-------------------------------------------------------------------------------

print_doe.py
------------

A script to print each files in a specific folder X times on Windows. 
It can be parameter to 

* blacklist by files name or extension (like .doc, .txt, etc..)
* specify the number of copy
* specify the depth level of recursive search in folder

### Use

    python print_doe.py -d "c:\Users\rousseaua\folder"

### requirements

Need to install [pywin32](https://sourceforge.net/projects/pywin32/)