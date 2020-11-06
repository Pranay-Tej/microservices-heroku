# STATE:1
# BUILD

FROM node:12-alpine AS BUILD_IMAGE

WORKDIR /usr/src/app

COPY package.json .

RUN npm i

COPY . .

# STATE:2
# RUN

FROM node:12-alpine

WORKDIR /usr/src/app

# copy from build image
COPY --from=BUILD_IMAGE /usr/src/app/ .

CMD npm start
