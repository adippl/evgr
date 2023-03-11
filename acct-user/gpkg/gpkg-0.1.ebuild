# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="gpkg user for package server"
ACCT_USER_ID=920
ACCT_USER_HOME=/home/gpkg
ACCT_USER_HOME_OWNER=gpkg:root
ACCT_USER_HOME_PERMS=0500
ACCT_USER_GROUPS=( nobody )

KEYWORDS="*"

acct-user_add_deps
