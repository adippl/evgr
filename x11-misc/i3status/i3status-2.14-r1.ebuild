# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fcaps meson

DESCRIPTION="Generates a status bar for dzen2, xmobar or similar"
HOMEPAGE="https://i3wm.org/i3status/"
SRC_URI="https://i3wm.org/${PN}/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
#KEYWORDS="amd64 ~arm ~arm64 ~riscv x86"
KEYWORDS="amd64 arm64"
IUSE="pulseaudio"

BDEPEND="virtual/pkgconfig"
RDEPEND="
	>=dev-libs/yajl-2.0.2
	dev-libs/confuse:=
	dev-libs/libnl:3
	media-libs/alsa-lib
	pulseaudio? ( || ( media-libs/libpulse media-sound/apulse[sdk] ) )
"

DEPEND="${RDEPEND}
	app-text/asciidoc
	app-text/xmlto
"

PATCH=(
	"${FILESDIR}/i3status-3.14-r1-battery-idle-fix.patch"
)

src_prepare() {
	default

	# Needs an ALSA master device, bug #840622
	# Also skipped in CI:
	# https://github.com/i3/i3status/blob/07ad5aef2deea1f10eb6c544593e7a87205f24f8/.github/workflows/main.yml#L34
	rm -rf testcases/020-percentliteral-volume || die
}

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
