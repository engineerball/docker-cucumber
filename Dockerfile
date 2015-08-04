FROM ubuntu
MAINTAINER engineerball "engineerball@gmail.com"

# turn on universe packages
#RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list
RUN apt-get update

# basics
RUN apt-get install -y openssh-server git-core openssh-client curl
RUN apt-get install -y build-essential
RUN apt-get install -y openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

# install RVM, Ruby, and Bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# install Go
RUN curl -s https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar -v -C /usr/local/ -xz
# configure environment for go
ENV PATH /usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
ENV GOPATH /go
ENV GOROOT /usr/local/go

# install cucumber
RUN apt-get install -y firefox xvfb

# test deploy
RUN /bin/bash -l -c "gem install nokogiri -v 1.6.6.2 --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install capybara capybara-mechanize rspec launchy watir watir-webdriver watir-webdriver-performance logging headless --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install capybara-mechanize --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install cucumber -v 1.3.17 --no-ri --no-rdoc"
