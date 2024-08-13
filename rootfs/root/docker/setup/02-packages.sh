#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202408131912-git
# @@Author           :  CasjaysDev
# @@Contact          :  CasjaysDev <docker-admin@casjaysdev.pro>
# @@License          :  MIT
# @@ReadME           :
# @@Copyright        :  Copyright 2023 CasjaysDev
# @@Created          :  Mon Aug 28 06:48:42 PM EDT 2023
# @@File             :  02-packages.sh
# @@Description      :  script to run packages
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck shell=bash
# shellcheck disable=SC2016
# shellcheck disable=SC2031
# shellcheck disable=SC2120
# shellcheck disable=SC2155
# shellcheck disable=SC2199
# shellcheck disable=SC2317
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
set -o pipefail
[ "$DEBUGGER" = "on" ] && echo "Enabling debugging" && set -x$DEBUGGER_OPTIONS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set env variables
exitCode=0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Predifined actions
if cd /usr/bin; then
  # python 3
  [ -f "python3" ] && ln -sf python2.7 python
  [ -f "easy_install3" ] && ln -sf easy_install-2.7 easy_install
  [ -f "python3-config" ] && ln -sf python2.7-config python-config
  [ -f "/usr/include/locale.h" ] && ln -sf /usr/include/locale.h /usr/include/xlocale.h
  [ -f "/usr/lib/python3/_manylinux.py" ] && echo "manylinux1_compatible = True" >/usr/lib/python3/_manylinux.py
  # python 2
  [ -f "python2.7" ] && ln -sf python2.7 python
  [ -f "easy_install-2.7" ] && ln -sf easy_install-2.7 easy_install
  [ -f "python2.7-config" ] && ln -sf python2.7-config python-config
  [ -f "/usr/include/locale.h" ] && ln -sf /usr/include/locale.h /usr/include/xlocale.h
  [ -f "/usr/lib/python2.7/_manylinux.py" ] && echo "manylinux1_compatible = True" >/usr/lib/python2.7/_manylinux.py
fi
if curl -sSL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py; then
  python /tmp/get-pip.py "pip < 21.0" "setuptools < 50.0" "wheel < 1.0"
  [ -f "pip3" ] && ln -sf pip3 pip
  [ -f "pip2.7" ] && ln -sf pip2.7 pip
  python -m pip install certbot
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Main script

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set the exit code
exitCode=$?
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exit $exitCode
