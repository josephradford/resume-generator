# Use debian slim with faster package installation
FROM debian:bullseye-slim

# Install pandoc and necessary tex packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    pandoc \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-xetex \
    texlive-fonts-recommended \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Set the entrypoint to run the script from the mounted volume
ENTRYPOINT ["/bin/bash", "/workspace/generate.sh"]