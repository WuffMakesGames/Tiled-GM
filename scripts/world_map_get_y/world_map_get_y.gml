/// @arg {Struct.TiledWorld} world
/// @arg {String} filename
/// @return {Real}
function world_map_get_y(_world, _filename) {
	return is_instanceof(_world, TiledWorld) ? _world.GetMapY(_filename) : -1
}