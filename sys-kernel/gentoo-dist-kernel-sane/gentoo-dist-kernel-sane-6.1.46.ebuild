# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="precomiled linux kernel configured for servers running with root on NFS"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="dist"
RESTRICT="mirror strip"
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
#SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-dist.tar.xz"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-dist-dist.tar.xz"

LICENSE="GPL-2"
#SLOT="${PV}"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	cp -r "${S}/boot/" "${D}/boot/"
	dodir "/lib/modules"
	cp -r "${S}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
}
