# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variable to ensure Python outputs everything to the console
ENV PYTHONUNBUFFERED 1

# Install system dependencies that may be required by some Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    libpq-dev \
    && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt /app/

# Upgrade pip and install dependencies from requirements.txt
RUN pip install --upgrade pip setuptools wheel \
    && pip install -U -r requirements.txt --no-cache-dir --verbose

# Copy the rest of the application files to the container
COPY . /app/

# Command to run the application
CMD ["bash", "start"]

