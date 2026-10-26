/// Returns the height of the map in pixels.
/// @arg {Struct.TiledMap} map
/// @return {Real}
function tiled_map_get_height(_map) {
	return is_instanceof(_map, TiledMap) ? _map.GetHeight() : -1
}