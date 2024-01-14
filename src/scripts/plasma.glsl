// Adapted from https://github.com/polyfloyd/cube-shaders/tree/master/anim

#pragma use "../lib/libcube-2chains.glsl"
#pragma use "../lib/libcolor.glsl"
#pragma use "../lib/libnoise.glsl"

const float speed = 0.1;

void mainCube(out vec4 fragColor, in vec3 fragCoord) {
	float h = mod(perlin_noise(fragCoord * 3 + iTime * speed) + iTime * speed, 1);
	fragColor = vec4(hsvToRGB(vec3(h, 1, 1)), 1.0);
}

#ifndef _EMULATOR
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	mainCube(fragColor, cube_map_to_3d(fragCoord));
}
#endif
