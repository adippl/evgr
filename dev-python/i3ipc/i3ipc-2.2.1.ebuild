# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An improved Python library to control i3wm and sway."
HOMEPAGE="https://github.com/altdesktop/i3ipc-python"

EGIT_REPO_URI="$HOMEPAGE"
PYTHON_COMPAT=( python3_{9..10} )

inherit git-r3 distutils-r1

LICENSE="BSD"
SLOT="0"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64 ~arm64"
fi

DOCS=(
	README.rst
	)

DEPEND="
	dev-python/pygobject
	x11-libs/gtk+:3
	gui-libs/gtk-layer-shell
	"
#RDEPEND="${DEPEND}"
#BDEPEND=""
