FROM jekyll/builder AS builder

WORKDIR /mnt

COPY . /mnt/

RUN mkdir _site

RUN bundle install

ENV JEKYLL_ENV=production

RUN jekyll build

FROM nginx:1.22.0-alpine

LABEL org.opencontainers.image.source="https://github.com/agusacevedoanazco/jekyllonlinecv"

COPY --from=builder /mnt/_site/. /usr/share/nginx/html