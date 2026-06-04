# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="garage distributed storage"
HOMEPAGE="https://garagehq.deuxfleurs.fr"

BASE_URL="https://garagehq.deuxfleurs.fr/_releases"

SRC_URI="
	amd64?   ( "${BASE_URL}/v${PV}/x86_64-unknown-linux-musl/garage"       -> ${PN}-amd64-${PVR} )
	x86?     ( "${BASE_URL}/v${PV}/i686-unknown-linux-musl/garage"         -> ${PN}-x86-${PVR} )
	arm64?   ( "${BASE_URL}/v${PV}/aarch64-unknown-linux-musl/garage"      -> ${PN}-arm64-${PVR} )
	arm?     ( "${BASE_URL}/v${PV}/armv6l-unknown-linux-musleabihf/garage" -> ${PN}-arm-${PVR} )
"

S="${WORKDIR}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=" ~amd64 ~arm ~arm64 ~x86 "

DEPEND="!sys-cluster/garage"
#BDEPEND=""
RDEPEND="
	${DEPEND}
	acct-user/garage
	acct-group/garage
"
RESTRICT="strip mirror"

src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/garage
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
	dobin garage
	newinitd "${FILESDIR}/garage_initd_r3" garage
	insinto "/etc/logrotate.d/"
	newins "${FILESDIR}/garage.logrotate" "garage"
	}
