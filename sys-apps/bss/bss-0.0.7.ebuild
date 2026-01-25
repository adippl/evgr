# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="btrfs incremental backup utility"
HOMEPAGE="https://github.com/adippl/bss"
#SRC_URI=""

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64 arm64"
fi

inherit git-r3
EGIT_REPO_URI="https://github.com/adippl/bss"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS=""

DOCS=(
	bsstab
	)

DEPEND="
	app-shells/bash:*
	virtual/ssh
	sys-fs/btrfs-progs
	"
RDEPEND="${DEPEND}"
