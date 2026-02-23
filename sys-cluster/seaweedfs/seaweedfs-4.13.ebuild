# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION=""
HOMEPAGE="https://github.com/seaweedfs/seaweedfs"
SRC_URI=" https://github.com/seaweedfs/seaweedfs/archive/refs/tags/4.13.tar.gz -> ${P} "
SRC_URI+=" https://s3.home.acmelab.cc/evgr-distfiles/${PN}/${P}-deps.tar.xz "

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	go build
}

src_install() {
	dobin weed
	default
}
