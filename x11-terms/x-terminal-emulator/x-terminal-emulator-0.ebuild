# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual package for the system's default terminal emulator"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Terminal_Emulators"
LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="|| (
	x11-terms/xterm
	x11-terms/alacritty
	x11-terms/kitty
	x11-terms/rxvt-unicode
	kde-apps/konsole
)
app-eselect/eselect-terminal
"
