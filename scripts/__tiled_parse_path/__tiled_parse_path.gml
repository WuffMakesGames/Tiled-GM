function __tiled_parse_path(_relative_path, _fullpath) {
	var _steps = string_count("../", _relative_path)
	var _path = string_replace_all(_relative_path, "../", "")
	
	// Get base directory
	var _pos = string_last_pos("/", _fullpath)
	repeat (_steps) _pos = string_last_pos_ext("/", _fullpath, _pos-1)
	var _base_dir = string_copy(_fullpath, 1, _pos)
	
	// Return absolute path
	return _base_dir + _path
}