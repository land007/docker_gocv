FROM land007/golang-grpc:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN go get -u -d gocv.io/x/gocv

RUN sed -i 's/sudo //g' $GOPATH/src/gocv.io/x/gocv/Makefile
RUN cd $GOPATH/src/gocv.io/x/gocv && make install


#docker stop eyecool-gocv ; docker rm eyecool-gocv ; docker run -it --privileged --name eyecool-gocv -p 20023:20022 land007/gocv:latest
