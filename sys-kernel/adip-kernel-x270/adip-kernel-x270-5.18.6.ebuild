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

vmlinuz_file="vmlinuz-x86_64-${PV}-gentoo${mPR}-${K_TYPE}"
initramfs_file="initramfs-x86_64-${PV}-gentoo${mPR}-${K_TYPE}.img"
sysmap_file="System.map-x86_64-${PV}-gentoo${mPR}-${K_TYPE}"
config_file="config-x86_64-${PV}-gentoo${mPR}-${K_TYPE}"
config_file_n="config-${PV}-gentoo${mPR}-${K_TYPE}"

S="${WORKDIR}"

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
	if use grub-update ;then
		elog "updating grub config after kernel update"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
}

pkg_postrm(){
	if use grub-update ;then
		elog "updating grub config after kernel removal"
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
}
