#!/bin/bash
set -euo pipefail

# Define image name and registry tag
IMAGE_NAME="novnc"
REGISTRY="10.1.10.145:6001"
FULL_TAG="$REGISTRY/$IMAGE_NAME:latest"

# Build Docker image from Dockerfile in current directory
echo "📦 Building Docker image..."
docker build -t "$IMAGE_NAME:latest" .

# Tag the image for your private registry
echo "🏷️ Tagging image as $FULL_TAG"
docker tag "$IMAGE_NAME:latest" "$FULL_TAG"

# Push it
echo "🚀 Pushing image to $REGISTRY"
docker push "$FULL_TAG"

echo "✅ Done: pushed $FULL_TAG"

