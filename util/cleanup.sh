#!/bin/sh
#
echo "Removing ~ files... "
find . -name "*~" -exec rm {} \;
echo "done"