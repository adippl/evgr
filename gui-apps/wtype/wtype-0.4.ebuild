# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="xdotool type for wayland"
HOMEPAGE="https://github.com/atx/wtype"
EGIT_REPO_URI="$HOMEPAGE"

SRC_URI="https://github.com/atx/wtype/archive/refs/tags/v${PV}.tar.gz -> wtype-${PV}.tar.gz"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="amd64 arm64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/wayland
	"
RDEPEND="${DEPEND}"
#BDEPEND=""
