/// @arg {Struct.TiledTileLayer} tilelayer
/// @return {Real}
function tilelayer_get_tile_width(_tilelayer) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.GetTileWidth()
	}
}