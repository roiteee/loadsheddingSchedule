extends Button

func _ready():
	Global.GroupButton = self


func _on_Group1_pressed():
	Global.selectedGroup = $".".text
	Global.UI.updateUI()
	$".".pressed = true
