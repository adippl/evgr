# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="emoji selection plugin for x11-misc/rofi"
HOMEPAGE="https://github.com/Mange/rofi-emoji"
EGIT_REPO_URI="$HOMEPAGE"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="amd64 arm64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="X wayland"
DOC="LICENSE README.md"

BDEPEND="
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/libtool
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
