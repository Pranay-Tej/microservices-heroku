# STATE:1
# BUILD API_GATEWAY

FROM node:12-alpine AS API_GATEWAY_BUILD_IMAGE

WORKDIR /usr/src/app

COPY api-gateway/package.json .

RUN npm i

# COPY api-gateway .

#############################################

# STATE:2
# BUILD USER_SERVICE

FROM node:12-alpine AS USER_BUILD_IMAGE

WORKDIR /usr/src/app

# copy from build image
COPY --from=API_GATEWAY_BUILD_IMAGE /usr/src/app/ .
COPY user-service/package.json .

RUN npm i

# COPY user-service .

#############################################

# STATE:3
# BUILD BOOK_SERVICE

FROM node:12-alpine AS BOOK_BUILD_IMAGE

WORKDIR /usr/src/app

# copy from build image
COPY --from=USER_BUILD_IMAGE /usr/src/app/ .
COPY book-service/package.json .

RUN npm i

# COPY user-service .

#############################################

# STATE:4
# RUN

FROM node:12-alpine
WORKDIR /usr/src/app

# copy from build image
# COPY --from=API_GATEWAY_BUILD_IMAGE /usr/src/app/node_modules ./node_modules
# COPY --from=USER_BUILD_IMAGE /usr/src/app/node_modules ./node_modules
COPY --from=BOOK_BUILD_IMAGE /usr/src/app/ .
COPY . .

# EXPOSE 80

CMD ["./start.sh"]
#############################################