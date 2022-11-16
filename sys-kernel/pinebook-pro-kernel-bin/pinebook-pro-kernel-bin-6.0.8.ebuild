# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="installer for precomiled linux kernel configured for laptops"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="pinebook-pro"
K_ARCH="arm64"
RESTRICT="mirror strip"
#MIRR="https://github.com/adippl/gentoo-kernel-config/raw/master"
MIRR="http://files.acmelab.top/kernels"
#SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}.tar.zstd"
SRC_URI="${MIRR}/linux-${PV}-gentoo${mPR}-${K_TYPE}.tar.xz"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="~arm64"
IUSE="test-only"

REQUIRED_USE=""

DEPEND="
	sys-boot/u-boot-pinebook-pro
	"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

function kw_check_stable() { return $([ "$KEYWORDS" = "amd64" ]); }
function kw_check_testing() { return $([ "$KEYWORDS" = "~amd64" ]); }

vmlinuz_file="vmlinuz-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}"
initramfs_file="initramfs-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}.img"
sysmap_file="System.map-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}"
config_file="config-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}"
config_file_n="config-${PV}-gentoo${mPR}-${K_TYPE}"

S="${WORKDIR}"

src_install() {
	dodir /lib/
	dodir /boot
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
	if use test-only ; then
		cp "${S}/boot/${vmlinuz_file}" "${D}/boot/kexec-vmlinuz"
		cp "${S}/boot/${initramfs_file}" "${D}/boot/kexec-initramfs"
	else
		cp "${S}/boot/${vmlinuz_file}" "${D}/boot/vmlinuz"
		cp "${S}/boot/${initramfs_file}" "${D}/boot/initramfs"
	fi
	cp "${S}/${sysmap_file}" "${D}/boot/${sysmap_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file_n}"
}

pkg_postinst(){
	if ! use test-only ; then
		cp "${EROOT}/boot/${vmlinuz_file}" "${EROOT}/boot/kexec-vmlinuz"
		cp "${EROOT}/boot/${initramfs_file}" "${EROOT}/boot/kexec-initramfs"
	fi
}

#pkg_postrm(){
#}
