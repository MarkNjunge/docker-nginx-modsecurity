set -e

# Docker hub username
USERNAME=marknjunge
# Image name
IMAGE=nginx-modsec

# Get Version
version=`cat VERSION`
echo "Version: $VERSION"

# Build
docker build -t $USERNAME/$IMAGE:latest .

# Tag version
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION