# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg

DESCRIPTION="A window switcher, run dialog and dmenu replacement"
HOMEPAGE="https://github.com/lbonn/rofi"
SRC_URI="https://github.com/lbonn/rofi/releases/download/${PV}%2Bwayland3/rofi-${PV}+wayland3.tar.xz"
S="${WORKDIR}"/rofi-${PV}+wayland3

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+drun +windowmode test +X +wayland"
RESTRICT="!test? ( test )"

RDEPEND="
	!x11-misc/rofi
	>=dev-libs/glib-2.40:2
	x11-libs/cairo[X]
	x11-libs/gdk-pixbuf:2
	x11-libs/pango[X]
	dev-libs/wayland
	>=dev-libs/wayland-protocols-1.17
"
DEPEND="
	${RDEPEND}
	test? ( dev-libs/check )
"
BDEPEND="
	sys-devel/bison
"

src_configure() {
	local emesonargs=(
		-Dcheck=disabled
		$(meson_feature wayland)
		$(meson_feature X xcb)
		$(meson_use drun)
		$(meson_use windowmode window)
		$(meson_feature test check)
	)
	meson_src_configure
}

#src_install() {
#
#}

pkg_postinst() {
	for v in ${REPLACING_VERSIONS}; do
		if ver_test "${v}" -lt 1.7.0; then
			elog "Rofi 1.7.0 removed the (deprecated) xresources based configuration setup."
			elog "If you are still using old configuration setup, please convert it to new format manually."
			elog "The new format configuration can be generated by 'rofi -dump-config > ~/.config/rofi/config.rasi'."
			elog "For more information, please see https://github.com/davatorium/rofi/releases/tag/1.7.0"
		fi
	done

	xdg_icon_cache_update
}
