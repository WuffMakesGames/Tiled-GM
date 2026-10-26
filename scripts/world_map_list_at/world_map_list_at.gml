/// Returns an array of world map files overlapping the current object
/// @arg {Struct.TiledWorld} world
/// @arg {Real} x
/// @arg {Real} y
/// @return {Array<String>}
function world_map_list_at(_world, _x, _y) {
	return is_instanceof(_world, TiledWorld) ? _world.GetMapListAt(self, _x, _y) : ""
}