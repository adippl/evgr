# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="precomiled linux kernel configured for servers running with root on NFS"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="nfsboot"
RESTRICT="mirror strip"
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}.tar.xz"

LICENSE="GPL-2"
#SLOT="${PV}"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nfsboot-server"

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

	if use nfsboot-server ; then
		tftp_path="/var/tftp"
		nfs_path="/lib/net_boot"
		http_path="/var/www/files"
		dodir "${tftp_path}"
		dodir "${nfs_path}"
		dodir "${http_path}"
		cp "${S}/boot/vmlinuz-x86_64-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${tftp_path}/vmlinuz-gentoo-${K_TYPE}"
		cp "${S}/boot/initramfs-x86_64-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${tftp_path}/initramfs-gentoo-${K_TYPE}.img"
		cp "${S}/boot/vmlinuz-x86_64-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${nfs_path}/vmlinuz"
		cp "${S}/boot/initramfs-x86_64-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${nfs_path}/initramfs"
		cp "${S}/boot/vmlinuz-x86_64-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${http_path}/vmlinuz-gentoo-${K_TYPE}"
		cp "${S}/boot/initramfs-x86_64-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${http_path}/initramfs-gentoo-${K_TYPE}.img"
		rm -rf "${D}/boot"
	fi
}
