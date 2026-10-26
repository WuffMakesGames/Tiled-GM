/// Parses a property array into a readable array
/// @arg {Array} list Raw list of unprocessed Tiled properties
/// @arg {Struct} base Struct to load properties into
function __tiled_parse_properties_list(properties) {
	var _output = []
	
	// Parse properties
	for (var i = 0; i < array_length(properties); i++) {
		var _property = properties[i]
		
		// Parse raw value
		switch (_property.type) {
			// Color property: argb
			case "color": {
				array_push(_output, real("0x" + string_copy(_property.value, 3, 6)))
				break
			}
			
			// List property -> recursive
			case "list": {
				array_push(_output, __tiled_parse_properties_list(_property.value))
				break
			}
			
			// Object, bool, file, int, float, string
			// Copy raw value into struct
			default: {
				array_push(_output, _property.value)
				break
			}
		}
	}
	
	// Return properties
	return _output
}