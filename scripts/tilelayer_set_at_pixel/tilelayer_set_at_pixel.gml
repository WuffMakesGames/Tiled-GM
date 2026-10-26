/// @arg {Struct.TiledTileLayer} tilelayer
/// @arg {Real} tiledata
/// @arg {Real} x
/// @arg {Real} y
function tilelayer_set_at_pixel(_tilelayer, _tiledata, _x, _y) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.SetAtPixel(_tiledata, _x, _y)
	}
}