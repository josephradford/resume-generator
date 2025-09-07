# Use ubuntu as base and install pandoc + texlive for better platform support
FROM ubuntu:22.04

# Install pandoc, texlive, and xelatex
RUN apt-get update && apt-get install -y \
    pandoc \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-xetex \
    texlive-fonts-recommended \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy the entrypoint script
COPY generate.sh /usr/local/bin/generate.sh
RUN chmod +x /usr/local/bin/generate.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/generate.sh"]