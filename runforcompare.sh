#!/bin/sh
gecko=../gecko-dev
objdir=$(cd "${gecko}"; ./mach environment | sed '/config topobjdir/,+1 !d' | tail -1)
bin="${objdir}/dist/bin"
branch=$(cd "${gecko}"; git branch | grep '*' | cut -c 3- -)
echo $objdir $bin $branch
exec $bin/run-mozilla.sh $bin/xpcshell getXHRSSLStatus.js domains.txt domains.$branch.errors domains.$branch.ev > domains.$branch.log 2>&1
