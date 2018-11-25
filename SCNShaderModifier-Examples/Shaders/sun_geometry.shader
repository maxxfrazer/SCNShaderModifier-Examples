
float theta1 = atan2(_geometry.position.x, _geometry.position.y);
float theta2 = atan2(_geometry.position.x, _geometry.position.z);
float pi = 3.14159;

_geometry.position.xyz += _geometry.position.xyz * 0.2
	* sin(theta1 * pi - u_time * 2) * sin(6.0 * theta1)
	* cos(7.0 * theta2);
