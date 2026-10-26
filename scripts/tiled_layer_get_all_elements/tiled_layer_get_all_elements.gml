/// @arg {Struct.TiledMap} map
/// @arg {String,Struct.TiledLayer} layer_id
/// @return {Array}
function tiled_layer_get_all_elements(_map, _layer_id) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.LayerGetAllElements(_layer_id)
	}
}