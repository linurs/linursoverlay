# Copyright 2020 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils fdo-mime gnome2-utils
DESCRIPTION="unison binary"
HOMEPAGE="https://www.cis.upenn.edu/~bcpierce/unison/"

KEYWORDS="~x86 ~amd64"

SRC_URI="${SRC_URI}
x86?   ( http://unison-binaries.inria.fr/files/unison-2.32.12.linux.32bit.zip )
amd64? ( http://unison-binaries.inria.fr/files/unison-2.32.12.linux.64bit.zip ) 
"

LICENSE="GPL-3"

pkg_name="unison"

SLOT="0"

IUSE=""

RDEPEND=">=x11-libs/pangox-compat-0.0.2"
DEPEND=""

src_unpack(){
  if [ "${A}" != "" ]; then
     einfo "unpack ${A}"
     unpack ${A}
     mkdir ${WORKDIR}/${P} 
     mv ${WORKDIR}/unison ${WORKDIR}/${P} 
  fi

#  einfo "P=${P}" 
#  einfo "PN=${PN}" 
#  einfo "PV=${PV}" 
#  einfo "PR=${PR}" 
#  einfo "A=${A}" 
#  einfo "D=${D}" 
#  einfo "S=${S}" 
#  einfo "WORKDIR=${WORKDIR}"
#  einfo "FILESDIR=${FILESDIR}"
}

src_install() {
  dodir /opt/${P}
  cp -r ${S} ${D}opt || die	
  
  einfo "Add an picture to the icons"
  doicon ${FILESDIR}/${PN}.png

  einfo "Do the desktop file" 
  make_desktop_entry /opt/${P}/unison ${PN} ${PN} System  
}

# update the menu after emerge and unmerge
pkg_postinst() {
  fdo-mime_desktop_database_update
  gnome2_icon_cache_update
}

pkg_postrm() {
  fdo-mime_desktop_database_update
  gnome2_icon_cache_update
}
