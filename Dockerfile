FROM ubuntu
RUN apt update; apt install -y git ruby gcc ruby-dev rake make wget python python-dev g++
RUN cd; git clone git://github.com/bioruby/bioruby; cd bioruby; gem build bioruby.gemspec; gem install ./bio-1.5.1.20160608.gem

# jupyter
RUN cd; wget https://bootstrap.pypa.io/get-pip.py; python get-pip.py; pip install jupyter
# iruby
RUN apt install -y libzmq3-dev libtool-bin autoconf; gem install rbczmq iruby pry

ADD . /usr/src/bioruby-notebook
EXPOSE 8888
CMD iruby notebook --no-browser --ip='*' --port 8888 --notebook-dir='/usr/src/bioruby-notebook'
