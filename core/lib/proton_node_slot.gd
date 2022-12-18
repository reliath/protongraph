class_name ProtonNodeSlot
extends RefCounted

# Stores a description of a single slot in a ProtonNode
# A slot is either an Input, Output or Extra.

# General properties
var name: String
var type: int
var options: SlotOptions

# Type mirroring related properties
var mirror_type_from
var original_type: int

# Connections related properties
var allow_multiple_connections := false

# Values related properties
var local_value # What's displayed on the graph node UI
var computed_value := [] # What's generated by the node
var computed_value_ready := false # Set to true when _generate_output is complete.

## Helper methods

func get_computed_value_copy() -> Array:
	var res := []

	for item in computed_value:
		if item is Node:
			res.push_back(item.duplicate(7))
		if item is Resource:
			res.push_back(item.duplicate(true))

	return res
