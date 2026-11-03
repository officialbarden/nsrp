#version 150

in vec3 Position;
in vec2 UV0;
in vec4 Color;

uniform sampler2D Sampler0;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec2 texCoord0;
out vec4 vertexColor;

vec2[] corners = vec2[](vec2(0, 0), vec2(0, 1), vec2(1, 1), vec2(1, 0));

void main() {
    texCoord0 = UV0;
    vertexColor = Color;
    vec3 pos = Position;
    vec4 color = texture(Sampler0, vec2(0));

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);
    if (ivec4(round(color*255)) == ivec4(1,1,1,2)) {
        vec2 corner = corners[gl_VertexID % 4];
        texCoord0 = corner;
        pos.xy = (corner-0.5) * 512;
        gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);
        gl_Position.xy += vec2(1,-1);
    }
}
