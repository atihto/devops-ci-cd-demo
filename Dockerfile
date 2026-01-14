FROM python:3.10-slim

# Create non-root user
RUN useradd -m appuser

WORKDIR /app

# Copy dependency file first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Switch to non-root user
USER appuser

# Run app
CMD ["python", "app.py"]
