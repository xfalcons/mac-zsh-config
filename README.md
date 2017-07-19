Installation
======
On my MBP or Ubuntu, I love using Oh My ZSH in my terminal to use with GIT. This works faster than GIT UI programs like Tower. First of all you need to install ZSH and afterwards install Oh My ZSH. The minimum zsh version required for Oh My ZSH is 4.3.9

Install BREW first:
------

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install ZSH:
------

	brew install zsh


Oh my zsh
------
Oh-my-zsh is a replacement for the default bash on OSX. Oh-my-zsh also runs side-by-side with bash, so again no worries.

Install it by invoking

	$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

After installation has finished open ~/.zshrc in any editor and set the theme for ZSH

	ZSH_THEME="agnoster"  


Afterwards you can set ohmyzsh as your default shell:

	chsh -s /bin/zsh

All you need to do then is restart your terminal and it should be using ohmyzsh than. You can tweak your ohmyzsh in the .zshrc file. This is what my .zshrc file looks like:



Installing PowerLine if you Like
======
Powerline font is responsible for brining some nice and helpful icons to the terminal. For example it's displaying branches in the following way

iTerm2 with Powerline
You can download the font from <a href="https://github.com/Lokaltog/powerline-fonts/blob/master/Meslo/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.otf">here</a>, install this font on your system and then apply it in iTerm2 through

iTerm -> preferences -> profiles -> text

I've chosen 11pt as font-size for my setup, so apply PowerLine for Regular Font and Non-ASCII Font by clicking each Change Font button and select the PowerLine font.



Configure git, tmux, and vim
======

Backup your original configuration files if necessary.

     mv .gitconfig .gitconfig.bak;
     mv .vim .vim.bak;
     mv .vimrc .vimrc.bak;
     mv .zshrc .zshrc.bak;
     mv .tmux.conf .tmux.conf.bak;
     mv git_diff_wrapper git_diff_wrapper.bak;
     mv .config .config.bak
     
Install everything with one-line command.

     wget -O - https://raw.github.com/xfalcons/mac-config/master/install.sh | sh
