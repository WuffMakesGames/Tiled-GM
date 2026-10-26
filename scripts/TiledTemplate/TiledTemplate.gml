function TiledTemplate(_struct, _filename) constructor {
	path = _filename
	
	// Type error
	var _type = __tiled_struct_get_default(_struct, "type", -1)
	if (_type != "template") show_debug_message("[Tiled] Error loading template, wrong type: {0} - {1}", _filename, _type)
	
	// Variables
	var _object = __tiled_struct_get_default(_struct, "object", {})
	
	// Load variables
	properties = struct_get(_object, "properties") ?? []
	instance = _object
	
}