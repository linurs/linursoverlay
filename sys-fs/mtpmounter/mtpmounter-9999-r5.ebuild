# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9,10} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1 desktop

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/mtpmounter.git"
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
RDEPEND="|| ( sys-fs/jmtpfs sys-fs/mtpfs sys-fs/simple-mtpfs sys-fs/go-mtpfs )"

DOCS=( README.md )

python_install_all() {
	doman mtpmounter.1
	insinto /usr/share/mtpmounter
	doins favicon.ico
	doins mtpmounter.png
	doins favicon.gif

	dosym "${ED%}/usr/bin/mtpmounter.py" /usr/bin/mtpmounter
	doicon mtpmounter.png
	domenu mtpmounter.desktop
	distutils-r1_python_install_all
}
