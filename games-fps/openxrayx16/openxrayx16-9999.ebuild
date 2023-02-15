# Copyright 2011-2021 Gentoo Authors
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

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="v${PVR}"
	KEYWORDS="~amd64"
fi

SLOT="0"
IUSE="clang debug gold"
RESTRICT=""
# contains all the shared libraries required by game executable
DEPEND="
	media-libs/glew
	media-libs/freeimage
	net-libs/liblockfile
	media-libs/openal
	dev-cpp/tbb
	dev-libs/crypto++
	media-libs/libtheora
	media-libs/libogg
	media-libs/libvorbis
	media-libs/libsdl2
	dev-libs/lzo
	media-libs/libjpeg-turbo
	sys-libs/readline
	dev-libs/libpcre2
	dev-libs/libpcre
	app-arch/lzop
	media-libs/libglvnd
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
		dev-cpp/tbb
		dev-libs/crypto++
		!clang? (
			>sys-devel/gcc-7.5.0
		)
		clang? (
				sys-devel/clang
		)
		gold? (
				sys-devel/binutils[gold]
		)
		"

S="${WORKDIR}"/"${PN}"-"${PV}"

src_configure() {
	mkdir "${S}"/bin
	cd "${S}"/bin
	CMARGS=" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin "
	if ! use gold ; then
		CMARGS="$CMARGS -DXRAY_USE_DEFAULT_LINKER=true "
	fi
	if use debug && use clang; then
		CC=clang CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo $CMARGS
	elif use clang; then
		CC=clang CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=Release $CMARGS
	elif use debug; then
		cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo $CMARGS
	else
		cmake .. $CMARGS
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
