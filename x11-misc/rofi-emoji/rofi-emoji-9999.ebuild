# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3 toolchain-funcs libtool

DESCRIPTION="A window switcher, run dialog and dmenu replacement"
HOMEPAGE="https://github.com/Mange/rofi-emoji"
EGIT_REPO_URI="$HOMEPAGE"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="X wayland test"
RESTRICT="!test? ( test )"
DOC="LICENSE README.md"

BDEPEND="
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/libtool
"
RDEPEND="
	x11-misc/rofi
	X? (
		x11-misc/xsel
		x11-misc/xclip
		x11-misc/copyq
		x11-misc/xdotool
		)
	wayland? (
		gui-apps/wl-clipboard
		)
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
	test? ( >=dev-libs/check-0.11 )
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	tc-export CC
	econf
}
