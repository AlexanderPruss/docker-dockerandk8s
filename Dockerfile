FROM docker:18

ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN mkdir ~/.kube
RUN chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["sh"]
