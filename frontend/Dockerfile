FROM node:14.21.3 AS base
MAINTAINER ujwal.pachghare
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM node:14-alpine
WORKDIR /usr/local/app/
COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/build/ ./build
COPY . .
EXPOSE 3000
CMD ["npm","start"]
