# install_mod-gx.sh
cd $ZYNTHIAN_PLUGINS_SRC_DIR
git clone https://github.com/brummer10/guitarix
cd guitarix/trunk/
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    intltool \
    gettext \
    libsndfile1-dev \
    libglibmm-2.4-dev \
    libfftw3-dev \
    libcurl4-openssl-dev \
    sassc \
    fonts-roboto \
    libgtk-3-dev \
    gtkmm-3.0-dev \
    ladspa-sdk \
    liblrdf0-dev \
    libboost-system-dev \
    libboost-iostreams-dev \
    libzita-convolver-dev \
    libzita-resampler-dev \
    gperf \
    faust \
    avahi-gobject \
    bluez \
    liblo-dev
    libeigen3-dev \
  && rm -rf /var/lib/apt/lists/* \
  && apt -qyy clean

./waf configure --lv2dir=$ZYNTHIAN_PLUGINS_DIR/lv2
./waf build
RUN echo '#!/bin/bash' > /usr/bin/update-desktop-database
RUN chmod 777 /usr/bin/update-desktop-database
./waf -j1 install
./waf clean
cd ..
