/// @arg {Struct.TiledMap} map
/// @arg {String} layer_name
/// @return {Struct.TiledLayer}
function tiled_layer_get_id(_map, _layer_name) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.LayerGetId(_layer_name)
	}
}