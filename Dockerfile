FROM node:lts-buster

RUN apt -y update && sudo apt -y upgrade \
  apt -y install git ffmpeg curl \
  apt -y remove nodejs \
  curl -fsSl https://deb.nodesource.com/setup_lts.x | sudo bash - && sudo apt -y install nodejs
 \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -y update && sudo apt -y install yarn \
  yarn global add pm2 \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN yarn install

COPY . .

CMD ["node", "."]
 
 
 
