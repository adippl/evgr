# Copyright 2011-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Netgear WSDD2 WSD/LLMNR Discovery/Name Service Daemon"
HOMEPAGE="https://github.com/Netgear/wsdd2"

SRC_URI="https://github.com/Netgear/wsdd2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/wsdd2-${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"
#IUSE=""

DEPEND="
	"
RDEPEND="${DEPEND}"
#BDEPEND=""

src_install(){
	dosbin wsdd2
	newinitd "${FILESDIR}/wsdd2_initd" wsdd2
	#insinto "/etc/logrotate.d/"
	#newins "${FILESDIR}/wsdd2.logrotate" "wsdd2"
	}
