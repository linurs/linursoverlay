# Copyright 2011 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header: My first ebuild learn by doing! $

DESCRIPTION="Simple tool for developing ebuilds."
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
HOMEPAGE="http://www.linurs.org"

SLOT="0"
LICENSE="as it is"
KEYWORDS="~x86"
IUSE=""

src_install () {
        exeinto /usr/bin
	doexe ebuildtool.py 
        dosym /usr/bin/ebuildtool.py /usr/bin/ebuildtool 
        #doman ebuildtool.1
        insinto /etc/ebuildtool
        doins ebuildtool_def.py
       # doins default.ebuild
}

pkg_postinst() {
	echo
        einfo "Please read and edit /etc/ebuildtool/ebuildtool_def.py"
}
