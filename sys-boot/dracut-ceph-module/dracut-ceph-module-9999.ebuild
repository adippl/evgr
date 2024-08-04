# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="dracut module allowing for booting systems from cephfs and rbd"
HOMEPAGE="https://github.com/jurashka/dracut-ceph-module"
LICENSE="GPL-3"
#SRC_URI="https://codeload.github.com/amanusk/s-tui/tar.gz/refs/tags/v${PV} -> ${P}.tar.gz"

inherit git-r3
EGIT_REPO_URI="$HOMEPAGE"

#if [[ ${PVR} = "9999" ]] ; then
#	EGIT_SUBMODULES=()
#	EGIT_COMMIT="v${PVR}"
#fi

SLOT="0"
KEYWORDS="amd64"
#IUSE=""
RESTRICT="mirror"

#	sys-cluster/ceph
DEPEND="
	sys-kernel/dracut
	"
RDEPEND="${DEPEND}"
#BDEPEND=""

src_install(){
	dodoc README.md
	dodir /usr/lib/dracut/modules.d
	mv "${S}"/usr/lib/dracut/modules.d/95ceph "${D}"/usr/lib/dracut/modules.d
	mv "${S}"/usr/lib/dracut/modules.d/95http "${D}"/usr/lib/dracut/modules.d
	mv "${S}"/usr/lib/dracut/modules.d/95rbd  "${D}"/usr/lib/dracut/modules.d
}
