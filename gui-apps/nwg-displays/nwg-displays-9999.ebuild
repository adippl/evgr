# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Output management utility for sway Wayland compositor."
HOMEPAGE="https://github.com/nwg-piotr/nwg-displays"

EGIT_REPO_URI="$HOMEPAGE"
PYTHON_COMPAT=( python3_{9..10} )

inherit git-r3 distutils-r1

LICENSE="MIT"
SLOT="0"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64 ~arm64"
fi

DOCS=(
	README.md
	)

DEPEND="
	dev-python/pygobject
	x11-libs/gtk+:3
	gui-libs/gtk-layer-shell
	dev-python/python-xlib
	"
#RDEPEND="${DEPEND}"
#BDEPEND=""
