# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..13} python3_13t )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="tk calendar widget for python"
HOMEPAGE="https://pypi.org/project/tkcalendar/"

SRC_URI="https://files.pythonhosted.org/packages/65/3d/3406cf7963661ed890082bff17ed4c5e26b5a564306639303d4fbb2a047f/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/babel"
