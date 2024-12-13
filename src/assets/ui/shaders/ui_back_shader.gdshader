shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform float blur_radius : hint_range(0.0, 10.0) = 4.0;  // Control the blur intensity
uniform int samples : hint_range(1, 20) = 8;  // Number of samples for the blur
uniform float darken_factor : hint_range(0.0, 1.0) = 0.90;  // Adjusts the darkening effect (0 = no darkening, 1 = fully black)

void fragment() {
    vec2 tex_size = vec2(textureSize(screen_texture, 0));  // Screen texture size
    vec2 uv = SCREEN_UV;  // Get the screen's UV coordinates

    vec4 color = vec4(0.0);
    float total = 0.0;

    // Apply a Gaussian blur by sampling neighboring pixels
    for (int x = -samples; x <= samples; x++) {
        for (int y = -samples; y <= samples; y++) {
            float weight = 1.0 - length(vec2(float(x), float(y))) / float(samples);  // Cast x and y to float
            vec2 offset = vec2(float(x), float(y)) * blur_radius / tex_size;  // Cast x and y to float
            color += texture(screen_texture, uv + offset) * weight;
            total += weight;
        }
    }
    color /= total;  // Normalize the color

    // Darken the final color
    color.rgb *= darken_factor;  // Multiply RGB by the darken_factor
    color.a = 0.5;  // Add some transparency for a frosted-glass effect

    COLOR = color;
}
