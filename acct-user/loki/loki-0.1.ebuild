# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Loki program user"

ACCT_USER_ID=200
ACCT_USER_GROUPS=( grafana )
#KEYWORDS=" amd64 arm arm64 hppa ppc ppc64 sparc ~x86 ~alpha ~loong ~mips ~riscv ~s390 "
KEYWORDS=" amd64 arm arm64 "

acct-user_add_deps
