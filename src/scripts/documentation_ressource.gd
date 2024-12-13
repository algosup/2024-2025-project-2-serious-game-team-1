extends Resource

class_name Documentation_Resource

@export var Documentation_name : String
@export_multiline var Documentation_explanation : String
@export var Documentation_source : Array[String] = []

func Documentation_source_to_text():
	var Documentation_source_text : String = "Source : "
	for i in range(len(Documentation_source)):
		if i <= len(Documentation_source)-2:
			Documentation_source_text += Documentation_source[i] + ", "
		if i == len(Documentation_source)-1:
			Documentation_source_text += Documentation_source[i]
	return Documentation_source_text
