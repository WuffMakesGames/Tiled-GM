/// Returns the horizontal mirror of a given tiledata
/// @arg {Real} tiledata
function tiled_tile_get_mirror(_tiledata) {
	return _tiledata & TILED_FLIPPED_HORIZONTALLY_FLAG
}