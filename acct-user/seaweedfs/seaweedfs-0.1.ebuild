# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="seaweedfs server user"
ACCT_USER_ID=421
ACCT_USER_GROUPS=( seaweedfs )

ACCT_USER_HOME="/var/lib/seaweedfs"
ACCT_USER_HOME_OWNER="seaweedfs:seaweedfs"
ACCT_USER_HOME_PERMS="0750"

acct-user_add_deps
