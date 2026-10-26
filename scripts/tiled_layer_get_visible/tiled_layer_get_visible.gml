/// @arg {Struct.TiledMap} map
/// @arg {String,Struct.TiledLayer} layer_id
/// @return {Bool}
function tiled_layer_get_visible(_map, _layer_id) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.LayerGetVisible(_layer_id)
	}
}