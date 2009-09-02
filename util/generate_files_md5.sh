#!/bin/sh
#
rm files.md5
find . -type f | grep -v git | xargs md5 > files.md5