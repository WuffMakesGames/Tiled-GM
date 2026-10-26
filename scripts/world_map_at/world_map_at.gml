/// Returns the world map file overlapping the current object
/// @arg {Struct.TiledWorld} world
/// @arg {Real} x
/// @arg {Real} y
/// @return {String}
function world_map_at(_world, _x, _y) {
	return is_instanceof(_world, TiledWorld) ? _world.GetMapAt(self, _x, _y) : ""
}