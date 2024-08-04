# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit fcaps meson git-r3

DESCRIPTION="generates a status bar for dzen2, xmobar or similar"
HOMEPAGE="https://i3wm.org/i3status/"
#SRC_URI="https://i3wm.org/${PN}/${P}.tar.xz"

#EGIT_REPO_URI="https://github.com/i3/i3status"
#EGIT_BRANCH="master"
#EGIT_COMMIT="${PVR}"
EGIT_REPO_URI="https://github.com/adippl/i3status"
EGIT_BRANCH="2.14-battery_idle_fix"
EGIT_COMMIT="8962bbe12e088251b1cd6573a6ace599e3fa0fd7"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64"
IUSE="pulseaudio"

BDEPEND="virtual/pkgconfig"
RDEPEND="
	>=dev-libs/yajl-2.0.2
	dev-libs/confuse:=
	dev-libs/libnl:3
	media-libs/alsa-lib
	pulseaudio? ( || ( media-sound/pulseaudio-daemon media-sound/apulse[sdk] ) )
"

DEPEND="
	${RDEPEND}
	app-text/asciidoc
	app-text/xmlto
"

PATCHES=(
)

src_configure() {
	local emesonargs=(
		$(meson_use pulseaudio pulseaudio)
	)
	meson_src_configure
}

pkg_postinst() {
	fcaps cap_net_admin usr/bin/${PN}

	elog "${PN} can be used with any of the following programs:"
	elog "   i3bar (x11-wm/i3)"
	elog "   x11-misc/xmobar"
	elog "   x11-misc/dzen"
	elog "Please refer to manual: man ${PN}"
}
