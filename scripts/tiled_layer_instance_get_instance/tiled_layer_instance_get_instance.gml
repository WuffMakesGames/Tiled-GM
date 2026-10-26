/// @arg {Struct.TiledElement} element
/// @return {Constant.LayerElementType}
function tiled_layer_instance_get_instance(_element) {
	if (is_instanceof(_element, TiledElementObject)) {
		return _element.instance
	}
	return noone
}