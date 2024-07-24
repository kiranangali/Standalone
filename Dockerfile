# Use an official Prometheus runtime as a parent image
FROM prom/prometheus:latest

# Copy your Prometheus configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Optionally, copy any additional configuration files or scripts
# COPY alert.rules /etc/prometheus/alert.rules

# Set metadata for Prometheus
# LABEL maintainer="Your Name <your.email@example.com>"

# Expose Prometheus' default port
EXPOSE 9090

# Start Prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
      "--storage.tsdb.path=/prometheus", \
      "--web.console.libraries=/etc/prometheus/console_libraries", \
      "--web.console.templates=/etc/prometheus/consoles" ]