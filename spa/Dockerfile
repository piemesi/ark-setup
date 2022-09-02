FROM node:lts
USER node
RUN mkdir -p /home/node/app && chown node:node /home/node/app
RUN mkdir -p /home/node/app/node_modules && chown node:node /home/node/app/node_modules
WORKDIR  /home/node/app

# The files packege[-lock].json should be updated.
COPY --chown=node:node package.json package-lock.json ./
RUN npm ci --quiet
COPY --chown=node:node . .
