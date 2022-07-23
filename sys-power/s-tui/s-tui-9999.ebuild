# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3
#inherit python

DESCRIPTION=""
HOMEPAGE="https://github.com/amanusk/s-tui"
DESCRIPTION="CPU temperature, frequency, utilization and power monitoring"
GIT_REPO_URI="$HOMEPAGE"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="stress"

DEPEND="
	dev-python/urwid
	dev-python/psutil
	stress? ( app-benchmarks/stress )
	"
RDEPEND="${DEPEND}"
BDEPEND=""
