# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
# (if you have any dependencies)
RUN pip install --no-cache-dir -r requirements.txt

# Run ops.py when the container launches
CMD ["python", "ops.py"]
