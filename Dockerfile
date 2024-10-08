FROM node:18.16.0-alpine3.17
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY src/package.json src/package-lock.json .
RUN npm install
COPY src/ .
RUN npm cache clean --force
RUN mkdir ./cache
RUN export npm_config_cache=./cache
EXPOSE 3000
CMD [ "npm", "start"]
