function TiledWorld(_struct, _filename) constructor {
	path = _filename
	
	// Type error
	var _type = __tiled_struct_get_default(_struct, "type", -1)
	if (_type != "world") show_debug_message("[Tiled] Error loading world, wrong type: {0} - {1}", _filename, _type)
	
	// Load variables
	maps = __tiled_struct_get_default(_struct, "maps", [])
	maps_lookup = {}
	
	// Parse filenames
	for (var _i = 0; _i < array_length(maps); _i++) {
		var _map = maps[_i]
		_map.fileName = __tiled_parse_path(_map.fileName, _filename)
		struct_set(maps_lookup, _map.fileName, _map)
	}
	
	//===============================================================
	#region Methods
	
	/// @arg {String} filename
	/// @return {Bool}
	static MapExists = function(_filename) {
		return struct_exists(maps_lookup, _filename)
	}
	
	/// @arg {String} filename
	/// @return {Struct}
	static GetMapInfo = function(_filename) {
		return struct_get(maps_lookup, _filename)
	}
	
	/// @arg {Id.Instance} obj
	/// @arg {Real} x
	/// @arg {Real} y
	/// @return {String}
	static GetMapAt = function(_obj, _x, _y) {
		var _bbox_l = _x + (_obj.bbox_left - _obj.x)
		var _bbox_t = _y + (_obj.bbox_top - _obj.y)
		var _bbox_r = _x + (_obj.bbox_right - _obj.x)
		var _bbox_b = _y + (_obj.bbox_bottom - _obj.y)
		
		// Check overlapping
		for (var _i = 0; _i < array_length(maps); _i++) {
			var _map = maps[_i]
			if (_bbox_l <= _map.x + _map.width && _bbox_t <= _map.y + _map.height && _bbox_r >= _map.x && _bbox_b >= _map.y) {
				return _map.fileName
			}
		}
		
		// Return no map
		return ""
	}
	
	/// @arg {Id.Instance} obj
	/// @arg {Real} x
	/// @arg {Real} y
	/// @return {Array<String>}
	static GetMapListAt = function(_obj, _x, _y) {
		var _bbox_l = _x + (_obj.bbox_left - _obj.x)
		var _bbox_t = _y + (_obj.bbox_top - _obj.y)
		var _bbox_r = _x + (_obj.bbox_right - _obj.x)
		var _bbox_b = _y + (_obj.bbox_bottom - _obj.y)
		
		var _output = []
		
		// Check overlapping
		for (var _i = 0; _i < array_length(maps); _i++) {
			var _map = maps[_i]
			if (_bbox_l <= _map.x + _map.width && _bbox_t <= _map.y + _map.height && _bbox_r >= _map.x && _bbox_b >= _map.y) {
				array_push(_output, _map.fileName)
			}
		}
		
		// Return maps
		return _output
	}
	
	/// @arg {Struct.TiledWorld} world
	/// @arg {Real} x
	/// @arg {Real} y
	/// @return {String}
	static GetMapAtPixel = function(_x, _y) {
		for (var _i = 0; _i < array_length(maps); _i++) {
			var _map = maps[_i]
			if (point_in_rectangle(_x - _map.x, _y - _map.y, 0, 0, _map.width, _map.height)) {
				return _map.fileName
			}
		}
		
		// Return no map
		return ""
	}
	
	/// @arg {String} filename
	/// @return {Real}
	static GetMapWidth = function(_filename) {
		if (MapExists(_filename)) return GetMapInfo(_filename).width
		return -1
	}
	
	/// @arg {String} filename
	/// @return {Real}
	static GetMapHeight = function(_filename) {
		if (MapExists(_filename)) return GetMapInfo(_filename).height
		return -1
	}
	
	/// @arg {String} filename
	/// @return {Real}
	static GetMapX = function(_filename) {
		if (MapExists(_filename)) return GetMapInfo(_filename).x
		return -1
	}
	
	/// @arg {String} filename
	/// @return {Real}
	static GetMapY = function(_filename) {
		if (MapExists(_filename)) return GetMapInfo(_filename).y
		return -1
	}
	
	#endregion
	//===============================================================
}