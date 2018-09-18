FROM land007/golang-grpc:centos

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN go get -u -d gocv.io/x/gocv

#RUN yum install -y opencv-devel.x86_64
RUN sed -i 's/sudo //g' $GOPATH/src/gocv.io/x/gocv/Makefile
ENV PKG_CONFIG_PATH /usr/local/lib64/pkgconfig
RUN echo 'export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig' >> /etc/profile
RUN echo "/usr/local/lib" >> /etc/ld.so.conf && echo "/usr/local/lib64" >> /etc/ld.so.conf && ldconfig
RUN cd $GOPATH/src/gocv.io/x/gocv && make install

#ubuntu
#docker stop gocv ; docker rm gocv ; docker run -it --privileged --name gocv -p 20022:20022 land007/gocv:latest
#centos
#docker stop gocv ; docker rm gocv ; docker run -it --privileged --name gocv -p 20022:20022 land007/gocv:centos
