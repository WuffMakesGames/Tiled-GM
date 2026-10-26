function TiledTilesetRef(struct, fullpath) constructor {
	var _relative_path = __tiled_struct_get_default(struct, "source", "")
	var _path = __tiled_parse_path(_relative_path, fullpath)
	
	firstgid = __tiled_struct_get_default(struct, "firstgid", 1)
	source = tiled_load_tileset(_path)
	
}