FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    curl \
    git

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node

WORKDIR /home/node/.n8n

EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:5678/healthz || exit 1

CMD ["n8n", "start"]
