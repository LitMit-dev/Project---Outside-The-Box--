extends Area2D



var active = true

var inside = false
@export_multiline() var word: String = ""
@export var color: Color
@export var bodyLink: CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside and active:
		logic()
		

func logic():
	pass
	
	
func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name or bodyLink.transing: return
	bodyLink.alert = true
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	bodyLink.alert = false
	inside = false
