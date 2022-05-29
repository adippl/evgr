# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="precomiled linux kernel configured for servers running with root on NFS"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
K_TYPE="dist"
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
	dodir "/lib/modules"
	cp -r "${S}/lib/modules/${PV}-gentoo${mPR}-${k_TYPE}" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${k_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${k_TYPE}/source"
	if use nfsboot-server ; then
		tftp_path="/var/tftp"
		nfs_path="/lib/net_boot"
		http_path="/var/www/files"
		kfile="vmlinuz-gentoo-${K_TYPE}-nfs"
		initfile="initramfs-gentoo-${K_TYPE}-nfs.img"
		dodir "${tftp_path}"
		dodir "${nfs_path}"
		dodir "${http_path}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${tftp_path}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${tftp_path}/${initfile}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${nfs_path}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${nfs_path}/${initfile}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${http_path}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${http_path}/${initfile}"
		rm -rf "${D}/boot"
	fi
}
