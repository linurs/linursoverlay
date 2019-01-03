# Copyright 2019 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="5"

PYTHON_COMPAT=( python{3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Simple GUI for encfs"
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
HOMEPAGE="http://www.linurs.org"

SLOT="0"
LICENSE="as it is"
KEYWORDS="~x86"
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

pkg_postinst() {
  elog
  elog "done"
  elog
}




