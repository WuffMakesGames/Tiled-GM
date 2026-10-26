/// Merges two structs, optionally overriding existing items in struct a
/// @arg {Struct} a
/// @arg {Struct} b
/// @returns {Struct}
function __tiled_struct_merge(_a, _b, _override=false) {
	var _names = struct_get_names(_b)
	for (var i = 0; i < array_length(_names); i++) {
		var _name = _names[i]
		if (_override || !struct_exists(_a, _name)) {
			struct_set(_a, _name, struct_get(_b, _name))
		}
	}
	return _a
}