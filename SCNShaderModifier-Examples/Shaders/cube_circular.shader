
if (_geometry.position.y > 0.0) {
	_geometry.position.xz += vec2(
		0.5 * sin(3.0 * u_time),
		0.5 * cos(3.0 * u_time)
	) * (u_time < 3.0 ? u_time / 3.0 : 1.0);
}
