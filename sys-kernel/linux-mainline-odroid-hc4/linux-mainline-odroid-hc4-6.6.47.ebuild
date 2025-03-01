# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="installer for precomiled linux kernel configured for laptops"
HOMEPAGE="https://github.com/adippl/gentoo-kernel-config"
[ "${PR}" != "" ] && mPR="-${PR}"
[ "${PR}" = "r0" ] && mPR=""
K_TYPE="mainline-odroid-hc4"
K_ARCH="arm64"
MIRR="http://files.acmelab.top/gentoo-kernels"
SRC_URI="${MIRR}/linux-${K_TYPE}-v${PV}.tar.xz"

S="${WORKDIR}"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="arm64"
IUSE="test-only"
RESTRICT="mirror strip"

#REQUIRED_USE=""

DEPEND="
	"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

function kw_check_stable() { return $([ "$KEYWORDS" = "amd64" ]); }
function kw_check_testing() { return $([ "$KEYWORDS" = "~amd64" ]); }

#vmlinuz_file="vmlinuz-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}"
vmlinuz_file="Image"
initramfs_file=""
sysmap_file="System.map-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}"
config_file="config-${K_ARCH}-${PV}-gentoo${mPR}-${K_TYPE}"
config_file_n="config-${PV}-gentoo${mPR}-${K_TYPE}"

src_install() {
	dodir /lib/
	dodir /boot
	cp -r "${S}/lib/modules/" "${D}/lib/modules/"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/build"
	unlink "${D}/lib/modules/${PV}-gentoo${mPR}-${K_TYPE}/source"
	#if use test-only ; then
	#	cp "${S}/boot/${vmlinuz_file}" "${D}/boot/kexec-${vmlinuz_file}"
	#	cp "${S}/boot/${initramfs_file}" "${D}/boot/kexec-${initramfs_file}"
	#else
	#	cp "${S}/boot/${vmlinuz_file}" "${D}/boot/${vmlinuz_file}"
	#	cp "${S}/boot/${initramfs_file}" "${D}/boot/${initramfs_file}"
	#fi
	cp -r "${S}/boot"        "${D}/boot"
	cp "${S}/${sysmap_file}" "${D}/boot/${sysmap_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file}"
	cp "${S}/${config_file}" "${D}/boot/${config_file_n}"
}

#pkg_postinst(){
#	if ! use test-only ; then
#		cp "${EROOT}/boot/${vmlinuz_file}" "${EROOT}/boot/kexec-vmlinuz"
#		cp "${EROOT}/boot/${initramfs_file}" "${EROOT}/boot/kexec-initramfs"
#	fi
#}

#pkg_postrm(){
#}
