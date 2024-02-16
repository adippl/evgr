# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="precompiled gentoo-sources kernel and initramfs built with genkernel"
HOMEPAGE="https://github.com/adippl"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="genkernel"
RESTRICT="mirror strip"
MIRR="http://files.acmelab.top/gentoo-kernels"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}.tar.xz"

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="~amd64"
IUSE="+grub-update"

DEPEND="
	grub-update? ( sys-boot/grub )
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

vmlinuz_file="vmlinuz-x86_64-${PV}-gentoo${mPR}-${K_TYPE}"
initramfs_file="initramfs-x86_64-${PV}-gentoo${mPR}-${K_TYPE}.img"
sysmap_file="System.map-x86_64-${PV}-gentoo${mPR}-${K_TYPE}"
config_file="config-x86_64-${PV}-gentoo${mPR}-${K_TYPE}"
config_file_n="config-${PV}-gentoo${mPR}-${K_TYPE}"

src_install() {
	dodir /lib/
	dodir /boot
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
	cp "${S}/boot/${vmlinuz_file}" "${D}/boot/${vmlinuz_file}"
	cp "${S}/boot/${initramfs_file}" "${D}/boot/${initramfs_file}"
	cp "${S}/${sysmap_file}" "${D}/boot/${sysmap_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file_n}"
}

pkg_postinst(){
	#if use grub-update && [ "$EROOT" = "/" ] ;then
	if use grub-update ;then
		elog "updating grub config after kernel update"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
	}

pkg_postrm(){
	#if use grub-update && [ "$EROOT" = "/" ] ;then
	if use grub-update ;then
		elog "updating grub config after kernel removal"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
}
