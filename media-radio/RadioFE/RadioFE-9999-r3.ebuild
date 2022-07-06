# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9,10} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1 desktop

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/RadioFE.git"
	inherit git-r3
else
	SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
fi

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Radio Front End for mplayer"
HOMEPAGE="http://www.linurs.org"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

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

	dosym "${ED%}/usr/bin/RadioFE.py" /usr/bin/RadioFE
	doicon RadioFE.png
	domenu RadioFE.desktop
	distutils-r1_python_install_all
}
