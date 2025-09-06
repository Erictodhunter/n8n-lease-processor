FROM n8nio/n8n:latest

# Add environment variables
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Expose port
EXPOSE 5678

# Use the default entrypoint and command from the base image
# The n8nio/n8n image already has the correct setup
