FROM land007/golang-grpc:centos

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN go get -u -d gocv.io/x/gocv

RUN sed -i 's/sudo //g' $GOPATH/src/gocv.io/x/gocv/Makefile
RUN cd $GOPATH/src/gocv.io/x/gocv && make install

#ubuntu
#docker stop gocv ; docker rm gocv ; docker run -it --privileged --name gocv -p 20022:20022 land007/gocv:latest
#centos
#docker stop gocv ; docker rm gocv ; docker run -it --privileged --name gocv -p 20022:20022 land007/gocv:centos
