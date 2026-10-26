/// @arg {Struct.TiledLayer} layer_id
/// @return {String}
function tiled_layer_get_name(_layer_id) {
	if (is_instanceof(_layer_id, TiledLayer)) {
		return _layer_id.GetName()
	}
}