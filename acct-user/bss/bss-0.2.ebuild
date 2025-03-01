# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for bss backup system"
ACCT_USER_ID=456
ACCT_USER_HOME=/home/bss
ACCT_USER_SHELL=/bin/bash
ACCT_USER_HOME_OWNER=bss:root
ACCT_USER_HOME_PERMS=0550
ACCT_USER_GROUPS=( nobody )
KEYWORDS=" amd64 arm arm64 "

acct-user_add_deps
