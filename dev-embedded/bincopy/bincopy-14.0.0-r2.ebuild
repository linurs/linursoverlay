# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{7..12} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Mangling of various file formats that conveys binary information"
HOMEPAGE="https://github.com/eerimoq/bincopy
	https://bincopy.readthedocs.io/en/latest/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"

distutils_enable_tests pytest

python_test() {
	pytest -vv ${PN}/tests.py || die "Tests fail with ${EPYTHON}"
}
