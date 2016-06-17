#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import shutil
import time



if __name__ == '__main__': 


	terminal_width = 80

	def print_line():
		print('_'*terminal_width)




	print_title('create a new template of project')


	# project_dir = os.getcwd() + '/' + project_name
	ressour_dir = 'C:/Users/rousseaua/! Ressources'

	print('Projects types available')
	type_projets = [ 'Maroc' , 'Metro' , 'Stations' ,'Autres projets']

	n_boucle = 0
	for type_projet in type_projets:
		print( "\t{} # {}".format(n_boucle, type_projet))
		n_boucle += 1

	input_int =  int(input("which type? "))

	os.chdir('C:/Users/rousseaua/! Projets/{}'.format(type_projets[input_int]))

	if input_int == 0:
		dirs = os.listdir('.')

		o_boucle=0
		for di in dirs:
			print( '    '+str(o_boucle) +'  #  '+ di )
			o_boucle += 1

		input_int =  int(input("which brand? "))
		os.chdir('./'+dirs[input_int])
		

	year = time.strftime('%Y', time.localtime())

	if not os.path.exists( './'+year ):
		os.mkdir (year)

	os.chdir('./'+year)


	project_name =  input("Project name? ")
	project_dir = './'+project_name

	if os.path.exists(project_dir):
		print('project name already exist')
		pass
	else:
		# build all folders
		for folder_to_build in ['', 'plan DWG', '/plan PDF', '/devis', '/bilan & sélection' ]:
			os.mkdir ('{}/{}'.format(project_dir, folder_to_build))

		src = ressour_dir+"/Calculs/Bilan et DANFOSS 2014.xlsx"
		dest = project_dir + '/bilan & sélection/--'+project_name+'- Bilan et DANFOSS.xlsx'
		shutil.copy( src , dest )   
		os.mkdir (project_dir + '/LDS')
		# import fond LDS
		src = ressour_dir+"/LDS/fondLDS.xcf"
		dest = project_dir + '/LDS/--'+project_name+'- fondLDS.xcf'
		shutil.copy( src , dest )
		#import defrost
		src = ressour_dir+"/Calculs/Dégivrages automatisé 2014.xlsx"
		dest = project_dir + '/LDS/--'+project_name+'- dégivrages.xlsx'
		shutil.copy( src , dest )
		print('***completed***')

