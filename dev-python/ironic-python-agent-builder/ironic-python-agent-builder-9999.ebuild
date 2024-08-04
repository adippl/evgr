# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Scripts and tools to build ironic-python-agent"

HOMEPAGE="https://github.com/openstack/ironic-python-agent-builder"
#SRC_URI=""

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit git-r3 distutils-r1
EGIT_REPO_URI="https://opendev.org/openstack/ironic-python-agent-builder"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS=""

DOCS=(
	README.rst
	)

DEPEND="
	>=dev-python/pbr-2.0.0
"
RDEPEND="${DEPEND}"
#BDEPEND=""

distutils_enable_tests pytest
