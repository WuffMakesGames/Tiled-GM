/// @arg {Struct.TiledTileLayer} tilelayer
/// @return {Real}
function tilelayer_get_height(_tilelayer) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.GetHeight()
	}
}