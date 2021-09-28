# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

DESCRIPTION="gImageReader is a simple Gtk front-end to tesseract-ocr"
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
	dev-cpp/gtkmm
	dev-cpp/cairomm
	dev-libs/json-glib
	app-text/poppler
	"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_prepare() {
	einfo "Prepare the build";
	einfo "This ebuild supports just gtk. qt is not supported due its dependencies";
	cmake -DINTERFACE_TYPE=gtk
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	cmake -DMANUAL_DIR=/usr/share/${P}
	eapply_user
	einfo "Source prepared";
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
