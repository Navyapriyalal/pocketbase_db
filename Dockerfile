FROM alpine:latest

WORKDIR /app

# Download PocketBase (change version if needed)
RUN wget -O pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v0.21.3/pocketbase_0.21.3_linux_amd64.zip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip

# Make binary executable
RUN chmod +x pocketbase

# Declare the persistent volume
VOLUME /pb_data

# Start PocketBase with persistent storage
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:10000", "--dir", "/pb_data"]
