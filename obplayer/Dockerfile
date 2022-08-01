FROM python:3-buster

RUN apt-get -y update && apt-get install -y \
ntp \
python3-pycurl \
python3-openssl \
python3-apsw \
python3-magic

RUN apt-get -y update && apt-get install -y \
python3-dateutil \
python3-requests

RUN apt-get -y update && apt-get install -y \
python3-gi \
python3-gi-cairo \
gir1.2-gtk-3.0 \
gir1.2-gdkpixbuf-2.0 \
gir1.2-pango-1.0

RUN apt-get -y update && apt-get install -y \
python3-gst-1.0 \
gir1.2-gstreamer-1.0 \
gir1.2-gst-plugins-base-1.0 \
gir1.2-gst-rtsp-server-1.0

RUN apt-get -y update && apt-get install -y \
gstreamer1.0-tools \
gstreamer1.0-libav \
gstreamer1.0-alsa \
gstreamer1.0-pulseaudio \
gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly

RUN apt-get -y update && apt-get install -y ffmpeg

RUN pip3 install passlib[bcrypt]

RUN apt-get -y update && apt-get install -y \
gstreamer1.0-vaapi \
mesa-vdpau-drivers

RUN pip3 install boto3

RUN pip3 install pulsectl pyrtlsdr inotify

RUN apt-get -y update && apt-get install -y libgirepository1.0-dev
RUN pip3 install PyGObject pycairo

# RUN apt-get -y update && apt-get install -y \
# ubuntu-restricted-addons \
# ubuntu-restricted-extras

# RUN apt-get -y update && apt-get install -y \
# espeak \
# mbrola \
# mbrola-en1 \
# mbrola-us1 \
# mbrola-us2 \
# mbrola-us3 \
# mbrola-fr1 \
# mbrola-fr4

RUN DEBIAN_FRONTEND=noninteractive pip3 install apsw pgi

WORKDIR /usr/src/app

ARG REPOSITORY=https://github.com/openbroadcaster/obplayer.git
ENV REPOSITORY=$REPOSITORY

ARG COMMIT
ENV COMMIT=$COMMIT

RUN git clone $REPOSITORY .
RUN git checkout $COMMIT

# BUGFIX

RUN find . -type f -name "*.py" -exec sed -i 's/self.pipeline = Gst.Pipeline(name)/self.pipeline = Gst.Pipeline.new(name)/g' {} +

# ENDBUGFIX

ENTRYPOINT ["/bin/sleep", "5h"]
# ENTRYPOINT ["/bin/bash", "./obplayer_loop"]

EXPOSE 80
EXPOSE 443
EXPOSE 465
EXPOSE 25
