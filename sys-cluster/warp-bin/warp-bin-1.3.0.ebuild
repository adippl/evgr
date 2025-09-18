# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="minio warp s3 benchmarking tool"
HOMEPAGE="https://github.com/minio/warp"

SRC_URI="
	amd64?   ( "https://github.com/minio/warp/releases/download/v${PV}/warp_Linux_x86_64.tar.gz" -> ${PN}-amd64-${PVR} )
	arm64?   ( "https://github.com/minio/warp/releases/download/v${PV}/warp_Linux_arm64.tar.gz" -> ${PN}-arm64-${PVR} )
"

S="${WORKDIR}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

#DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
#BDEPEND=""

src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/warp
	}
src_prepare(){
	eapply_user
	true
	}
src_configure(){
	true
	}
src_compile(){
	true
	}
src_install(){
	dobin warp
	}
