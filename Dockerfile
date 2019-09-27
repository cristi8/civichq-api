FROM node:10

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

RUN npm i mysql2

COPY api api
COPY config config
COPY swagger.yaml .

ENV NODE_ENV=production

CMD [ "node", "api/server.js" ]


STOPSIGNAL SIGINT
EXPOSE 8080
