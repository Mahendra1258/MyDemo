#Download base image ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER sarat.e99@gmail.com

# Update Software repository
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y python-software-properties 

RUN apt-get install -y dialog \
     && apt-get install -y apt-utils 

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get install --yes nodejs \
    && apt-get install -y git \
    && apt-get install --yes build-essential 

RUN npm install -g @angular/cli

RUN git clone https://github.com/didinj/angular-4-sample-app.git


WORKDIR /angular-4-sample-app/

RUN npm install

EXPOSE 4202

CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4202"]