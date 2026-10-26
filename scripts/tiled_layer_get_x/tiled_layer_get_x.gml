/// @arg {Struct.TiledMap} map
/// @arg {String,Struct.TiledLayer} layer_id
/// @return {Real}
function tiled_layer_get_x(_map, _layer_id) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.LayerGetX(_layer_id)
	}
}