# Copyright 2011-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3
inherit xdg-utils

DESCRIPTION="Open-source xray engine"
HOMEPAGE="https://github.com/OpenXRay"
LICENSE="BSD"

EGIT_REPO_URI="https://github.com/OpenXRay/xray-16.git"
EGIT_BRANCH="dev"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64"
IUSE="clang debug"
RESTRICT=""
# contains all the shared libraries required by game executable
DEPEND="
		media-libs/libsdl2
		!clang? (
			>sys-devel/gcc-7.5.0:=
		)

		clang? (
				sys-devel/clang:=
		)
		app-crypt/libmd
		dev-libs/libbsd
		dev-libs/libpcre
		dev-libs/lzo
		media-libs/alsa-lib
		media-libs/flac
		media-libs/freeimage
		media-libs/libjpeg-turbo
		media-libs/libogg
		media-libs/libpng
		media-libs/libsndfile
		media-libs/libtheora
		media-libs/libvorbis
		media-libs/libwebp
		media-libs/openal
		media-libs/opus
		media-sound/pulseaudio
		net-libs/libasyncns
		net-libs/liblockfile
		sys-apps/dbus
		sys-apps/util-linux
		sys-libs/glibc
		sys-libs/zlib
		x11-libs/libICE
		x11-libs/libSM
		x11-libs/libX11
		x11-libs/libXau
		x11-libs/libXcursor
		x11-libs/libXdmcp
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXrandr
		x11-libs/libXrender
		x11-libs/libXtst
		x11-libs/libXxf86vm
		x11-libs/libxcb
		debug? (
			media-libs/libglvnd
			)

"
#RDEPEND=${DEPEND}
# 	
#	dev-libs/libpcre2
#	app-arch/lzop
#	sys-libs/readline
#
BDEPEND="
		${RDEPEND}
		dev-util/cmake
		dev-vcs/git

		media-libs/glew:*
		dev-cpp/tbb
		dev-libs/crypto++
		"

S="${WORKDIR}"/"${PN}"-"${PV}"

src_configure() {
	mkdir "${S}"/bin
	cd "${S}"/bin
	if use debug && use clang; then
		CC=clang CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	elif use clang; then
		CC=clang CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	elif use debug; then
		cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	else
		cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	fi
}

src_compile() {
	cd "${S}"/bin
	emake
}

src_install() {
	cd "${S}"/bin
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
