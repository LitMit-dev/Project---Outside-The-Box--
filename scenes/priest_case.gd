extends Node2D

@export var DL: CanvasLayer
@export var ANBG: CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await confessional()
	await placeholder()
	await placeholder()
	await placeholder()
	await placeholder()
	await placeholder()
	await placeholder()
	await placeholder()
	

func confessional():
	ANBG.set_anim(ANBG.anim_index.priest_conf1, 3)
	ANBG.loop_anim(3, 0.4)
	DL.show()
	DL.swap_name("Bowie")
	DL.swap_dialogue("But whooooooooooooo\nWill love alladin saane?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Tis a pity she was a whore") #please ignore the david bowie placeholders
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Ground control to MAAAAAJor tom")
	DL.prog_text()
	await DL.advance_text
	DL.hide()
	ANBG.anim_state(false)

func cafe_1():
	pass

func placeholder():
	pass
