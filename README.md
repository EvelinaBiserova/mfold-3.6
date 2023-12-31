# mfold-3.6
http://www.unafold.org/mfold/software/download-mfold.php

# Prerequisites:
 * Ubuntu
   * Install gfortran, g++, make
   * Download mfold, gs src

# Howto build
 * Ubuntu
   * mfold
     * <sub><sup>`chmod 744 ./configure`</sup></sub>
     * `FFLAGS="-static-libgfortran -static-libgcc -static" LDFLAGS="-static" ./configure --prefix=/root/mfold/mfold-3.6 --disable-dependency-tracking`
     * Rename src/UGENEefn.f and src/UGENEnewtemp.f to src/efn.f and src/newtemp.f consequently (yes, rewrite files generated by configure) (`cp src/UGENEefn.f src/efn.f`, `cp src/UGENEnewtemp.f src/newtemp.f`)
     * Run `make`, then `make install`
     * After `make install` there is a folder /root/mfold/mfold-3.6/bin with scripts and binaries. Replace /root/mfold/mfold-3.6/bin/mfold with ./UGENEmfold (rename it to mfold) (`cp UGENEmfold /root/mfold/mfold-3.6/bin/mfold`)
     * Finally copy UGENE proxy et-like script for calling mfold: `cp UGENEmfold.sh /root/mfold/mfold.sh`
   * gs
     * `CXXFLAGS="-std=c++98" LDFLAGS=-static ./configure --prefix=/root/mfold/gs10.02.0 --with-libiconv=no  --without-libtiff --without-ijs  --without-urf --without-so --without-cal --with-drivers=PNG,PS --without-gnu-make --with-fontpath --without-tesseract --disable-fontconfig`
     * make && make install
     * (Optionally) Remove doc and man folders from gs prefix folder.
   * (Optionally) Check correctness:
     * `echo TAGTTATTAATAGTA > inp.txt`
     * <sub><sup>`chmod 744 /root/mfold/mfold.sh`</sup></sub>
     * `/root/mfold/mfold.sh SEQ=inp.txt NA=DNA`
     * Expected: script finished successfully, a lot of files started with "inp.txt" generated, there are 11 ps files and 11 png files.
     * `ldd /root/mfold/mfold-3.6/bin/auxgen` shouldn't print shared/dinamic libraries.
     * `ldd /root/mfold/gs10.02.0/bin/gs` shouldn't print shared/dinamic libraries.

Note that this check isn't enough.

---
###### Todo
 * Add chmod for scripts in git
 * -std=c++98 or -static? Why is this enough? Where is the difference?
 * Spaces in path don't work
