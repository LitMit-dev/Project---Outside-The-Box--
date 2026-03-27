extends Area2D

enum actions {
	
	SPEAK = 0,
	END_PUZZLE
	
}

var inside = false
@export var word: String = ""
@export var actionID: int = 0
@export var bodyLink: CharacterBody2D
@export var additional_links: Array

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside:
		logic()

func logic():
	if bodyLink.text == word and actionID == 0:
		print("AA")
		if word == "SWAP_":
			globdat.cur_rat = additional_links[0]
		inside = false

func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = false
