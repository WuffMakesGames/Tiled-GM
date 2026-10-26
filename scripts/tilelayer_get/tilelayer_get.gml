/// @arg {Struct.TiledTileLayer} tilelayer
/// @arg {Real} cell_x
/// @arg {Real} cell_y
/// @return {Real}
function tilelayer_get(_tilelayer, _cell_x, _cell_y) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.Get(_cell_x, _cell_y)
	}
}