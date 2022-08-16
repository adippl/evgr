# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_PV=$(ver_rs 2 -)
MY_PN="u-boot"
MY_P="${MY_PN}-v${MY_PV}"

DESCRIPTION="U-boot"
HOMEPAGE="https://www.denx.de/wiki/U-Boot"
SRC_URI="https://gitlab.denx.de/${MY_PN}/${MY_PN}/-/archive/v${MY_PV}/${MY_PN}-v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* arm64"

DEPEND="
	sys-apps/dtc
	sys-firmware/trusted-firmware-a
"
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/${MY_P}"
PATCHES=(
	#"${FILESDIR}/0001-Add-regulator-needed-for-usage-of-USB.patch"
	#"${FILESDIR}/0002-Correct-boot-order-to-be-USB-SD-eMMC.patch"
	#"${FILESDIR}/0003-Enable-the-power-LED-during-early-startup.patch"
)

src_configure() {
	emake pinebook-pro-rk3399_defconfig
}

src_compile() {
	emake BL31=/usr/share/trusted-firmware-a/rk3399/bl31.elf
}

src_install() {
	insinto /usr/share/u-boot
	doins idbloader.img
	doins u-boot.itb
}

pkg_postinst() {
	elog "To install U-boot:"
	elog "Determine your device, then"
	elog "if=/usr/share/u-boot/idbloader.img of=/dev/... seek=64 conv=notrunc"
	elog "if=/usr/share/u-boot/u-boot.itb of=/dev/... seek=16384 conv=notrunc"
}
