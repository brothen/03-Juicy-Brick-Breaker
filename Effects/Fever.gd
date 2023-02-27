extends Node2D
var fog_density=0.11
var fog_d_target=0.3


func start_fever():
	
	$Tween.interpolate_property($Fog/ColorRect.material, "shader_param/WATER_COL:a", fog_density, fog_d_target, 10, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()
	fog_density=fog_d_target
	fog_d_target+=0.3
	fever()
	$Timer.start()

func end_fever():
	pass

func _on_Timer_timeout():
	if Global.feverish:
		$Tween.interpolate_property($WorldEnvironment.environment, "dof_blur_near_distance", 1.6, 4, 1, Tween.TRANS_BOUNCE, Tween.EASE_IN)
		$Tween.interpolate_property($WorldEnvironment.environment, "glow_bloom", 0.03, 0.2, 2, Tween.TRANS_BOUNCE, Tween.EASE_IN)
		$Tween.start()
		fever()
		$Timer.start()
		
	else:
		end_fever()

func fever():
	var ball_container = get_node_or_null("/root/Game/Ball_Container")
	if ball_container != null:
		ball_container.make_ball_fever()
