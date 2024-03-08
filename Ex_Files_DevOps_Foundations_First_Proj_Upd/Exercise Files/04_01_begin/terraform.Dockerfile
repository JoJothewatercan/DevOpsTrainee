FROM alpine
MAINTAINER Johan Mikkelsen <johan.hm@hotmail.com>

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /

USER nobody