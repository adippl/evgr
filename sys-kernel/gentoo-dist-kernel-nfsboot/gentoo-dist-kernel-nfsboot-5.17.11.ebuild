# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="precomiled linux kernel configured for servers running with root on NFS"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
#SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-nfsboot.tar.xz"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-dist-nfsboot.tar.xz"

LICENSE="GPL-2"
#SLOT="${PV}"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nfsboot-server"

DEPEND="
	"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="strip"

S="${WORKDIR}"

#LINUX vmlinuz-dist-nfs
#APPEND initramfs-nfs-only.img 

src_install() {
	cp -r "${S}/boot/" "${D}/boot/"
	#dodir "/lib/modules"
	#cp -r "${S}/lib/modules/${PV}-gentoo${mPR}-nfsboot" "${D}/lib/modules/"
	dodir "/lib"
	cp -r "${S}/lib/modules" "${D}/lib/"
	unlink "${D}/lib/modules/${PV}-gentoo-dist/build"
	unlink "${D}/lib/modules/${PV}-gentoo-dist/source"

	if use nfsboot-server ; then
		dodir "/var/tftp"
		dodir "/lib/net_boot"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-dist" "${D}/var/tftp/vmlinuz-dist-nfs"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-dist.img" "${D}/var/tftp/initramfs-nfs-only.img"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-dist" "${D}/lib/net_boot/vmlinuz-dist-nfs"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-dist.img" "${D}/lib/net_boot/initramfs-nfs-only.img"
		rm -rf "${D}/boot"
	fi
}
