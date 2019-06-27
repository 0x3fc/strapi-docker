FROM node:10.16.0-alpine

WORKDIR /opt/strapi

RUN apk update
RUN apk add autoconf automake bash g++ \
    libc6-compat libjpeg-turbo-dev libpng-dev \
    lcms2-dev make yarn

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

CMD yarn develop
