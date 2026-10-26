/// Parses a property list into a readable struct
/// @arg {Array} properties Raw list of unprocessed Tiled properties
/// @arg {Struct} base Struct to load properties into
function __tiled_parse_properties(properties, base = {}) {
	
	// Parse properties
	for (var i = 0; i < array_length(properties); i++) {
		var _property = properties[i]
		
		// Parse raw value
		switch (_property.type) {
			// Color property: argb
			case "color": {
				struct_set(base, _property.name, real("0x" + string_copy(_property.value, 3, 6)))
				break
			}
			
			// List property -> recursive
			case "list": {
				struct_set(base, _property.name, __tiled_parse_properties_list(_property.value))
				break
			}
			
			// Object, bool, file, int, float, string
			// Copy raw value into struct
			default: {
				struct_set(base, _property.name, _property.value)
				break
			}
		}
	}
	
	// Return properties
	return base
}