# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1 desktop

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/ftpmounter.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="mtpfs mounter"
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
