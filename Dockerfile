FROM land007/golang-grpc:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN go get -u -d gocv.io/x/gocv && \
	sed -i 's/sudo //g' $GOPATH/src/gocv.io/x/gocv/Makefile && \
	cd $GOPATH/src/gocv.io/x/gocv && make install && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/gocv" >> /.image_names && \
	echo "land007/gocv" > /.image_name


#docker stop gocv ; docker rm gocv ; docker run -it --privileged --name gocv -p 20022:20022 land007/gocv:latest
