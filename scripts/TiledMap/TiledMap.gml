function TiledMap(_struct, _filename) constructor {
	path = _filename
	
	// Type error
	var _type = __tiled_struct_get_default(_struct, "type", -1)
	if (_type != "map") show_debug_message("[Tiled] Error loading map, wrong type: {0} - {1}", _filename, _type)
	
	// Load variables
	tilesets = []
	layers = []
	
	infinite	= __tiled_struct_get_default(_struct, "infinite", false)
	orientation	= __tiled_struct_get_default(_struct, "orientation", "orthogonal")
	renderorder	= __tiled_struct_get_default(_struct, "renderorder", "right-down")
		
	tileheight	= __tiled_struct_get_default(_struct, "tileheight", 32)
	tilewidth	= __tiled_struct_get_default(_struct, "tilewidth", 32)
	height		= __tiled_struct_get_default(_struct, "height", 32)
	width		= __tiled_struct_get_default(_struct, "width", 32)
	
	// Load tilesets
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Loading tileset references")
	var _tilesets = __tiled_struct_get_default(_struct, "tilesets", [])
	for (var _i = 0; _i < array_length(_tilesets); _i++) {
		var _tileset_ref = new TiledTilesetRef(_tilesets[_i], _filename)
		array_push(tilesets, _tileset_ref)
	}
	
	// Load layers
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Parsing layers")
	
	var _layers = __tiled_struct_get_default(_struct, "layers", [])
	var _layer_count = array_length(_layers)
	for (var _i = 0; _i < _layer_count; _i++) {
		__tiled_parse_layer(self, _layers[_i], (_layer_count - _i)*100)
	}
	
	//===============================================================
	#region Methods
	
	/// @return {Real}
	static GetWidth = function() {
		return width * tilewidth
	}
	
	/// @return {Real}
	static GetHeight = function() {
		return height * tileheight
	}
	
	#endregion
	//===============================================================
	#region Layers
	
	/// @arg {String,Struct.TiledLayer} layer_name
	/// @return {Bool}
	static LayerExists = function(_layer_name) {
		
		// Use built-in to find layer if struct
		if (is_instanceof(_layer_name, TiledLayer)) {
			return array_contains(layers, _layer_name)
		}
		
		// Must be string for next check
		if (!is_string(_layer_name)) return false;
		
		// Check for layer
		var _state = { name: _layer_name, layers: layers }
		with (_state) {
			output = array_find_index(layers, function(_element, _index) {
				return _element.name == name
			})
		}
		
		// Return if found result
		return _state.output > -1
	}
	
	/// @arg {String,Struct.TiledLayer} layer_id
	/// @return {Array}
	static LayerGetAllElements = function(_layer_id) {
		if (is_string(_layer_id)) _layer_id = LayerGetId(_layer_id)
		if (is_instanceof(_layer_id, TiledLayer)) return _layer_id.GetAllElements()
		return []
	}
	
	/// @arg {String,Struct.TiledLayer} layer_id
	/// @return {Real}
	static LayerGetDepth = function(_layer_id) {
		if (is_string(_layer_id)) _layer_id = LayerGetId(_layer_id)
		if (is_instanceof(_layer_id, TiledLayer)) return _layer_id.GetDepth()
		return -1
	}
	
	/// @arg {String} layer_name
	/// @return {Struct.TiledLayer}
	static LayerGetId = function(_layer_name) {
		if (!is_string(_layer_name)) return -1;
		
		// Check for layer
		var _state = { name: _layer_name, layers: layers }
		with (_state) {
			output = array_find_index(layers, function(_element, _index) {
				return _element.name == name
			})
		}
		
		// Return if found result
		return _state.output > -1 ? layers[_state.output] : -1
	}
	
	/// @arg {String,Struct.TiledLayer} layer_id
	/// @return {Bool}
	static LayerGetVisible = function(_layer_id) {
		if (is_string(_layer_id)) _layer_id = LayerGetId(_layer_id)
		if (is_instanceof(_layer_id, TiledLayer)) return _layer_id.GetVisible()
		return false
	}
	
	/// @arg {String,Struct.TiledLayer} layer_id
	/// @return {Real}
	static LayerGetX = function(_layer_id) {
		if (is_string(_layer_id)) _layer_id = LayerGetId(_layer_id)
		if (is_instanceof(_layer_id, TiledLayer)) return _layer_id.GetX()
		return -1
	}
	
	/// @arg {String,Struct.TiledLayer} layer_id
	/// @return {Real}
	static LayerGetY = function(_layer_id) {
		if (is_string(_layer_id)) _layer_id = LayerGetId(_layer_id)
		if (is_instanceof(_layer_id, TiledLayer)) return _layer_id.GetY()
		return -1
	}
	
	#endregion
	//===============================================================
	#region Elements
	
	// TODO: Refactor tilelayer to be a layer element
	/// @arg {String,Struct.TiledLayer} layer_id
	/// @return {Struct.TiledTileLayer}
	static TilelayerGetId = function(_layer_id) {
		if (is_string(_layer_id)) _layer_id = LayerGetId(_layer_id)
		if (is_instanceof(_layer_id, TiledLayer)) return _layer_id.GetTilelayer()
		return -1
	}
	
	#endregion
	//===============================================================
}