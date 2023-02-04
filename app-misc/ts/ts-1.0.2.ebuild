# Copyright 2011-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="task spooler"
HOMEPAGE="https://vicerveza.homeunix.net/~viric/soft/ts/"
LICENSE="GPL-2"

SRC_URI="https://vicerveza.homeunix.net/~viric/soft/ts/ts-${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT=""
DEPEND="
		sys-libs/glibc
"
RDEPEND=${DEPEND}

#src_install() {
#	emake install PREFIX=/usr/
#}

src_install() {
	exeinto /usr/bin
	doexe ts
	doman ts.1
	dodoc Changelog OBJECTIVES PORTABILITY PROTOCOL README TRICKS
}
