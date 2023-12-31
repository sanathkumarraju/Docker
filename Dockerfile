FROM node:iron-alpine3.18
WORKDIR /app
COPY package*.json .
RUN npm install
RUN npm install webpack webpack-dev-server --save
RUN npm install react react-dom --save 
RUN npm install babel-core babel-loader babel-preset-react babel-preset-es2015 --save
RUN addgroup app && adduser -S -G app app
RUN cd ../
RUN chown app:app /app
WORKDIR /app
COPY . .
RUN chown app:app *
USER app
ENV APPURL=http://www.myapp.com/
EXPOSE 3000
RUN echo over
CMD ["npm", "start"]
