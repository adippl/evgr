# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="btrfs incremental backup utility"
HOMEPAGE="https://github.com/adippl/bss"
#SRC_URI=""

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="amd64"
fi

PYTHON_COMPAT=( python3_{9..10} )

inherit git-r3 distutils-r1
EGIT_REPO_URI="https://github.com/JunxiongGuan/nvmetcli"

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
