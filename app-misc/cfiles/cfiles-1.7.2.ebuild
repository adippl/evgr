# Copyright 2011-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ranger inspired file manager written in C"
HOMEPAGE="https://github.com/mananapr/cfiles"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="fzf img-view mediainfo atool pdf"

DEPEND="
	www-client/w3m
	sys-libs/ncurses
	fzf? ( app-shells/fzf )
	img-view? ( www-client/w3m[imlib] )
	mediainfo? ( media-video/mediainfo )
	atool? ( app-arch/atool )
	pdf? ( app-text/poppler ) "
RDEPEND="${DEPEND}"
BDEPEND=""
