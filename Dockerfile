FROM ruby:2.6.1-slim-stretch
RUN apt-get -y update && apt-get -y install git libicu-dev g++ \
    cmake pkg-config zlib1g-dev libcurl4-openssl-dev liblzma-dev \
    libssl-dev ruby-dev libxml2-dev libxslt-dev build-essential && \
    rm -rf /var/lib/apt/lists/*
RUN gem install gollum
RUN gem install github-markdown
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "8080", "--live-preview"]
EXPOSE 8080
