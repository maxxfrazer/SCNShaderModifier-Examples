
_geometry.position.xz += _geometry.position.xz
	* sin(30.0 * _geometry.position.y - 3.0 * u_time) * 0.1
	* (u_time < 3.0 ? u_time / 3.0 : 1.0);
