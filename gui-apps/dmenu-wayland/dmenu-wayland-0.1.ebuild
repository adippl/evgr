# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg

DESCRIPTION="a generic, highly customizable, and efficient menu for the Wayland desktops"
HOMEPAGE="https://github.com/nyyManni/dmenu-wayland"

if

if [ ${PVR} != "9999" ] ; then
	#EGIT_COMMIT="v${PVR}"
	SRC_URI="https://github.com/nyyManni/dmenu-wayland/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~riscv ~x86"
else
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
fi


LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	x11-libs/cairo
	x11-libs/pango
	x11-libs/libxcb
	dev-libs/glib
"

#DEPEND="${RDEPEND}
#	x11-base/xorg-proto
#"
BDEPEND="virtual/pkgconfig"

#PATCHES=(
#	"${FILESDIR}"/${PN}-5.2-gentoo.patch
#)

#src_prepare() {
#	default
#
#	sed -i \
#		-e 's|^	@|	|g' \
#		-e '/^	echo/d' \
#		Makefile || die
#
#	restore_config config.h
#}
#
#src_compile() {
#	emake CC="$(tc-getCC)" \
#		"FREETYPEINC=$( $(tc-getPKG_CONFIG) --cflags x11 fontconfig xft 2>/dev/null )" \
#		"FREETYPELIBS=$( $(tc-getPKG_CONFIG) --libs x11 fontconfig xft 2>/dev/null )" \
#		"X11INC=$( $(tc-getPKG_CONFIG) --cflags x11 2>/dev/null )" \
#		"X11LIB=$( $(tc-getPKG_CONFIG) --libs x11 2>/dev/null )" \
#		"XINERAMAFLAGS=$(
#			usex xinerama "-DXINERAMA $(
#				$(tc-getPKG_CONFIG) --cflags xinerama 2>/dev/null
#			)" ''
#		)" \
#		"XINERAMALIBS=$(
#			usex xinerama "$( $(tc-getPKG_CONFIG) --libs xinerama 2>/dev/null)" ''
#		)"
#}
#
#src_install() {
#	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
#
#	save_config config.h
#}
