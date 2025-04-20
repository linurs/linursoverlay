# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} python3_13t)
inherit distutils-r1 desktop

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/RadioFE.git"
	inherit git-r3
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
fi

DESCRIPTION="Radio Front End for mplayer"
HOMEPAGE="http://www.linurs.org"

LICENSE="GPL-2"
SLOT="0"

DOCS=( README.md )

DEPEND="
	>=media-video/mplayer-1.3.0
	>=dev-python/pillow-7.2.0
"

python_install_all() {
	doman RadioFE.1
	insinto /usr/share/RadioFE
	doins favicon.ico
	doins RadioFE.png
	doins favicon.gif
	doins default.png
	doins -r Channels

	dosym -r /usr/bin/RadioFE.py /usr/bin/RadioFE
	doicon RadioFE.png
	domenu RadioFE.desktop
	distutils-r1_python_install_all
}
