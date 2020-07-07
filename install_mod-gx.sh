# install_mod-gx.sh
cd $ZYNTHIAN_PLUGINS_SRC_DIR
git clone https://github.com/brummer10/guitarix
cd guitarix/trunk/
./waf configure --lv2dir=$ZYNTHIAN_PLUGINS_DIR/lv2
./waf build
./waf -j1 install
./waf clean
cd ..
