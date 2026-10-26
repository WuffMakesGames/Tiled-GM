/// Returns true if the world contains the map file
/// @arg {Struct.TiledWorld} world
/// @arg {String} filename
/// @return {Bool}
function world_map_exists(_world, _filename) {
	return is_instanceof(_world, TiledWorld) && _world.MapExists(_filename)
}