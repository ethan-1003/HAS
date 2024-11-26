FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y jq \
    && apt-get clean

# Copy scripts
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Run the GPIO script
CMD [ "/run.sh" ]
