Last login: Fri Jul 14 10:26:21 on ttys034
[rmarsa-laptop:~/tmp/mxe] rmarsa% mvim src/cgal.mk
[rmarsa-laptop:~/tmp/mxe] rmarsa% brew update
Updated Homebrew from f2c2964cf to 88b762f78.
Updated 3 taps (caskroom/cask, homebrew/core, homebrew/science).
==> New Formulae
akamai                            bento4                            homebrew/science/clips            octave                            qrupdate                          suite-sparse
arpack                            glpk                              homebrew/science/flexbar          openblas                          scalapack                         transfig
bash-snippets                     goose                             metis                             qhull                             sccache                           veclibfort
==> Updated Formulae
afl-fuzz                          emscripten                        homebrew/science/ome-common       libtiff ✔                         node                              snap-telemetry
afsctool                          encfs                             homebrew/science/ome-files        log4cpp                           node-build                        softhsm
amazon-ecs-cli                    etcd                              homebrew/science/ome-xml          logstash                          node@4                            sslyze
angular-cli                       etsh                              homebrew/science/vcftools         lxc                               node@6                            stella
apache-arrow                      evince                            htmldoc                           macvim ✔                          nsd                               supervisor
arangodb                          fabio                             httpflow                          makensis                          nuxeo                             swiftplate
bacula-fd                         fibjs                             hydra                             mame                              ola                               t1utils
binutils                          filebeat                          hyperscan                         memcached                         opensc                            talloc
bmake                             flow                              imagemagick                       menhir                            orc                               tcl-tk
cargo-completion                  fluent-bit                        imagemagick@6                     meson                             orientdb                          tcpdump
chakra                            folly                             influxdb                          metabase                          osquery                           tee-clc
checkstyle                        fstar                             influxdb@0.8                      metricbeat                        osrm-backend                      teleport
chromedriver                      fzf                               ircii                             miller                            packetbeat                        tfenv
closure-stylesheets               get-flash-videos                  jags                              mingw-w64                         paket                             tika
codec2                            git-fresh                         jboss-forge                       mkvtoolnix                        parallel                          trafficserver
conan                             gitlab-ci-multi-runner            jenkins                           mobile-shell                      passenger                         twoping
consul                            gnatsd                            jenkins-lts                       monax                             pre-commit                        unrar ✔
convmv                            gnu-chess                         jmxtrans                          mpc                               presto                            urh
convox                            google-benchmark                  kibana                            mpd                               pulseaudio                        vim
corectl                           grakn                             kobalt                            mpdas                             pyenv-virtualenv                  vimpc
crowdin                           gsoap                             kompose                           mpg123                            rclone                            vips
cryptol                           haskell-stack                     kubernetes-cli                    mspdebug                          reattach-to-user-namespace        voldemort
cython                            haste-client                      kubernetes-helm                   mypy                              redis                             vowpal-wabbit
dbt                               heroku                            languagetool                      mysql                             rethinkdb                         webdis
dcos-cli                          homebrew/science/alembic          launch4j                          mysql-cluster                     rocksdb                           webpack
dependency-check                  homebrew/science/bedops           lean-cli                          mysql-connector-c                 rom-tools                         wine
dhall-json                        homebrew/science/ceres-solver     libfreenect                       mysql-sandbox                     rtags                             wiredtiger
diff-so-fancy                     homebrew/science/cgns             libhttpseverywhere                mysql@5.5                         ruby-build                        wireguard-tools
diffoscope                        homebrew/science/cmor             libmpdclient                      mysql@5.6                         rust                              xapian
dmd                               homebrew/science/htslib           libphonenumber                    nano                              scalariform                       xsv
dub                               homebrew/science/ipopt            libpst                            ncmpc                             scw                               yle-dl
duck                              homebrew/science/libbigwig        libqalculate                      ncmpcpp                           sjk                               you-get
elasticsearch                     homebrew/science/littler          librdkafka                        netpbm ✔                          skinny                            youtube-dl
elixir                            homebrew/science/nextflow         librsvg                           nnn                               snakemake
[rmarsa-laptop:~/tmp/mxe] rmarsa% brew info cgal
cgal: stable 4.9.1 (bottled)
Computational Geometry Algorithm Library
https://www.cgal.org/
/Users/rmarsa/homebrew/Cellar/cgal/4.9.1 (2,976 files, 31.8MB) *
  Poured from bottle on 2017-05-04 at 14:57:37
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/cgal.rb
==> Dependencies
Build: cmake ✔
Required: mpfr ✔, boost ✔, gmp ✔
Optional: qt ✔, eigen ✔
==> Options
--c++11
	Build using C++11 mode
--with-eigen
	Build with Eigen3 support
--with-lapack
	Build with LAPACK support
--with-qt
	Build ImageIO and Qt components of CGAL
[rmarsa-laptop:~/tmp/mxe] rmarsa% brew edit cgal 
Editing /Users/rmarsa/homebrew/Library/Taps/homebrew/homebrew-core/Formula/cgal.rb

  1 class Cgal < Formula
  2   desc "Computational Geometry Algorithm Library"
  3   homepage "https://www.cgal.org/"
  4   url "https://github.com/CGAL/cgal/releases/download/releases/CGAL-4.10/CGAL-4.10.tar.xz"
  5   sha256 "eb56e17dcdecddf6a6fb808931b2142f20aaa182916ddbd912273c51e0f0c045"
  6 
  7   bottle do
  8     cellar :any
  9     sha256 "074e917036065d1fcb67dce5dd03e97015c12657460c391b3c20cb689e2b09a1" => :sierra
 10     sha256 "9f103a1be97cbf9cc5b3086d72c735897fccb632b79df98b0f62310f41ff17ef" => :el_capitan
 11     sha256 "861fcbdd2cea9fd8365e53e8ec7218f11c33b6b2fc1d0d732eeaa39c1b0343fd" => :yosemite
 12   end
 13 
 14   option :cxx11
 15   option "with-qt", "Build ImageIO and Qt components of CGAL"
 16   option "with-eigen", "Build with Eigen3 support"
 17   option "with-lapack", "Build with LAPACK support"
 18 
 19   deprecated_option "imaging" => "with-qt"
 20   deprecated_option "with-imaging" => "with-qt"
 21   deprecated_option "with-eigen3" => "with-eigen"
 22   deprecated_option "with-qt5" => "with-qt"
 23 
 24   depends_on "cmake" => :build
 25   depends_on "mpfr"
 26 
 27   depends_on "qt" => :optional
 28   depends_on "eigen" => :optional
 29 
 30   if build.cxx11?
 31     depends_on "boost" => "c++11"
 32     depends_on "gmp"   => "c++11"
 33   else
 34     depends_on "boost"
 35     depends_on "gmp"
 36   end
 37 
 38   def install
 39     ENV.cxx11 if build.cxx11?
 40 
 41     args = std_cmake_args + %W[
 42       -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
 43       -DCMAKE_INSTALL_NAME_DIR=#{HOMEBREW_PREFIX}/lib
 44     ]
 45 
 46     if build.without? "qt"
 47       args << "-DWITH_CGAL_Qt5=OFF" << "-DWITH_CGAL_ImageIO=OFF"
 48     else
 49       args << "-DWITH_CGAL_Qt5=ON" << "-DWITH_CGAL_ImageIO=ON"
 50     end
 51 
 52     if build.with? "eigen"
 53       args << "-DWITH_Eigen3=ON"
 54     else
 55       args << "-DWITH_Eigen3=OFF"
 56     end
 57 
 58     if build.with? "lapack"
 59       args << "-DWITH_LAPACK=ON"
 60     else
 61       args << "-DWITH_LAPACK=OFF"
"~/homebrew/Library/Taps/homebrew/homebrew-core/Formula/cgal.rb" 92L, 2822C

