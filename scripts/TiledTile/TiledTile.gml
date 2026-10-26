function TiledTile(struct) constructor {
	probability = __tiled_struct_get_default(struct, "probability", 1.0)
	type		= __tiled_struct_get_default(struct, "type", "")
	id			= __tiled_struct_get_default(struct, "id", 0)
	
	var _properties = __tiled_struct_get_default(struct, "properties", [])
	var _animation = __tiled_struct_get_default(struct, "animation", [])
	properties = __tiled_parse_properties(_properties)
	animation = __tiled_parse_animation(_animation)
	
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Loaded tile: {0}", self)
}