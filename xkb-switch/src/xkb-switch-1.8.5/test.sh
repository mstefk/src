#!/bin/sh

set -e -x

LIB=./libxkbswitch.so
X=./xkb-switch

if ! test -f "$LIB" ; then
  echo "$LIB not found. Did you run ./test.sh from the build directory?" >&2
  exit 1
fi

if ! test -f "$X" ; then
  echo "$X not found. Did you run ./test.sh from the build directory?" >&2
  exit 1
fi

if ! which gcc ; then
  echo "GCC not found, check your environment" >&2
  exit 1
fi

if ! which vim; then
  echo "VIM is required for this test, check your environment" >&2
  exit 1
fi

if test -z "$DISPLAY" ; then
  echo "This test requires X-server connection" >&2
  exit 1
fi

if which git; then
  git status -vv
fi
setxkbmap -query
"$X" --version
"$X" --version 2>&1 | grep -q xkb-switch
"$X" --help 2>&1 | grep -q 'xkb-switch -s ARG'
test "$($X --help)" = "$($X -h)"
test "$($X --list)" = "$($X -l)"
for l in $($X --list) ; do
  "$X" -s "$l"
  "$X" -ds "$l"
  "$X" --set="$l"
  test "$($X -p)" = "$l"
done
"$X" -n
"$X" --next
! test "$X" -s fooooo

cat >/tmp/vimxkbswitch <<EOF
let g:XkbSwitchLib = "$LIB"
echo libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')
quit
EOF

STDLIB=$(gcc --print-file-name=libstdc++.so)
LD_LIBRARY_PATH="`dirname $STDLIB`:$LD_LIBRARY_PATH" \
  vim -S /tmp/vimxkbswitch

echo OK

