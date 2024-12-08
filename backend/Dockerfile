FROM node:14.21.3 AS base
MAINTAINER ujwal.pachghare
WORKDIR /app
COPY . .
RUN npm install

FROM node:14-alpine
WORKDIR /usr/local/app/
COPY --from=base /app/node_modules ./node_modules
COPY . .
EXPOSE 8000
CMD ["npm","start"]
