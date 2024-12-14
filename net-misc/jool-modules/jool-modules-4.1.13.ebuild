# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MODULES_OPTIONAL_IUSE="module"
inherit linux-mod-r1

DESCRIPTION="kernel modules for jool SIIT and NAT64 implementation"
HOMEPAGE="https://github.com/NICMx/Jool"

SRC_URI="https://github.com/NICMx/Jool/releases/download/v${PV}/jool-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/jool-${PV}/src/mod"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+module +dist-kernel"
RESTRICT="mirror"
#IUSE="debug +module module-src"

CONFIG_CHECK="NET INET"

DEPEND="
	virtual/linux-sources
	sys-kernel/gentoo-kernel-bin:=
	=net-misc/jool-utils-${PV}
	"

MODULES_KERNEL_MAX=6.12
MODULES_KERNEL_MIN=6.1

pkg_setup() {
	if use module; then
		linux-mod-r1_pkg_setup
	fi
}

src_compile() {
	local modlist=(
		jool_common=extra:common:common
		jool=extra:nat64:nat64
		jool_siit=extra:siit:siit
		)
	#export MODULES_DIR="/lib/modules/$KV_FULL"
	#local modargs=( MODULES_DIR="${KV_OUT_DIR}" )
	local modargs=( MODULES_DIR="/lib/modules/$KV_FULL" )
	use module && linux-mod-r1_src_compile
}

src_install() {
	use module && linux-mod-r1_src_install
}

pkg_postinst() {

	if use module; then
		linux-mod-r1_pkg_postinst
	fi
}
