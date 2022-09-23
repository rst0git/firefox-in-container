FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y software-properties-common gnupg \
    && add-apt-repository -y ppa:mozillateam/ppa \
    && apt-get update \
    && echo "Package: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001\n\nPackage: firefox*Pin: release o=Ubuntu\nPin-Priority: -1\n" | tee /etc/apt/preferences.d/mozilla-firefox \
    && apt-get install -t 'o=LP-PPA-mozillateam' -y firefox

# Replace 1000 with your user id
RUN useradd --create-home --uid 1000 developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox
