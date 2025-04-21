# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13} python3_13t)
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 desktop

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/gencfs.git"
	inherit git-r3
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
fi

DESCRIPTION="Simple GUI for encfs"
HOMEPAGE="http://www.linurs.org"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS=""

DOCS=( README.md )

DEPEND=">=sys-fs/encfs-1.5 >=dev-lang/python-3[tk]"
RDEPEND="dev-python/pylinurs"

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
