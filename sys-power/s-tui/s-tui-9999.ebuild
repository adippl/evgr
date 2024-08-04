# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="CPU temperature, frequency, utilization and power monitoring"
HOMEPAGE="https://github.com/amanusk/s-tui"
LICENSE="GPL-2"

EGIT_REPO_URI="$HOMEPAGE"
EGIT_SUBMODULES=()

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )
inherit distutils-r1

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64"
fi

SLOT="0"
IUSE="stress"

DEPEND="
	dev-python/urwid
	dev-python/psutil
	stress? ( app-benchmarks/stress )
	"
RDEPEND="${DEPEND}"
#BDEPEND=""
