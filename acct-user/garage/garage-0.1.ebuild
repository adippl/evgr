# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="garage s3 server user"
ACCT_USER_ID=420
ACCT_USER_GROUPS=( garage )

acct-user_add_deps
