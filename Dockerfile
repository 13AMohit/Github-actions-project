FROM node:18.12.0-alpine3.15
RUN apk add bash
RUN apk add --no-cache
RUN apk add --update alpine-sdk
RUN apk update
RUN apk upgrade
ADD . /app
WORKDIR /app

COPY package*.json /app/
RUN npm install
RUN npm run build
EXPOSE 3000
ENTRYPOINT [ "/bin/bash", "-c", "npm start" ]