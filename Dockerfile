# Use the official Python image as a base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory in the container
WORKDIR /app

# Copy requirements (if you have any) and install dependencies
# Since you didn't provide a requirements.txt, we'll install Flask directly
RUN pip install --no-cache-dir Flask

# Copy the application code to the container
COPY app.py .

# Expose the port your app runs on
EXPOSE 8080

# Command to run the application
CMD ["python", "app.py"]
