FROM centos:7.6.1810

RUN yum install -y make git
ENV PATH "$PATH:/usr/local/go/bin"
ENV golang_version 1.12.5
RUN curl -o go$golang_version.linux-amd64.tar.gz https://dl.google.com/go/go$golang_version.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go$golang_version.linux-amd64.tar.gz
ENV overlord_version 1.7.0
RUN curl -o overlord-$overlord_version.tar.gz https://codeload.github.com/bilibili/overlord/tar.gz/$overlord_version
RUN tar zxf overlord-$overlord_version.tar.gz
RUN cd overlord-$overlord_version && make build
RUN ls -lh
RUN tar zcf overlord-$overlord_version.bin.tar.gz overlord-$overlord_version/
RUN rm -rf go$golang_version.linux-amd64.tar.gz overlord-$overlord_version/ overlord-$overlord_version.tar.gz
