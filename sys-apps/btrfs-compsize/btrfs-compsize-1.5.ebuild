# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="btrfs: find compression type/ratio on a file or set of files"
HOMEPAGE="https://github.com/kilobyte/compsize"

SRC_URI="https://github.com/kilobyte/compsize/archive/refs/tags/v${PV}.tar.gz -> btrfs-compsize-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DOC=(
	comp
	)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/compsize-${PV}"

src_install(){
	dobin compsize
	doman compsize.8
	}
