/// @arg {Real} tiledata
function tiled_tile_get_rotate(_tiledata) {
	return _tiledata & TILED_ROTATED_HEXAGONAL_120_FLAG
}