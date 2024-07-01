extends Node2D

@onready var door = get_parent().get_node("DoorNode")



func _on_sacred_gem_node_gem_collected():
	print("gust gem ging")
	$AfterGem.visible = true
	$Label8.visible = true
	$Label9.visible = true
	$Label10.visible = true
	$Label11.visible = true
	$Label12.visible = true
	
	$Label.visible = false
	$Label2.visible = false
	$Label3.visible = false
	$Label4.visible = false
	$Label5.visible = false
	$Label6.visible = false
	$Label7.visible = false

