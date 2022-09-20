# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2017 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="smbus2"
PKG_VERSION="0.4.2 "
PKG_SHA256="f96d345e0aa10053a8a4917634f1dc37ba1f656fa5cace7629b71777e90855c6"
PKG_LICENSE="OSS"
PKG_SITE="http://pypi.org/project/smbus2"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3"
# PKG_LONGDESC="A simple, fast, complete, correct and extensible JSON encoder and decoder for Python 2.5+."
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export PYTHONXCPREFIX="${SYSROOT_PREFIX}/usr"

#   PKG_MAKE_OPTS_TARGET="-f Makefile.lnx CC=${CC}"
#   export CFLAGS="${TARGET_CFLAGS} -g3 -Wall -I${PKG_BUILD}/include -DDEBUG_BUILD=0 -D_FILE_OFFSET_BITS=64 -D LINUX=1 -D BSD=1"
#   export HOST_CFLAGS="${TARGET_CFLAGS}"
#   export HOST_CFLAGS="-march=${ARCH} -O2 -Wall -pipe -I${TOOLCHAIN}/include"

}

make_target() {
  python3 setup.py build
}

makeinstall_target() {
  python3 setup.py install --root=${INSTALL} --prefix=/usr
}

post_makeinstall_target() {
  python_remove_source

  rm -rf ${INSTALL}/usr/lib/python*/site-packages/*/tests
}
