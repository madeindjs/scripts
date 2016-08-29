#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
	create_project
	==============

	a simply script to build a skeleton of a Carrier project

	author: Rousseau Alexandre

	created: 2016/02/23
	updated: 2016/08/29

"""



import os
import shutil
import time

from writer import Writer


if __name__ == '__main__': 

	types_projets = []
	folder_to_build = []
	ressour_dir = str()


	Writer.title('create a new template of project')

	# load settings
	with open('settings.json') as data_file:    
		data = json.load(data_file)
		global types_projets
		global ressour_dir
		global folder_to_build
		types_projets 	= data['create_project']['types_projets']
		folder_to_build = data['create_project']['folder_to_build']
		ressour_dir 	= data['create_project']['ressour_dir'][0]

	# ask a type of project and move into this folder
	Writer.subtitle('Chose a type of project')
	Writer.sorted_list( *types_projets )
	input_int = Writer.ask_int( 'Which type' )
	os.chdir('C:/Users/rousseaua/! Projets/TEC/{}'.format(types_projets[input_int]))

	# if it's a Marocco project, I ask wich brand it is
	if input_int == 0: 
		dirs = os.listdir('.')
		Writer.sorted_list( *dirs )
		input_int =  Writer.ask_int( 'Which brand' )
		os.chdir('./'+dirs[input_int])
		
	# move into ./2016 folder or create it 
	current_year = time.strftime('%Y', time.localtime())
	path_year = './{}'.format(current_year)
	if not os.path.exists( path_year ):
		os.mkdir (current_year)
	os.chdir( path_year )

	# ask a name for this project & create a new folder
	project_name = Writer.input('Project name')
	project_dir = './{}'.format( project_name )


	if os.path.exists(project_dir):
		print('project name already exist')

	else:
		# build all folders
		for folder_to_build in ['', 'plan DWG', 'plan PDF', 'devis', 'bilan & sélection', 'LDS' ]:
			os.mkdir ('{}/{}'.format(project_dir, folder_to_build))

		# copy files into the folder
		files_to_copy = dict()

		files_to_copy['{}/Calculs/Bilan et DANFOSS 2014.xlsx'.format(ressour_dir)] = \
			'{}/bilan & sélection/--{}- Bilan et DANFOSS.xlsx'.format(project_dir, project_name)

		files_to_copy['{}/LDS/fondLDS.xcf'.format(ressour_dir)] = \
			'{}/LDS/--{}- fondLDS.xcf'.format(project_dir, project_name)

		files_to_copy['{}/Calculs/Dégivrages automatisé 2014.xlsx'.format(ressour_dir)] = \
			'{}/LDS/--{}- dégivrages.xlsx'.format(project_dir, project_name)

		for src, dest in files_to_copy.items():
			shutil.copy( src , dest )


		print('***completed***')

