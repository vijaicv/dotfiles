echo "installing lazygit"
sudo apt-get install lazygit

echo "installing neovim"
sudo apt-get install neovim

echo "configuring neovim"
cp ./nvim/ ~/.config/nvim/

echo "installing tmux"
sudo apt-get install tmux

echo "configuring tmux"
cp .tmux.conf ~/.tmux.conf

echo "setup global exclusion pattern for git"
touch ~/.gitignore_global
echo ".classpath
.factorypath
.project
.settings/
" > .gitignore_global
git config --global core.excludesFile ~/.gitignore_global

echo "adding alias <spot>  for ./gradlew spotlessApply"
grep -q "alias spot=" ~/.bashrc || echo "alias spot='./gradlew spotlessApply'" >> ~/.bashrc

 
