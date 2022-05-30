# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="installer for precompiled linux kernel configured for KVM virtual machines"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="kvm"
RESTRICT="mirror"
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}.tar.xz"

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="amd64"
IUSE="grub-update"

DEPEND="
	grub-update? ( sys-boot/grub )
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	cp -r "${S}/boot/" "${D}/boot/"
	dodir /lib/
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
}

pkg_preinst(){
	mount /boot ||ewarn "couldn't mount boot"
	}
pkg_postinst(){
	if use grub-update ;then
		mount /boot ||ewarn "couldn't mount boot"
		elog "updating grub config after kernel update"
		grub-mkconfig -o /boot/grub/grub.cfg
		umount /boot
	fi

	umount /boot
	}

pkg_prerm(){
	mount /boot || ewarn "couldn't umount /boot"
	if test -d /boot/efi ;then
		mount /boot/efi || ewarn "couldn't umount /boot/efi"
	fi
}
pkg_postrm(){
	if test -d /boot/efi ;then
		umount /boot/efi || ewarn "couldn't unmount /boot/efi"
	fi
	if use grub-update ;then
		elog "updating grub config after kernel removal"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
	umount /boot || ewarn "couldn't unmount /boot"
}
