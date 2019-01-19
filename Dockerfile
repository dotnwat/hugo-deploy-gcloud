from alpine:latest
LABEL "com.github.actions.name"="Hugo Build"
LABEL "com.github.actions.description"="Hugo Build Description"
RUN apk add --no-cache bash
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
