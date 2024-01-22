# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="precomiled linux kernel configured for servers running with root on NFS or ceph"
HOMEPAGE="https://github.com/adippl/"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="dist"
RESTRICT="mirror strip"
MIRR="http://files.acmelab.top/gentoo-kernels"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}-netboot.tar.xz"

LICENSE="GPL-2"
#SLOT="${PV}"
SLOT="0"
KEYWORDS=""
IUSE="+netboot-server"

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
	if use netboot-server ; then
		tftp_path="/var/tftp"
		nfs_path="/lib/net_boot"
		cephfs_path="/var/cephfs"
		cephfs_path_modules="/var/cephfs/modules"
		cephfs_path_boot="/var/cephfs/boot"
		http_path="/var/www/files"
		kfile="vmlinuz-gentoo-${K_TYPE}-net"
		initfile="initramfs-gentoo-${K_TYPE}-net.img"
		kfile="vmlinuz-gentoo-${K_TYPE}-net"
		sysmap_file="System.map-${PV}-gentoo${mPR}-${K_TYPE}"
		config_file="config-${PV}-gentoo${mPR}-${K_TYPE}"
		dodir "${tftp_path}"
		dodir "${nfs_path}"
		dodir "${cephfs_path}"
		dodir "${http_path}"
		dodir "${cephfs_path}"
		dodir "${cephfs_path_modules}"
		dodir "${cephfs_path_boot}"
		cp -r "${S}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}" "${D}/${cephfs_path_modules}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${tftp_path}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${tftp_path}/${initfile}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${nfs_path}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${nfs_path}/${initfile}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${cephfs_path_boot}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${cephfs_path_boot}/${initfile}"
		cp "${S}/boot/vmlinuz-${PV}-gentoo${mPR}-${K_TYPE}" "${D}${http_path}/${kfile}"
		cp "${S}/boot/initramfs-${PV}-gentoo${mPR}-${K_TYPE}.img" "${D}${http_path}/${initfile}"
		cp "${S}/boot/${sysmap_file}" "${D}${nfs_path}/${sysmap_file}"
		cp "${S}/boot/${config_file}" "${D}${nfs_path}/${config_file}"
		cp "${S}/boot/${sysmap_file}" "${D}${cephfs_path_boot}/${sysmap_file}"
		cp "${S}/boot/${config_file}" "${D}${cephfs_path_boot}/${config_file}"
		rm -rf "${D}/boot"
	fi
}
