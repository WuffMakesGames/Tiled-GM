/// @arg {Struct.TiledTileLayer} tilelayer
/// @arg {Real} tiledata
/// @arg {Real} cell_x
/// @arg {Real} cell_y
function tilelayer_set(_tilelayer, _tiledata, _cell_x, _cell_y) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.Set(_tiledata, _cell_x, _cell_y)
	}
}