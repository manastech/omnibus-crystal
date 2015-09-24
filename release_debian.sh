# 1. copy the previous version of the compiler to crystal-linux
rvmsudo bash
cd /vagrant
bundle
bundle exec omnibus build crystal
# sudo ./dist/add-deb.sh pkg/crystal_<<version>>_amd64.deb
# sudo ./dist/add-deb.sh pkg/crystal_<<version>>_i386.deb
