# Start from a base Linux image (Ubuntu in this case)
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary tools and libraries
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    clang \
    cmake \
    cmake-format \
    gdb \
    git \
    gnuplot \
    python3 \
    python3-dev \
    python3-pip \
    sudo \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Google Test (gtest)
RUN mkdir /gtest && \
    cd /gtest && \
    wget https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz && \
    tar -xvzf release-1.11.0.tar.gz && \
    cd googletest-release-1.11.0 && \
    cmake . && \
    make && \
    make install

# Verify the installation of Clang, Git, CMake, Python, Google Test, and GNUPlot
RUN clang --version && \
    git --version && \
    cmake --version && \
    python3 --version && \
    gnuplot --version

# Set the working directory (optional)
WORKDIR /workspace

# Default command (optional)
CMD ["bash"]

