# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="btrfs incremental backup utility"
HOMEPAGE="https://github.com/JunxiongGuan/nvmetcli"
LICENSE="GPL-2"
SLOT="0"

if [[ ${PVR} = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
	EGIT_COMMIT="v${PVR}"
else
	SRC_URI="https://github.com/JunxiongGuan/nvmetcli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi
KEYWORDS="amd64"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )
inherit distutils-r1

RESTRICT="mirror"

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

distutils_enable_tests pytest
