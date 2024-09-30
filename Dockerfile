# Start with an Ubuntu base image (or any Linux distribution)
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Add TensorFlow Serving apt repository
RUN echo "deb [signed-by=/usr/share/keyrings/tensorflow-serving.gpg] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" \
    | tee /etc/apt/sources.list.d/tensorflow-serving.list > /dev/null

# Add the TensorFlow Serving GPG key
RUN curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg \
    | tee /usr/share/keyrings/tensorflow-serving.gpg > /dev/null

# Update and install TensorFlow Serving
RUN apt-get update && apt-get install -y tensorflow-model-server

# Copy the model and config files into the container
COPY ./output/serving_model /models/cc-model
COPY ./config /model_config

# Set environment variables for model serving
ENV MODEL_NAME=cc-model
ENV MODEL_BASE_PATH=/models
ENV MONITORING_CONFIG="/model_config/prometheus.config"
ENV PORT=8501

# Copy the entrypoint script into the container
WORKDIR /app
COPY ./tf_serving_entrypoint.sh /app/tf_serving_entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /app/tf_serving_entrypoint.sh

# Expose TensorFlow Serving ports
EXPOSE 8500 8501

# Run the TensorFlow Serving entrypoint script
CMD ["/app/tf_serving_entrypoint.sh"]
