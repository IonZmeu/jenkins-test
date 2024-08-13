# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install PyInstaller
RUN pip install pyinstaller

# Build the standalone executable using PyInstaller
RUN pyinstaller --onefile --add-data 'index.html:.' app.py

# Expose the port the app runs on
EXPOSE 5000

# Command to run the executable
CMD ["./dist/app"]
