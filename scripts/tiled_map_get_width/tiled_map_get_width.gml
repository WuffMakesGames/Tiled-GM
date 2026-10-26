/// Returns the width of the map in pixels.
/// @arg {Struct.TiledMap} map
/// @return {Real}
function tiled_map_get_width(_map) {
	return is_instanceof(_map, TiledMap) ? _map.GetWidth() : -1
}