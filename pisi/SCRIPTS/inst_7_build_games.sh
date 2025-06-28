
#!/bin/bash

# PiSi Desktop
### Install some ported or native GNUtep Games

### ENV
_PWD=`pwd`
. ./environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

APPLICATIONS=/usr/local/lib/GNUstep/Applications
GAMES=${APPLICATIONS}/Games

for DIR in ${GAMES}
do
	if ! [ -d $DIR ];then
		sudo mkdir -p $DIR
	fi
done

if ! [ -d "../build" ];then
	mkdir ../build
fi

######################################
## Chess
### Repo/release: github/gnustep/gap
######################################

function install_chess()
{
cd ../build || exit 1

if [ -d gap ];then
	cd gap
	git pull origin master
else
	git clone https://github.com/gnustep/gap.git
	cd gap
fi

cd ported-apps/Games/Chess
make clean
make
sudo cp --recursive Chess.app ${GAMES}/


cd $_PWD
}

########################################
## NeXTGo
### Repo/Release: github/gnustep/gap: ?
########################################

function install_nextgo()
{
cd ../build || exit 1

if [ -d gap ];then
        cd gap
        git pull origin master
else
        git clone https://github.com/gnustep/gap.git
        cd gap
fi

cd ported-apps/Games/NeXTGo
if [ -f configure ];then
	./configure
fi
make clean
make
sudo cp --recursive NeXTGo.app ${GAMES}/

cd $_PWD
}

######################################
## GShisen
### Repo/Release: savannah/gap: 1.3.0
######################################

function install_gshisen(){

cd ../build || exit 1

if [ -d GShisen-1.3.0 ];then
	cd GShisen-1.3.0
else
	wget http://mirror.netcologne.de/savannah/gap/GShisen-1.3.0.tar.gz
	gunzip GShisen-1.3.0.tar.gz
	tar -xvf GShisen-1.3.0.tar
	cd GShisen-1.3.0
fi

make
sudo make install
cd $_PWD
}

##################################################
## Gomoku
### Repo/Release: github/pcardona34/Gomoku: 1.2.9
##################################################

function install_gomoku(){

cd ../build || exit 1

if [ -d Gomoku ];then
	cd Gomoku
	git pull origin master
else
	git clone https://github.com/pcardona34/Gomoku.git
	cd Gomoku
fi

./configure
make
sudo cp --recursive Gomoku.app ${GAMES}/

cd $_PWD
}

##################################
## LapisPuzzle
### Repo/Release: 
function install_lapis()
{
cd ../build || exit 1

if [ -d LapisPuzzle-1.2 ];then
	cd LapisPuzzle-1.2
else
	wget http://mirror.easyname.at/nongnu/gap/LapisPuzzle-1.2.tar.gz
	gunzip LapisPuzzle-1.2.tar.gz
	tar -xvf LapisPuzzle-1.2.tar
	cd LapisPuzzle-1.2
fi

./configure
make
sudo cp --recursive LapisPuzzle.app ${GAMES}/

cd $_PWD
}

##################################

install_chess
#install_nextgo ### Not building
#install_gshisen ### Not building
install_gomoku
install_lapis

make_services
sudo ldconfig
