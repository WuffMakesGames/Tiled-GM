/// @arg {Struct.TiledMap} map
/// @return {Array<TiledLayer>}
function tiled_layer_get_all(_map) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.layers
	}
}