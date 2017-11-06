FROM openjdk:8-jre

## Node.js setup
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN \
  apt-get update && \
  apt-get install -y nodejs xvfb chromium && \
  rm -rf /var/lib/apt/lists/*

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome && ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser && chmod a+x /usr/bin/xvfb-chromium

ENV CHROME_BIN /usr/bin/google-chrome
