FROM node:18-alpine AS build

WORKDIR /cyberchef
COPY ./ /cyberchef

RUN npm ci
RUN npx grunt prod

FROM ghcr.io/static-web-server/static-web-server:2.25-alpine

COPY --from=build /cyberchef/build/prod /public
