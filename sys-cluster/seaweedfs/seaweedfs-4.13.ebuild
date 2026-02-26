# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="seaweedfs distributed filesystem"
HOMEPAGE="https://github.com/seaweedfs/seaweedfs"
SRC_URI=" https://github.com/seaweedfs/seaweedfs/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.xz "
SRC_URI+=" https://s3.home.acmelab.cc/evgr-distfiles/seaweedfs/${P}-deps.tar.xz "

S="${WORKDIR}/${P}/weed"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="mirror"

DEPEND="
	"
BDEPEND="
	>dev-lang/go-1.24.9
"

RDEPEND="
	${DEPEND}
	acct-user/seaweedfs
	acct-group/seaweedfs
"

src_compile() {
	go build
}

src_install() {
	dobin weed
	default
	newinitd "${FILESDIR}/seaweedfs_initd" seaweedfs
	insinto "/etc/logrotate.d/"
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"
	keepdir /var/log/seaweedfs
}
