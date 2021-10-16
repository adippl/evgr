# Copyright 2011-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="task spooler"
HOMEPAGE="https://github.com/OpenXRay"
LICENSE="GPL-2"

SRC_URI="https://vicerveza.homeunix.net/~viric/soft/ts/ts-1.0.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT=""
DEPEND="
		sys-libs/glibc
"
RDEPEND=${DEPEND}

#src_configure() {
#}

src_compile() {
	#echo ${WORKDIR}
	#cd ${WORKDIR}/ts-1.0
	#ls
	emake
}

src_install() {
	#cd ${WORKDIR}/ts-1.0
	emake install PREFIX=/usr/local/
}
