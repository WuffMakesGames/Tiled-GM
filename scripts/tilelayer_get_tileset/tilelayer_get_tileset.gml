/// @arg {Struct.TiledTileLayer} tilelayer
/// @return {Struct.TiledTileset}
function tilelayer_get_tileset(_tilelayer) {
	if (is_instanceof(_tilelayer, TiledTileLayer)) {
		return _tilelayer.GetTileset()
	}
}