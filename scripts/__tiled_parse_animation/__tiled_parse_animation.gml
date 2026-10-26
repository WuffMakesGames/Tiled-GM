function __tiled_parse_animation(animation) {
	var output = []
	
	// Parse animation
	for (var i = 0; i < array_length(animation); i++) {
		var frame = animation[i]
		array_push(output, {
			duration: frame.duration,
			tileid: frame.tileid,
		})
	}
	
	// Return animation
	return output
}