/// @arg {Struct.TiledMap} map
/// @arg {String,Struct.TiledLayer} layer_id
/// @return {Real}
function tiled_layer_get_depth(_map, _layer_id) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.LayerGetDepth(_layer_id)
	}
}