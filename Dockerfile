FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Install Git and any necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8080

# Copy the rest of the application code
COPY . .

# Run the bot
CMD ["python3", "bot.py"]
