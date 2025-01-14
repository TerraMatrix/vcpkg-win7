% Change To Current Directory %
%~d0
cd  %~dp0

set http_proxy=http://127.0.0.1:7890 & set https_proxy=http://127.0.0.1:7890

echo "set -install-root  and  -packages-root"
vcpkg --x-install-root=./installed --x-packages-root=./packages  --vcpkg-root=./

echo "install  boost 1.86.0"
echo "--------------------------------------------"
call ./bash/boost.bat


