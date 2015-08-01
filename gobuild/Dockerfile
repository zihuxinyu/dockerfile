
FROM google/golang

ADD ./gobuild.sh /
RUN chmod +x /gobuild.sh
WORKDIR /gopath/src/
ENTRYPOINT ["/gobuild.sh"]



