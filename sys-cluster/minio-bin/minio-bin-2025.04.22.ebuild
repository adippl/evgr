# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="minio clustered object storage server"
HOMEPAGE="https://min.io"

SERVER="https://dl.min.io/server/minio/release"
RELEASE="2025-04-22T22-12-26Z"
SRC_URI="
	amd64?   ( "${SERVER}/linux-amd64/archive/minio.RELEASE.${RELEASE}" -> ${PN}-amd64-${PVR} )
	arm64?   ( "${SERVER}/linux-arm64/archive/minio.RELEASE.${RELEASE}" -> ${PN}-arm64-${PVR} )
"

S="${WORKDIR}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm64"

#DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
#BDEPEND=""

src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/minio
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
	dobin minio
	newinitd "${FILESDIR}/minio_initd" minio
	newconfd "${FILESDIR}/minio_confd" minio
	}
