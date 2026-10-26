/// @arg {Struct.TiledElement} element
/// @return {Constant.LayerElementType}
function tiled_layer_get_element_type(_element) {
	if (is_instanceof(_element, TiledElement)) {
		return _element.layerelementtype
	}
}