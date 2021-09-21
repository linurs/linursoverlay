# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit gnome2-utils

DESCRIPTION="gImageReader is a simple Gtk/Qt front-end to tesseract-ocr"
SRC_URI="https://github.com/manisandro/gImageReader/releases/download/v3.3.1/${P}.tar.xz"

HOMEPAGE="https://github.com/manisandro/gImageReader"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="app-text/tesseract
	app-text/djvu
	app-text/podofo
	app-text/gtkspellmm
	dev-cpp/gtksourceviewmm
	dev-cpp/libxmlpp
"
src_unpack() {
	einfo "FILESDIR=${FILESDIR}"
	unpack ${A}
	cd "${S}"
}

src_prepare() {
	einfo "Prepare the build";
#	cmake -DINTERFACE_TYPE=qt5 
	cmake -DINTERFACE_TYPE=gtk
	einfo "Source prepared";
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
