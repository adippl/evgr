# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/amanusk/s-tui"
DESCRIPTION="CPU temperature, frequency, utilization and power monitoring"
EGIT_REPO_URI="$HOMEPAGE"
EGIT_SUBMODULES=()

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1
#DISTUTILS_USE_PEP517="true"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="stress"

DEPEND="
	dev-python/urwid
	dev-python/psutil
	stress? ( app-benchmarks/stress )
	"
RDEPEND="${DEPEND}"
BDEPEND=""
