shader_type canvas_item;

// Define the circle's center as two separate floats with range hints
uniform float circle_center_x : hint_range(0.0, 1.0) = 0.5;
uniform float circle_center_y : hint_range(0.0, 1.0) = 0.5;

uniform float radius : hint_range(0.0, 1.0) = 0.5;
void fragment() {
    // Assume container's size is normalized, so adjust radius dynamically
    vec2 center = vec2(0.5, 0.5); // Center of the container
    float dist = distance(UV, center);

    // Adjust the radius dynamically to match your desired scale
    float dynamic_radius = radius; // Or use a scale factor like 0.5 * min(SCREEN_SIZE.x, SCREEN_SIZE.y)

    if (dist > dynamic_radius) {
        discard;
    }

    COLOR = texture(TEXTURE, UV);
}
