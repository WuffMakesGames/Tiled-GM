/// Returns the index of a given tiledata
/// @arg {Real} tiledata
function tiled_tile_get_index(_tiledata) {
	return _tiledata & ~TILED_ALL_FLAGS
}