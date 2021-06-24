FROM node:latest AS app
WORKDIR /
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
ENTRYPOINT ["node", "./server/server.js"]

FROM debian:latest
WORKDIR /
COPY --from=app / .
CMD npm run dev