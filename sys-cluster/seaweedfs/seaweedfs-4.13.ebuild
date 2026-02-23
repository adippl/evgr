# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION=""
HOMEPAGE="https://github.com/seaweedfs/seaweedfs"
SRC_URI=" https://github.com/seaweedfs/seaweedfs/archive/refs/tags/4.13.tar.gz -> ${P} "
SRC_URI+=" https://s3.home.acmelab.cc/evgr-distfiles/seaweedfs/${P}-deps.tar.xz "

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#src_unpack() {
#	#git-r3_src_unpack
#	go-module_live_vendor # This is needed most of the time except when the source includes the vendor files too, like the lazygit project
#	default
#}

src_compile() {
	go build
}

src_install() {
	dobin weed
	default
}
