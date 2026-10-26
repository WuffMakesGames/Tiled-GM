/// Returns the vertical flip of a given tiledata
/// @arg {Real} tiledata
function tiled_tile_get_flip(_tiledata) {
	return _tiledata & TILED_FLIPPED_VERTICALLY_FLAG
}