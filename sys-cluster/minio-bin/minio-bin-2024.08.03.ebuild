# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="minio clustered object storage server"
HOMEPAGE="https://min.io"
SRC_URI=""

SRC_URI="
	amd64?   ( https://dl.min.io/server/minio/release/linux-amd64/minio.RELEASE.2024-08-03T04-33-23Z -> ${PN}-amd64-${PVR} )
	arm64?   ( https://dl.min.io/server/minio/release/linux-arm64/minio.RELEASE.2024-08-03T04-33-23Z -> ${PN}-arm64-${PVR} )
"


S="${WORKDIR}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

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
	newinitd "${FILESDIR}/minio_initd" "${PN}"
	newconfd "${FILESDIR}/minio_confd" "${PN}"
	}
