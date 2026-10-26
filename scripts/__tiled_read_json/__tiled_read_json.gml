/// Reads a json file and returns a struct
/// Returns an empty struct if the file doesn't exist
/// @arg {String} filename
/// @returns {Struct}
function __tiled_read_json(_filename) {
	if (!file_exists(_filename)) return {}
	var _buffer = buffer_load(_filename)
	var _text = buffer_read(_buffer, buffer_text)
	buffer_delete(_buffer)
	return json_parse(_text)
}