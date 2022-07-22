# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="xdotool type for wayland"
HOMEPAGE="https://github.com/atx/wtype"
EGIT_REPO_URL="$HOMEPAGE"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/wayland
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){
	meson_src_configure
	}
src_install(){
	meson_src_install
	}
