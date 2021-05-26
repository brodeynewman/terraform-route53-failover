FROM node:14.15.3-alpine3.10

WORKDIR /usr/src/app

COPY . .

RUN npm i

EXPOSE 3000

CMD ["npm", "start"]