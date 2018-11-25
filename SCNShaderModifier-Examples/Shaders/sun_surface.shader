
#pragma transparent
#pragma body

float dotProductEdge = 0.5;

float dotProduct = dot(_surface.view, _surface.normal);
dotProduct = dotProduct < 0.0 ? 0.0 : dotProduct;

_surface.diffuse.rgb = vec3(1.0, 1.0, 0.0);

if (dotProduct <= dotProductEdge) {
	float a = dotProduct / dotProductEdge;
	_surface.diffuse = vec4(_surface.diffuse.rgb * a, a);
}
