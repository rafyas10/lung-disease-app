# ===============================
# Dockerfile untuk auth-service
# ===============================
FROM golang:1.24.4-alpine

# Install git (dibutuhkan saat go get)
RUN apk add --no-cache git

# Set direktori kerja
WORKDIR /app

# Copy file dependency
COPY go.mod go.sum ./
RUN go mod download

# Copy semua source code
COPY . .

# Build binary
RUN go build -o main .

EXPOSE 8080

# Jalankan aplikasi
CMD ["./main"]
