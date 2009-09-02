#!/bin/sh
#
find . -type f | grep -v git | xargs md5 > files.md5