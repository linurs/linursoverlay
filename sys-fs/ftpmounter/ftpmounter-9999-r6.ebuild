# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} pypy3 )
# DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1 desktop
KEYWORDS="~amd64 ~arm64 ~x86"

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/ftpmounter.git"
	inherit git-r3
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
fi

DESCRIPTION="ftp file system mounter"
HOMEPAGE="http://www.linurs.org"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

RDEPEND=">=net-fs/curlftpfs-0.9.2"

DOCS=( README.md )

python_install_all() {
	doman ftpmounter.1
	insinto /usr/share/ftpmounter
	doins favicon.ico
	doins ftpmounter.png
	doins favicon.gif

	dosym "${ED%}/usr/bin/ftpmounter.py" /usr/bin/ftpmounter
	doicon ftpmounter.png
	domenu ftpmounter.desktop
	distutils-r1_python_install_all
}
