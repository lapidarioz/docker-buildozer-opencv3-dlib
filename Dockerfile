FROM lapidarioz/docker-python-opencv3-dlib

MAINTAINER lapidarioz <rafaelluiztesta@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y python-pip cython vim build-essential ccache git gcc openjdk-7-jdk \
    lsb-release unzip wget curl python-dev zlib1g-dev ant xsel xclip \
    zlib1g:i386 libncurses5:i386 libstdc++6:i386
    RUN apt-get clean
RUN pip install pip --upgrade
RUN pip install cython buildozer
RUN adduser --disabled-password --gecos "" -u 1000 kivy
RUN mkdir -p /data /home/kivy/.buildozer && chown 1000 /data
RUN chown -R kivy.kivy /home/kivy/.buildozer

COPY make_apk /usr/bin/make_apk

WORKDIR /home/kivy

ENTRYPOINT ["make_apk"]
