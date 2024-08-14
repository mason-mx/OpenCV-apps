FROM ubuntu:20.04
RUN apt update
RUN apt-get install -y ruby-full
RUN apt-get install -y build-essential zlib1g-dev

SHELL ["/bin/bash", "-c"]
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
RUN source ~/.bashrc
RUN gem install --no-rdoc --no-ri jekyll
RUN gem install jekyll-paginate
RUN gem install jekyll-seo-tag

EXPOSE 4000
WORKDIR /site/
CMD [ "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]