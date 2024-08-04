# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Velero kubernetes backup software"
HOMEPAGE="https://velero.io/"
SRC_URI="https://github.com/vmware-tanzu/velero/releases/download/v${PV}/velero-v${PV}-linux-amd64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip mirror"

DEPEND="
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
src_install(){
	dobin "velero-v${PV}-linux-amd64/velero"
	}
