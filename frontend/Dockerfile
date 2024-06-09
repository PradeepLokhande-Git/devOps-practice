# Stage 1: Build image
FROM node:16-alpine3.12 as build

WORKDIR /app

#COPY package*.json ./
#COPY tsconfig.json ./

COPY . .

Run npm install
RUN npm install typescript -g
RUN npm install -g webpack
RUN npm install -g webpack-cli
RUN npm install -g html-webpack-plugin

COPY . .

RUN npm run build

#Stage 2: Prod image
FROM nginx:1.21.6-alpine

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=build /app/dist .

COPY ./env.sh .
COPY .env-defaults .

# Add bash
#RUN apk --update --no-cache upgrade
RUN apk add --no-cache bash
#RUN apk add bash
EXPOSE 80

CMD ["/bin/bash", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]
