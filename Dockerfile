# FROM arm64v8/python:3.9-slim
FROM arm64v8/python:3.11-slim-buster

# Set the working directory in the container.
WORKDIR /app

# Copy the project's requirements file into the container
COPY requirements.txt ./requirements.txt
# Upgrade pip for the latest features and install the project's Python dependencies.
RUN apt-get update && apt-get install gcc python3-dev -y
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the entire project into the container.
# This may include all code, assets, and configuration files required to run the application.
COPY . /app

# Expose port 8501
EXPOSE 8501

# Define the default command to run the app using Python's module mode.
CMD ["streamlit", "run", "app.py"]
