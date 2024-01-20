# Copyright 2011-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="userspace tools for jool SIIT and NAT64 implementation"
HOMEPAGE="https://github.com/NICMx/Jool"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

SRC_URI="https://github.com/NICMx/Jool/releases/download/v${PV}/jool-${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror strip"
LICENSE="GPL-2"
SLOT="0"
#KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/libnl
	net-firewall/iptables
	"
RDEPEND="${DEPEND}"
BDEPEND=""
