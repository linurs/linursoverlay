# Copyright 2019 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="5"

PYTHON_COMPAT=( python{3_5,3_6} )
inherit distutils-r1


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
LICENSE="GPL2"
IUSE=""

DOCS=( README.md )

python_install_all() {
  doman mtpmounter.1
  insinto /usr/share/mtpmounter
  doins favicon.ico
  doins mtpmounter.png
  doins favicon.gif

  dosym /usr/bin/mtpmounter.py /usr/bin/mtpmounter 
  doicon mtpmounter.png
  domenu mtpmounter.desktop
  distutils-r1_python_install_all
}
