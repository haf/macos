# 14
nvm install 14 --latest-npm
nvm use 14
npm i -g corepack
yarn set version stable
yarn global add expo-cli


# LTS
nvm install 'lts/*' --reinstall-packages-from=current --latest-npm --default
nvm use 'lts/*'
corepack enable
nvm alias default 'lts/*'
yarn set version stable
yarn global add expo-cli


echo "You can init react-native projects with"
echo
echo "  npx react-native init AwesomeProject --template react-native-template-typescript"