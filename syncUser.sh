#!/bin/sh

if [ ! -d "./.user.js" ]; then
	echo ".user.js was not found. Did you recurse submodules?"
	exit
fi

if [ -z "./.user.js/user.js" ]; then
	echo "user.js was not found. Try running ./.user.js/updater.sh."
	exit
fi

if [ -f "./user-overrides.js" ]; then
	echo "Copying ./user-overrides.js to ./.user.js/user-overrides.js"
	cp ./user-overrides.js ./.user.js/user-overrides.js
fi

echo "Running ./.user.js/updater.sh."
./.user.js/updater.sh

if [ -z "./user.js" ]; then
	echo "Copying ./.user.js/user.js to ./user.js."
else
	echo "Overwritting ./user.js."
fi

cp ./.user.js/user.js ./user.js -f
