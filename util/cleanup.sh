#!/bin/sh
#
echo -n "Removing ~ files... "
find . -name "*~" -exec rm {} \;
echo "done"