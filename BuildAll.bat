% Change To Current Directory %
%~d0
cd  %~dp0

set http_proxy=http://127.0.0.1:7890 & set https_proxy=http://127.0.0.1:7890

echo "set -install-root  and  -packages-root"
vcpkg --x-install-root=./installed --x-packages-root=./packages  --vcpkg-root=./

echo "install  boost 1.86.0"
echo "--------------------------------------------"
call ./bash/boost.bat


echo "install  fmt 11.0.2#1"
echo "--------------------------------------------"
call ./bash/fmt.bat

echo "install  sltbench  2.4.0#3"
echo "--------------------------------------------"
call ./bash/sltbench .bat

echo "install  freetype 2.13.3"
echo "--------------------------------------------"
call ./bash/freetype.bat

echo "install  hdf5 1.14.4.3#3"
echo "--------------------------------------------"
call ./bash/hdf5.bat

echo "install  flann 2019-04-07#7"
echo "--------------------------------------------"
call ./bash/flann.bat