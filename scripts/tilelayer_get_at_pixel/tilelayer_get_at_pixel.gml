/// @arg {Struct.TiledTileLayer} tilelayer
/// @arg {Real} x
/// @arg {Real} y
/// @return {Real}
function tilelayer_get_at_pixel(_tilelayer, _x, _y) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.GetAtPixel(_x, _y)
	}
}