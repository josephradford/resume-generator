FROM pandoc/latex:latest

# Set working directory
WORKDIR /workspace

# Copy the entrypoint script
COPY generate.sh /usr/local/bin/generate.sh
RUN chmod +x /usr/local/bin/generate.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/generate.sh"]