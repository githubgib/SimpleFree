# Use the official Python image as base
FROM python:3.8

# Install python3 and pip (if not already present)
RUN apt-get update && apt-get install -y python3 python3-pip

# Create cache directory
# RUN mkdir -p /tmp/.pylint_cache && chmod -R 777 /tmp/.pylint_cache

# Install the latest pylint
# RUN pip install pylint==2.11
RUN pip install --upgrade pylint
RUN pylint --version

# Set up a working directory
WORKDIR /app

# Copy your project files into the Docker image
COPY . /app

# Add the Python and pip executable paths to the PATH
ENV PATH="/usr/local/bin:/usr/bin:${PATH}"
