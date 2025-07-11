echo "building dockerfile..."
docker build -t temperature-converter .

echo "running container..."
docker run -p 8080:8080 temperature-converter