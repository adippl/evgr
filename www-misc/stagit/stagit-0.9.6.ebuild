# Copyright 2011-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="static site generator for git"
HOMEPAGE="https://codemadness.org/stagit.html"
SRC_URI=""

inherit git-r3
EGIT_REPO_URI="git://git.codemadness.org/stagit"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="dev-libs/libgit2"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(
	README
	example_create.sh
	example_post-receive.sh
	favicon.png
	logo.png
	)

src_install(){
	dobin stagit
	dobin stagit-index
	einstalldocs
	}
