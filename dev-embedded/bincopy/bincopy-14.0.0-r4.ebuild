# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{7..13} python3_13t)
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Mangling of various file formats that conveys binary information"
HOMEPAGE="https://github.com/eerimoq/bincopy
	https://bincopy.readthedocs.io/en/latest/"
SRC_URI="https://github.com/eerimoq/bincopy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"

KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
