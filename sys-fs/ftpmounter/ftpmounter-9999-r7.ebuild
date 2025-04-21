# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ftp file system mounter"
HOMEPAGE="http://www.linurs.org"
LICENSE="GPL-2"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} python3_13t pypy3 )

inherit distutils-r1 desktop
SLOT="0"
KEYWORDS=""

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/ftpmounter.git"
	inherit git-r3
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
fi

RDEPEND=">=net-fs/curlftpfs-0.9.2"

DOCS=( README.md )

python_install_all() {
	doman ftpmounter.1
	insinto /usr/share/ftpmounter
	doins favicon.ico
	doins ftpmounter.png
	doins favicon.gif

	doicon ftpmounter.png
	domenu ftpmounter.desktop
	distutils-r1_python_install_all
}
