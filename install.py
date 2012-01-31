#!/usr/bin/python
import optparse
import os
import os.path
import sys
import shutil

usage = "Install files to make $HOME a bit more like home."

home_dir =  os.getenv("HOME")
dotfiles_dir = home_dir + "/.dotfiles"
backup_dir = dotfiles_dir + "/backup"

def link_file( file ):
	link_src = home_dir + "/." + file
	link_dst = dotfiles_dir + "/" + file
	if backup_desired:
		if os.path.exists ( link_src ):
			backup_file = backup_dir + "/" + file
			shutil.move( link_src, backup_file ) 
	symlink( link_dst, link_src )


if not os.path.exists( dotfiles_dir ):
	error_msg = "Cannot install dotfiles: " + dotfiles_dir + " does not exist."
	print >> sys.stderr, error_msg
	sys.exit( 2 )

print( "Would you like to make a backup of dotfiles that will be overwritten?" )
print( "Copies will be made in: " + backup_dir )
print( "(Yes, No, Abort): " )

