/// Returns the world map file at a specific point
/// @arg {Struct.TiledWorld} world
/// @arg {Real} x
/// @arg {Real} y
/// @return {String}
function world_map_at_pixel(_world, _x, _y) {
	return is_instanceof(_world, TiledWorld) ? _world.GetMapAtPixel(_x, _y) : ""
}