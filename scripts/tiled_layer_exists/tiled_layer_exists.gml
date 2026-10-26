/// @arg {Struct.TiledMap} map
/// @arg {String,Struct.TiledLayer} layer_name
/// @return {Bool}
function tiled_layer_exists(_map, _layer_name) {
	if (is_instanceof(_map, TiledMap)) {
		return _map.LayerExists(_layer_name)
	}
}