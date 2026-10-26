/// @arg {Struct.TiledWorld} world
/// @arg {String} filename
/// @return {Real}
function world_map_get_width(_world, _filename) {
	return is_instanceof(_world, TiledWorld) ? _world.GetMapWidth(_filename) : -1
}