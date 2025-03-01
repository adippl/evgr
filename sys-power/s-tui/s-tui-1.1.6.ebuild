# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CPU temperature, frequency, utilization and power monitoring"
HOMEPAGE="https://github.com/amanusk/s-tui"
SRC_URI="https://codeload.github.com/amanusk/s-tui/tar.gz/refs/tags/v${PV} -> ${P}.tar.gz"
LICENSE="GPL-2"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
inherit distutils-r1

if [[ ${PVR} = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
	EGIT_SUBMODULES=()
	EGIT_COMMIT="v${PVR}"
fi

SLOT="0"
KEYWORDS="amd64"
IUSE="stress"

DEPEND="
	dev-python/urwid
	dev-python/psutil
	stress? ( app-benchmarks/stress )
	"
RDEPEND="${DEPEND}"
#BDEPEND=""
