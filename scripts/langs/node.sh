set -eo pipefail

if ! command -v nvm &>/dev/null; then
  echo "Setting up NVM command"
  mkdir -p ~/.nvm
  export NVM_DIR="$HOME/.nvm"
  echo "Sourcing nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" || true
fi

echo "Installing Node v16"
nvm install 16 --latest-npm
nvm use 16
npm i -g corepack
yarn set version stable


# LTS
echo "Installing Node LTS"
nvm install 'lts/*' --reinstall-packages-from=current --latest-npm --default
nvm use 'lts/*'
corepack enable
nvm alias default 'lts/*'
yarn set version stable

echo "You can init react-native projects with"
echo
echo "  npx react-native init AwesomeProject --template react-native-template-typescript"
