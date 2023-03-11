# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="btrfs incremental backup utility"
HOMEPAGE="https://github.com/JunxiongGuan/nvmetcli"

if [[ ${PVR} = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
	EGIT_COMMIT="v${PVR}"
else
	SRC_URI="https://github.com/JunxiongGuan/nvmetcli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi
KEYWORDS=""

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS=""

DOCS=(
	README
	nvmet.service
	fc.json
	loop.json
	rdma.json
	)

DEPEND="
	dev-python/configshell-fb
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
