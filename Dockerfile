# Use the official Python image as base
FROM python:3

# Install python3 and pip (if not already present)
RUN apt-get update && apt-get install -y python3 python3-pip

# Install the latest pylint
RUN pip install --upgrade pylint

# Set up a working directory
WORKDIR /app

# Copy your project files into the Docker image
COPY . /app

# Add the Python and pip executable paths to the PATH
ENV PATH="/usr/local/bin:/usr/bin:${PATH}"
