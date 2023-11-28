FROM node:iron-alpine3.18
WORKDIR /app
COPY package*.json .
RUN npm install
RUN npm install webpack webpack-dev-server --save
RUN npm install react react-dom --save 
RUN npm install babel-core babel-loader babel-preset-react babel-preset-es2015 --save
COPY . .
RUN addgroup app && adduser -S -G app app
RUN chown app:app *
USER app
ENV APP_URL=http://www.myapp.com/
EXPOSE 7777
RUN echo over
CMD ["npm", "start"]
