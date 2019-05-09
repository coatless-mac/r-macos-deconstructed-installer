#!/usr/bin/env bash

#
# deconstruct_pkg.sh
#
# Copyright (C) 2018 James Joseph Balamuta <balamut2@illinois.edu>
# 
# Version 1.0 -- 10/30/18
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#

################################################################

#1 Base URL (with trailing /)
#2 File name
download_file(){
	if [ -f "$2" ]; then
		echo "$2 has already been downloaded..."
	else 
		echo "Downloading file $2 ... Please be patient..."	
		# Download file into working directory
		curl -O $1$2
	fi
}

################################################################

# Variables
LIBS_URL="https://cran.r-project.org/bin/macosx/"
R_INSTALLER="R-3.6.0.pkg"

# Download to the working directory
download_file $LIBS_URL $R_INSTALLER

# Split apart the downloaded package
pkgutil --expand $R_INSTALLER r-pkg

# View information
tree r-pkg

# Create directory to store package scripts
if [[ ! -d "Scripts" ]]; then
mkdir Scripts
fi

# Copy out the R component scripts
cp r-pkg/r.pkg/Scripts/* Scripts


