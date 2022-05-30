# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="installer for precomiled linux kernel configured for laptops"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="x270"
RESTRICT="mirror"
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}.tar.xz"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="~amd64"
IUSE="grub-update uefi uefi-test"

REQUIRED_USE="
	^^ ( uefi uefi-test )
	"

DEPEND="
	grub-update? ( sys-boot/grub )
	uefi? ( sys-boot/efibootmgr )
	uefi-test? ( sys-boot/efibootmgr )
	"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

function kw_check_stable() { return $([ "$KEYWORDS" = "amd64" ]); }
function kw_check_testing() { return $([ "$KEYWORDS" = "~amd64" ]); }

S="${WORKDIR}"

src_install() {
	cp -r "${S}/boot/" "${D}/boot/"
	dodir /lib/
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
	if use uefi || use uefi-test ; then
		mkdir "${D}/boot/kag"
		touch "${D}/boot/kag/${PV}-gentoo${mPR}-${K_TYPE}"
	fi
#	dobin "${D}/efigen2"
}

pkg_preinst(){
	mount /boot 2>/dev/null
	#ec==32 when already mounted
	[ "$?" != "32" ] && ewarn "couldn't mount /boot"
	}
pkg_postinst(){
	if use grub-update ;then
		mount /boot 2>/dev/null
		#ec==32 when already mounted
		[ "$?" != "32" ] && ewarn "couldn't mount /boot"
		elog "updating grub config after kernel update"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
	if use uefi || use uefi-test ; then
		/usr/local/bin/efigen2
	fi
	umount /boot
	[ "$?" != "32" ] && ewarn "couldn't umount /boot"
	}

pkg_prerm(){
	mount /boot 2>/dev/null
	#ec==32 when already mounted
	["$?" != "32" ] && ewarn "couldn't umount /boot"
}
pkg_postrm(){
	if use grub-update ;then
		elog "updating grub config after kernel removal"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
	if use uefi || use uefi-test  ;then
		/usr/local/bin/efigen2
	fi
	umount /boot
	[ "$?" != "32" ] && ewarn "couldn't umount /boot"
}
