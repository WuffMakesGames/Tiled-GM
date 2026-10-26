/// Parses a layer and inserts it into the map
/// @arg {Struct.TiledMap} map 
/// @arg {Struct} layer_data
function __tiled_parse_layer(_map, _layer_data, _depth) {
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Parsing layer {0}", _layer_data.name)
	
	// Parse layer type
	switch (_layer_data.type) {
		// Parse tilemap layer
		case "tilelayer": {
			for (var i = 0; i < array_length(_map.tilesets); i++) {
				var _tileset_ref = _map.tilesets[i]
				var _layer = new TiledTileLayer(_layer_data, _tileset_ref, _depth)
				
				// Discard empty tile layer
				if (_layer.is_empty) {
					show_debug_message("[Tiled] Discarded empty tile layer: {0}", _layer.name)
					
				// Push layer into map
				} else {
					array_push(_map.layers, _layer)
					
				}
			}
			break
		}
		
		// Parse object group layer
		case "objectgroup": {
			array_push(_map.layers, __tiled_parse_objectgroup(_layer_data, _map.path, _depth))
		}
	}
}