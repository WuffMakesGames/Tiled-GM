/// @arg {Struct.TiledWorld} world
/// @arg {String} filename
/// @return {Real}
function world_map_get_x(_world, _filename) {
	return is_instanceof(_world, TiledWorld) ? _world.GetMapX(_filename) : -1
}