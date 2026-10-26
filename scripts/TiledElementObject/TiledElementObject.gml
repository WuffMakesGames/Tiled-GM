/// @arg {Struct} struct
/// @arg {String} basepath
function TiledElementObject(_struct, _basepath) : TiledElement(layerelementtype_instance) constructor {
	var _raw_properties = struct_get(_struct, "properties") ?? []
	
	// Variables
	instance = _struct
	instance.properties = {}
	
	// Load template
	var _template_relative_path = struct_get(_struct, "template") ?? ""
	var _template = tiled_load_template(__tiled_parse_path(_template_relative_path, _basepath))
	
	if (_template != -1) {
		__tiled_struct_merge(instance, _template.instance)
		instance.properties = __tiled_parse_properties(_template.properties)
		prints("Template properties loaded", instance.properties)
	}
	
	// Load properties after template
	instance.properties = __tiled_parse_properties(_raw_properties, instance.properties)
	prints("Object properties loaded", instance.properties)
	
}