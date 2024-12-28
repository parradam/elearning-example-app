# Pull official base Python Docker image
FROM python:3.12.2

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /code

# Install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# Collect static files
RUN python manage.py collectstatic --settings=educa.settings.prod

# Copy the Django project
COPY . .