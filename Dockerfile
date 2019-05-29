FROM land007/golang-grpc:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN go get -u -d gocv.io/x/gocv

RUN sed -i 's/sudo //g' $GOPATH/src/gocv.io/x/gocv/Makefile
RUN cd $GOPATH/src/gocv.io/x/gocv && make install

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times
RUN echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time
RUN echo "land007/gocv" >> /.image_names
RUN echo "land007/gocv" > /.image_name


#docker stop gocv ; docker rm gocv ; docker run -it --privileged --name gocv -p 20022:20022 land007/gocv:latest
