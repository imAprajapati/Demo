# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app/backend
WORKDIR /app/backend

# Copy the current directory contents into the container at /app/backend
COPY . /app/backend

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run uvicorn with your FastAPI app when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
