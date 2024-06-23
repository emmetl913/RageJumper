shader_type canvas_item;

void fragment() {
    // Normalized coordinates for the fragment within the sprite (0.0 to 1.0)
    vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE.xy;
    
    // Define the colors
    vec4 endColor = vec4(1.0, 0.0, 0.0, 1.0); // Red
	vec4 middleColor = vec4(1.0,1.0,0.0,1.0); //yellow
    vec4 startColor = vec4(0.0, 1.0, 0.0, 1.0);   // Green
    
    // Interpolate between the start and end colors based on the vertical position (uv.y)
    vec4 color = mix(startColor, endColor, UV.y);
    
    // Set the output color
    COLOR = color;
}
