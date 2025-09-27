# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..14} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1

DESCRIPTION="gui for gocryptfs"
HOMEPAGE="https://www.linurs.org"
SRC_URI="https://www.linurs.org/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror"   # do not try to fetch from gentoo mirrors

DEPEND="
		dev-python/pexpect
		app-crypt/gocryptfs
"
RDEPEND="${DEPEND}"


python_install_all() {
	distutils-r1_python_install_all
}
