# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for bss backup system"
ACCT_USER_ID=456
ACCT_USER_HOME=/dev/null
ACCT_USER_GROUPS=( nobody )

KEYWORDS=""

acct-user_add_deps
