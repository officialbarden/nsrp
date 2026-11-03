#version 150

uniform sampler2D DiffuseSampler;
uniform float PixelStrength;
uniform vec2 OutSize;

in vec2 texCoord;
out vec4 fragColor;

void main() {
    // Calculate pixel size based on strength
    vec2 pixelSize = (PixelStrength / OutSize);

    // Snap coordinates to pixel grid
    vec2 snappedCoord = floor(texCoord / pixelSize) * pixelSize + (pixelSize / 2.0);

    // Sample color
    fragColor = texture(DiffuseSampler, snappedCoord);
}