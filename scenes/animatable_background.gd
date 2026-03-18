extends CanvasLayer

var active_anim = false

var bg_index = {
	
	priest_conf1 = "res://assets/priest_case/bgs/priestcase01.png",
	priest_conf2 = "res://assets/priest_case/bgs/priestcase02.png",
	
	
}

var anim_index = {
	
	priest_conf1 = "res://assets/priest_case/anm/priestcase01-curt.png",
	priest_conf2 = "res://assets/priest_case/anm/priestcase02-rev.png",
	
}

func swap_bg(which):
	$BG.texture = load(which)

func set_anim(path, framecount):
	$ANIM_LAYER.hide()
	$ANIM_LAYER.frame = 0
	$ANIM_LAYER.texture = load(path)
	$ANIM_LAYER.hframes = framecount
	$ANIM_LAYER.show()
	active_anim = true

func anim_state(state=false):
	active_anim = state

func end_anim():
	active_anim = false
	$ANIM_LAYER.hide()
	$ANIM_LAYER.frame = 0

func loop_anim(framecount, persec):
	while active_anim:
		await play_anim_once(framecount, persec)
	$ANIM_LAYER.frame = 0

func play_anim_once(framecount, persec):
	for i in range(framecount):
		await get_tree().create_timer(persec).timeout
		$ANIM_LAYER.frame = i
