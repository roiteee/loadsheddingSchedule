extends Control

var schedule = {
	0: {
		"name": "Group 1",
		"sunday": ["05:00-14:00","18:00-22:00"]
		
		
	}
#	1: {
#		"name": "Group 2"
#	},
#	2: {
#		"name": "Group 3"
#	},
#	3: {
#		"name": "Group 4"
#	},
#	4: {
#		"name": "Group 5"
#	},
#	5: {
#		"name": "Group 6"
#	},
#	6: {
#		"name": "Group 7"
#	}
}

var info = {
	"from" : "2020:01:01"
}
var todayDateTime

var groupButton = "res://scenes/GroupButton.tscn"
var groupSpacer = "res://scenes/GroupSpacer.tscn"

func _ready():
	todayDateTime = OS.get_datetime()#OS.get_datetime_from_unix_time(OS.get_unix_time())
	print(todayDateTime)
	for i in schedule:
		var button = load(groupButton).instance()
		$HBoxContainer.add_child(button)
		button.text = str(schedule[i].sunday)
