FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install additional packages
RUN apk add --no-cache \
    curl \
    git

# Add environment variable for permissions
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Switch back to node user
USER node

# Set working directory
WORKDIR /home/node

# Expose the port N8N runs on
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:5678/healthz || exit 1

# Start N8N with full path
CMD ["/usr/local/bin/n8n", "start"]
