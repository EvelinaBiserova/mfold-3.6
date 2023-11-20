# mfold-3.6
http://www.unafold.org/mfold/software/download-mfold.php

# Prerequesites:
 * Ubuntu
   * Install gfortran, g++, make

# Howto build
 * `FFLAGS="-static-libgfortran -static-libgcc -static" LDFLAGS="-static" ./configure --prefix=/root/mfold-3.6 --disable-dependency-tracking`
 * Rename src/UGENEefn.f and src/UGENEnewtemp.f to src/efn.f and src/newtemp.f consequently (yes, rewrite files generated by configure) (`cp src/UGENEefn.f src/efn.f`, `cp src/UGENEnewtemp.f src/newtemp.f`)
 * Run `make`, then `make install`
 * After `make isntall` there is a folder /root/prefix/bin with scripts and binaries. Replace /root/mfold-3.6/bin/mfold with ./UGENEmfold (rename it to mfold) (`cp UGENEmfold /root/mfold-3.6/bin/mfold`)

---
###### Todo
 * Add chmod for scripts in git
