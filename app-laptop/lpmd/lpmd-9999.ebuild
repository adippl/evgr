# Copyright 2011-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="lpmd small power management daemon for linux laptops"
HOMEPAGE="https://github.com/adippl/lpmd"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

inherit git-r3
EGIT_REPO_URI="https://github.com/adippl/lpmd"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
