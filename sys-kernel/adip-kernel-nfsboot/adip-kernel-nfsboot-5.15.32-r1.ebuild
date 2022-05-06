# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="precomiled linux kernel configured for servers running with root on NFS"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
SRC_URI="https://github.com/adippl/gentoo-kernel-config/raw/master/linux-${PV}-gentoo${mPR}-nfsboot.tar.xz"

LICENSE="GPL-2"
#SLOT="${PV}"
SLOT="0"
KEYWORDS="amd64"
IUSE="nfsboot-client nfsboot-server"

DEPEND="
	"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="strip"

S="${WORKDIR}"

src_install() {
	cp -r "${S}/boot/" "${D}/boot/"
	dodir "/lib/modules"
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-nfsboot/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-nfsboot/source"

	if use nfsboot-server ; then
		dodir "/var/tftp"
#		dodir "/lib/modules"
		dodir "/lib/net_boot"
		cp "${S}/boot/vmlinuz-x86_64-${PV}-gentoo${mPR}-nfsboot" "${D}/var/tftp/vmlinuz-gentoo-nfsboot"
		cp "${S}/boot/initramfs-x86_64-${PV}-gentoo${mPR}-nfsboot.img" "${D}/var/tftp/initramfs-gentoo-nfsboot.img"
		cp "${S}/boot/vmlinuz-x86_64-${PV}-gentoo${mPR}-nfsboot" "${D}/lib/net_boot/vmlinuz"
		cp "${S}/boot/initramfs-x86_64-${PV}-gentoo${mPR}-nfsboot.img" "${D}/lib/net_boot/initramfs"
		rm -rf "${D}/boot"
	fi
}

#pkg_preinst(){
#	mount /boot
#	}
#pkg_postinst(){
#	if use grub-update ;then
#		mount /boot ||ewarn "couldn't mount boot"
#		elog "updating grub config after kernel update"
#		grub-mkconfig -o /boot/grub/grub.cfg
#		umount /boot
#	fi
#
#	umount /boot
#	}
#
#pkg_prerm(){
#	mount /boot || ewarn "couldn't umount /boot"
#	if use uefi || use uefi-test ;then
#		mount /boot/efi || ewarn "couldn't umount /boot/efi"
#	fi
#}
#pkg_postrm(){
#	if use uefi || use uefi-test ;then
#		umount /boot/efi || ewarn "couldn't unmount /boot/efi"
#	fi
#	if use grub-update ;then
#		elog "updating grub config after kernel removal"
#		grub-mkconfig -o /boot/grub/grub.cfg
#	fi
#	umount /boot || ewarn "couldn't unmount /boot"
#}