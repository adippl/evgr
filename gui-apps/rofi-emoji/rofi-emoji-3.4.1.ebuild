# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="emoji selection plugin for x11-misc/rofi"
HOMEPAGE="https://github.com/Mange/rofi-emoji"

SRC_URI="https://github.com/Mange/rofi-emoji/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="X wayland"
RESTRICT="mirror"
DOC="LICENSE README.md"

BDEPEND="
	dev-build/autoconf
	dev-build/automake
	dev-build/libtool
"
RDEPEND="
	x11-misc/rofi
	X? (
		x11-misc/xclip
		x11-misc/xdotool
		)
	wayland? (
		gui-apps/wl-clipboard
		gui-apps/wtype
		)
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}
