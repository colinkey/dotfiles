# MacOS Install

Create a dev directory and clone this repo

```
mkdir ~/Dev
git clone https://www.github.com/colinkey/dotfiles
cd ~/Dev/dotfiles
```

Verify that you have a ruby version installed

```
ruby -v
```

Install oh-my-zsh.
```
# Opening the webpage to get the most up to date install info
open https://ohmyz.sh/#install
```

Run the install script

```
ruby install.rb
```

Install homebrew
```
# This will open the homebrew webpage. Copy the install command.
# Linking to the page just in case the install command changes by the next time I have to run this
open https://brew.sh
```

In the output of the install, there will be a command to source the `brew` bin into your shell. Do that.
```
# It should look something like
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Install from Brewfile
```
brew bundle install
```

Set up asdf plugins for the files in `.tool-versions`
```
cat .tool-versions
asdf plugin add <plugin short name>
```

Setup Raycast
```
# Remove spotlight keybinds
open https://manual.raycast.com/hotkey
# Continue setup - use cmd+space for hotkey
open raycast
```

Add `gh-dash` for the funsies
```
gh extension install dlvhdr/gh-dash
```

Automatically send screenshots to a new folder
```
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
```
Drag that folder to the dock. There are ways to automate this but yikes.
