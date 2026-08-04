# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="openjdk-bin 8 and 17 for old minecraft"
#HOMEPAGE="google.com"
#SRC_URI=""

#LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 arm64"

#DEPEND=""
RDEPEND="${DEPEND}
	dev-java/openjdk-bin:8
	dev-java/openjdk-bin:17
"
#BDEPEND=""
