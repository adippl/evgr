# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE="https://github.com/amanusk/s-tui"
DESCRIPTION="CPU temperature, frequency, utilization and power monitoring"
SRC_URI="https://codeload.github.com/amanusk/s-tui/tar.gz/refs/tags/v${PV} -> ${P}.tar.gz"

PYTHON_COMPAT=( python3_{9..12} )

inherit distutils-r1
#DISTUTILS_USE_PEP517="true"

if [[ ${PVR} = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
	EGIT_SUBMODULES=()
	EGIT_COMMIT="v${PVR}"
fi
KEYWORDS="amd64"

RESTRICT="mirror"

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
