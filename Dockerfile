FROM node:14.21.3-alpine 
WORKDIR /app

COPY . . 
RUN npm install

RUN npm install sequelize-cli -g

ENV DB_HOST=wayshub 
ENV DB_USERNAME=app-server 
ENV DB_PASSWORD=katasandi

RUN sequelize db:create

COPY migrations /migrations 
RUN sequelize db:migrate

EXPOSE 5000
CMD [ "npm", "start" ]
