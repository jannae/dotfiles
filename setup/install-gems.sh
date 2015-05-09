# Install rvm
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles

# rvm install ruby-head
rvm install 2.2; rvm use 2.2 --default

# test install
ruby -v; which ruby


gem install scss-lint
gem install bundler
