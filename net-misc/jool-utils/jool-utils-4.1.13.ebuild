# Copyright 2011-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="userspace tools for jool SIIT and NAT64 implementation"
HOMEPAGE="https://github.com/NICMx/Jool"

SRC_URI="https://github.com/NICMx/Jool/releases/download/v${PV}/jool-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/jool-${PV}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
#IUSE=""

DEPEND="
	dev-libs/libnl
	net-firewall/iptables
	"
RDEPEND="${DEPEND}"
#BDEPEND=""
