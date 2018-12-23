# $Header: $
# if problems with checksum download manually and turn here fetch restriction on
EAPI=5
inherit eutils fdo-mime gnome2-utils
DESCRIPTION="Eclipse oxygen C++"
HOMEPAGE="http://www.eclipse.org"
SRC_URI="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/2/eclipse-cpp-oxygen-2-linux-gtk-x86_64.tar.gz"
       
#
RESTRICT="fetch"
LICENSE="EPL"
# variable of the sub directory created after unpacking and having the files to be installed
directory_name="eclipse"
SLOT="0"
KEYWORDS="x86 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
 if [ "${A}" != "" ]; then
      unpack ${A}
 fi

 mv ${WORKDIR}/${directory_name} ${WORKDIR}/${P}
}

src_install() {
 # Install in /opt
 dodir /opt/eclipse-cpp-mars
 mv ${S} ${D}opt || die	

 # adds an picture to the icons
 doicon ${FILESDIR}/eclipse-cpp.png

 # create desktop file and add to menu  
 domenu ${FILESDIR}/eclipse-cpp.desktop
}
