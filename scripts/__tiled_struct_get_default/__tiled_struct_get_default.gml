function __tiled_struct_get_default(_struct, _name, _default_value) {
	return struct_get(_struct, _name) ?? _default_value
}