# Copyright 2013 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="5"


DESCRIPTION="Simple GUI for encfs"
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
HOMEPAGE="http://www.linurs.org"

SLOT="0"
LICENSE="as it is"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-fs/encfs-1.5 dev-lang/python[tk]"

#src_prepare(){ 
# to get familiar with the ebuild variables 
 einfo "P=${P}" 
 einfo "PN=${PN}" 
 einfo "PV=${PV}" 
 einfo "PR=${PR}" 
 einfo "A=${A}" 
 einfo "D=${D}" 
 einfo "S=${S}" 
 einfo "WORKDIR=${WORKDIR}"
 einfo "FILESDIR=${FILESDIR}"
#}

src_unpack(){
   mkdir "${S}" 
   cd "${S}"
   unpack $A
}

src_install () {
        exeinto /usr/bin
	doexe gencfs.py 
        dosym /usr/bin/gencfs.py /usr/bin/gencfs 
        doman gencfs.1
}


