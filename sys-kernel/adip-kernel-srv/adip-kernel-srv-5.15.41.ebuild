# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="installer for precompiled linux kernel configured hardware servers"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="srv"
RESTRICT="mirror"
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
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

src_install() {
	#cp -r "${S}/boot/" "${D}/boot/"
	dodir /lib/
	dodir /boot
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
	cp "${S}/boot/${vmlinuz_file}" "${D}/boot/${vmlinuz_file}"
	cp "${S}/boot/${initramfs_file}" "${D}/boot/${initramfs_file}"
	cp "${S}/${sysmap_file}" "${D}/boot/${sysmap_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file}"
	config_file_n="config-${PV}-gentoo${mPR}-${K_TYPE}"
	cp "${S}/${config_file}" "${D}/boot/${config_file_n}"
}

#pkg_preinst(){
#	mount /boot ||ewarn "couldn't mount boot"
#	}
pkg_postinst(){
	if test -L "${EROOT}/boot/kexec-vmlinuz" ; then
		unlink "${EROOT}/boot/kexec-vmlinuz"
		ln -s "${vmlinuz_file}" "${EROOT}/boot/kexec-vmlinuz"
	fi
	if test -L "${EROOT}/boot/kexec-initramfs" ; then
		unlink "${EROOT}/boot/kexec-initramfs"
		ln -s "${initramfs_file}" "${EROOT}/boot/kexec-vmlinuz"
	fi
	if use grub-update ;then
#		mount /boot ||ewarn "couldn't mount boot"
		elog "updating grub config after kernel update"
		grub-mkconfig -o /boot/grub/grub.cfg
#		umount /boot
	fi
#	umount /boot
	}

#pkg_prerm(){
#	mount /boot || ewarn "couldn't umount /boot"
#	if test -d /boot/efi ;then
#		mount /boot/efi || ewarn "couldn't umount /boot/efi"
#	fi
#}
pkg_postrm(){
#	if test -d /boot/efi ;then
#		umount /boot/efi || ewarn "couldn't unmount /boot/efi"
#	fi
	if use grub-update ;then
		elog "updating grub config after kernel removal"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
#	umount /boot || ewarn "couldn't unmount /boot"
}
