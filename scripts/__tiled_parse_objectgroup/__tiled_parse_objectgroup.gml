/// @arg {Struct} layer_data
/// @arg {String} basepath Path of the map file the room was in
/// @return {Struct.TiledLayer}
function __tiled_parse_objectgroup(_layer_data, _basepath, _depth) {
	var _layer = new TiledLayer(_layer_data, _depth)
	
	// Load object elements
	var _objects = struct_get(_layer_data, "objects") ?? []
	for (var i = 0; i < array_length(_objects); i++) {
		array_push(_layer.elements, new TiledElementObject(_objects[i], _basepath))
	}
	
	// Return new layer
	return _layer
}