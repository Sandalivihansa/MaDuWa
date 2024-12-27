# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies from requirements.txt
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt --no-cache-dir

# Expose port for web services (optional, for Flask/Django apps)
EXPOSE 5000

# Run your application (change to your actual start command)
CMD ["python", "your_app.py"]
