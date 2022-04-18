# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="btrfs: find compression type/ratio on a file or set of files"
HOMEPAGE="https://github.com/kilobyte/compsize"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="amd64"
fi

inherit git-r3
EGIT_REPO_URI="$HOMEPAGE"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DOC=(
	comp
	)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	dobin compsize
	doman compsize.8
	}
