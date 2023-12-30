FROM node:18.16.0-alpine AS build
WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile
COPY . .

RUN NODE_ENV=production \
    yarn build

# ---

FROM node:18.16.0-alpine AS stg
WORKDIR /app

COPY --from=build /app/dist ./dist

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --ignore-scripts
CMD ["yarn", "preview"]