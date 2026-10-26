/// @arg {Struct} layer_data
/// @arg {Real} depth
function TiledLayer(layer_data, _depth=0) constructor {
	type		= __tiled_struct_get_default(layer_data, "type", "layer")
	name		= __tiled_struct_get_default(layer_data, "name", "Layer")
	x			= __tiled_struct_get_default(layer_data, "x", 0)
	y			= __tiled_struct_get_default(layer_data, "y", 0)
	visible		= __tiled_struct_get_default(layer_data, "visible", true)
	opacity		= __tiled_struct_get_default(layer_data, "opacity", 1)
	depth		= _depth
	elements	= []
	
	//===============================================================
	#region Methods
	
	/// @return {Array}
	static GetAllElements = function() {
		return elements
	}
	
	/// @return {Real}
	static GetDepth = function() {
		return depth
	}
	
	/// @return {String}
	static GetName = function() {
		return name
	}
	
	/// @return {Real}
	static GetX = function() {
		return x
	}
	
	/// @return {Real}
	static GetY = function() {
		return y
	}
	
	/// @return {Bool}
	static GetVisible = function() {
		return visible
	}
	
	#endregion
	//===============================================================
	#region Elements
	
	/// @return {Struct.TiledTileLayer}
	static GetTilelayer = function() {
		// TODO: Make this layer elements
		if (type == "tilelayer") return self
		return -1
	}
	
	#endregion
	//===============================================================
}