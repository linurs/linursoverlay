# Copyright 2019 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="5"

PYTHON_COMPAT=( python{3_5,3_6,3_7} )
inherit distutils-r1


if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/linurs/gencfs.git"
	inherit git-r3
	KEYWORDS=""
else
        SRC_URI="http://www.linurs.org/download/${P}.tar.gz"	
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Simple GUI for encfs"
HOMEPAGE="http://www.linurs.org"
SLOT="0"
LICENSE="GPL2"
IUSE=""

DOCS=( README.md )

DEPEND=">=sys-fs/encfs-1.5 dev-lang/python[tk]"

python_install_all() {
  doman gencfs.1
  insinto /usr/share/gencfs
  doins favicon.ico
  doins gencfs.png
  doins favicon.gif

  dosym /usr/bin/gencfs.py /usr/bin/gencfs 
  doicon gencfs.png
  domenu gencfs.desktop
  distutils-r1_python_install_all
}





