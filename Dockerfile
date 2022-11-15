FROM debian:buster

ARG SDK_URL

RUN apt-get update && apt-get install -y wget cmake
RUN mkdir ins && cd ins && wget $SDK_URL  

RUN /bin/bash -c  'cd ins && apt install -y  "./${SDK_URL##*/}" && cd .. && rm -rf ins'

WORKDIR /workspace

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8

RUN apt-get update && apt-get -y install \
       device-tree-compiler\
       && apt-get autoremove --yes && apt-get clean --yes

  
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]

