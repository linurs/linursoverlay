# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#PYTHON_COMPAT=( python3_{10..13} python3_13t )
PYTHON_COMPAT=( python3_{10..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Library for all sort of python code"
HOMEPAGE="https://www.linurs.org"
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
# IUSE=""

RDEPEND="dev-python/setuptools"  # Dependencies required at runtime
DEPEND="${RDEPEND}"  # Dependencies required at build time, usually the same as RDEPEND

src_install() {
	distutils-r1_src_install
}
