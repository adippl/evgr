# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Python agent for provisioning and deprovisioning Bare Metal servers."

HOMEPAGE="https://github.com/adippl/bss"
#SRC_URI=""

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

PYTHON_COMPAT=( python3_{9..10} )

inherit git-r3 distutils-r1
EGIT_REPO_URI="https://opendev.org/openstack/ironic-python-agent"

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
BDEPEND=""

distutils_enable_tests pytest
