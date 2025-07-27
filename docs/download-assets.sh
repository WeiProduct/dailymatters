#!/bin/bash

# Download App Store badge
echo "Downloading App Store badge..."
curl -L "https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" -o "images/app-store-badge.svg"

# Create placeholder images for now
echo "Creating placeholder images..."

# Create a simple SVG hero mockup
cat > images/hero-mockup.svg << 'EOF'
<svg width="300" height="600" xmlns="http://www.w3.org/2000/svg">
  <rect width="300" height="600" fill="#f0f0f0" rx="30"/>
  <text x="150" y="300" text-anchor="middle" font-family="Arial" font-size="24" fill="#666">
    App Preview
  </text>
</svg>
EOF

# Create placeholder screenshots
for i in {1..4}; do
  cat > images/screenshot-${i}.svg << EOF
<svg width="250" height="540" xmlns="http://www.w3.org/2000/svg">
  <rect width="250" height="540" fill="#f8f8f8" rx="20"/>
  <text x="125" y="270" text-anchor="middle" font-family="Arial" font-size="20" fill="#888">
    Screenshot ${i}
  </text>
</svg>
EOF
done

# Create favicons from logo
echo "Creating favicons..."
sips -z 180 180 images/logo.png --out images/apple-touch-icon.png
sips -z 32 32 images/logo.png --out images/favicon-32x32.png
sips -z 16 16 images/logo.png --out images/favicon-16x16.png

echo "Done! Assets created."