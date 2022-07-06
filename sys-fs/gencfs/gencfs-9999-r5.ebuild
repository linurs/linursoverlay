# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9,10} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1 desktop

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/gencfs.git"
	inherit git-r3
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
fi

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Simple GUI for encfs"
HOMEPAGE="http://www.linurs.org"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DOCS=( README.md )

DEPEND=">=sys-fs/encfs-1.5 dev-lang/python[tk]"

python_install_all() {
	doman gencfs.1
	insinto /usr/share/gencfs
	doins favicon.ico
	doins gencfs.png
	doins favicon.gif

	dosym "${ED%}/usr/bin/gencfs.py" /usr/bin/gencfs
	doicon gencfs.png
	domenu gencfs.desktop
	distutils-r1_python_install_all
}
