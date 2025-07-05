# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..14} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1

DESCRIPTION="Genservice: Simple tool for everyday emerge commands"
HOMEPAGE="https://www.linurs.org"
SRC_URI="https://www.linurs.org/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"   # do not first try to fetch from gentoo mirrors

python_install_all() {
	insinto /etc/genservice
	doins genservice/genservice_def.py
	distutils-r1_python_install_all
}

pkg_postinst() {
	echo
	einfo "Please edit /etc/genservice/genservice_def.py"
}
