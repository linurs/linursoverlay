# Copyright 2014 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

DESCRIPTION="Tool to read out an energy meter"
SRC_URI="http://www.linurs.org/electronics/download/${P}.tar.gz"
HOMEPAGE="http://www.linurs.org"

SLOT="0"
LICENSE="as it is"
KEYWORDS="~x86"
IUSE=""

src_install () {
    exeinto /usr/bin
    doexe readmeter.py 
    dosym /usr/bin/readmeter.py /usr/bin/readmeter 
    doman readmeter.1    
}