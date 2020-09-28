# Copyright 2020 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="5"

PYTHON_COMPAT=( python{3_5,3_6,3_7} )
inherit distutils-r1

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
	LICENSE="GPL2"
IUSE=""

DOCS=( README.md )

DEPEND=">=media-video/mplayer-1.3.0"

python_install_all() {
  insinto /usr/share/RadioFE
  doins favicon.ico
  doins RadioFE.png
  doins favicon.gif
  doins default.png

  dosym /usr/bin/RadioFE.py /usr/bin/RadioFE 
  doicon RadioFE.png
  domenu RadioFE.desktop
  distutils-r1_python_install_all
}
