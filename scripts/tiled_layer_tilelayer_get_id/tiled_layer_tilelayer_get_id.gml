/// @arg {Struct.TiledMap} map
/// @arg {String,Struct.TiledLayer} layer_id
/// @return {Struct.TiledTileLayer}
function tiled_layer_tilelayer_get_id(_map, _layer_id) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.TilelayerGetId(_layer_id)
	}
}