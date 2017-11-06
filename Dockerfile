FROM openjdk:8-jre

## Node.js setup
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Chrome w/xvfb
# From https://github.com/dockerfile/chrome/blob/master/Dockerfile
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y nodejs google-chrome-stable xvfb chromium && \
  rm -rf /var/lib/apt/lists/*

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -sf /usr/bin/xvfb-chromium /usr/bin/google-chrome && ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser && chmod a+x /usr/bin/xvfb-chromium

ENV CHROME_BIN /usr/bin/google-chrome
