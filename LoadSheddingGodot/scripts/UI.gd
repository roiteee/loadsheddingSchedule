extends Control

var schedule = {
	0: {
		"name": "Group 1",
		"schedule": {
			"Sunday": ["05:00-14:00","18:00-22:00"],
			"Monday":["11:00-19:00"],
			"Tuesday":["03:00-10:00", "14:00-20:00"],
			"Wednesday":["06:00-15:00","19:00-23:00"],
			"Thursday":["10:00-16:00", "20:00-24:00"],
			"Friday":["04:00-12:00","16:00-22:00"],
			"Saturday":["04:00-11:00","15:00-21:00"]
		}
		
	},
	1: {
		"name": "Group 2",
		"schedule" :{
			"Sunday":["04:00-11:00","15:00-21:00"],
			"Monday": ["05:00-14:00","18:00-22:00"],
			"Tuesday":["11:00-19:00"],
			"Wednesday":["03:00-10:00", "14:00-20:00"],
			"Thursday":["06:00-15:00","19:00-23:00"],
			"Friday":["10:00-16:00", "20:00-24:00"],
			"Saturday":["04:00-12:00","16:00-22:00"]
		}
		
	},
	2: {
		"name": "Group 3",
		"schedule": {
			"Sunday":["04:00-12:00","16:00-22:00"],
			"Monday":["04:00-11:00","15:00-21:00"],
			"Tuesday": ["05:00-14:00","18:00-22:00"],
			"Wednesday":["11:00-19:00"],
			"Thursday":["03:00-10:00", "14:00-20:00"],
			"Friday":["06:00-15:00","19:00-23:00"],
			"Saturday":["10:00-16:00", "20:00-24:00"]
		}
		
	},
	3: {
		"name": "Group 4",
		"schedule": {
			"Sunday":["10:00-16:00", "20:00-24:00"],
			"Monday":["04:00-12:00","16:00-22:00"],
			"Tuesday":["04:00-11:00","15:00-21:00"],
			"Wednesday": ["05:00-14:00","18:00-22:00"],
			"Thursday":["11:00-19:00"],
			"Friday":["03:00-10:00", "14:00-20:00"],
			"Saturday":["06:00-15:00","19:00-23:00"]
		}
		
	},
	4: {
		"name": "Group 5",
		"schedule": {
			"Sunday":["06:00-15:00","19:00-23:00"],
			"Monday":["10:00-16:00", "20:00-24:00"],
			"Tuesday":["04:00-12:00","16:00-22:00"],
			"Wednesday":["04:00-11:00","15:00-21:00"],
			"Thursday": ["05:00-14:00","18:00-22:00"],
			"Friday":["11:00-19:00"],
			"Saturday":["03:00-10:00", "14:00-20:00"]
		}
	
	},
	5: {
		"name": "Group 6",
		"schedule": {
			"Sunday":["03:00-10:00", "14:00-20:00"],
			"Monday":["06:00-15:00","19:00-23:00"],
			"Tuesday":["10:00-16:00", "20:00-24:00"],
			"Wednesday":["04:00-12:00","16:00-22:00"],
			"Thursday":["04:00-11:00","15:00-21:00"],
			"Friday": ["05:00-14:00","18:00-22:00"],
			"Saturday":["11:00-19:00"]
		}
		
	},
	6: {
		"name": "Group 7",
		"schedule": {
			"Sunday":["11:00-19:00"],
			"Monday":["03:00-10:00", "14:00-20:00"],
			"Tuesday":["06:00-15:00","19:00-23:00"],
			"Wednesday":["10:00-16:00", "20:00-24:00"],
			"Thursday":["04:00-12:00","16:00-22:00"],
			"Friday":["04:00-11:00","15:00-21:00"],
			"Saturday": ["05:00-14:00","18:00-22:00"]
		}
		
	}
}

var info = {
	"from" : "2020:01:01"
}
var todayDateTime

var groupButton = "res://scenes/GroupButton.tscn"
var groupSpacer = "res://scenes/GroupSpacer.tscn"
var mainSchedulePanel = "res://scenes/MainSchedulePanel.tscn"
var main

func _ready():
	Global.UI = self
	todayDateTime = OS.get_datetime()#OS.get_datetime_from_unix_time(OS.get_unix_time())
	print(todayDateTime)
	for i in schedule:
		var button = load(groupButton).instance()
		$HBoxContainer.add_child(button)
		button.text = str(schedule[i].name)

func updateUI():
	removePreviousPanels()
	print(Global.selectedGroup)
	addNewPanels()

func removePreviousPanels():
	for n in $ScrollContainer/VBoxContainer.get_children():
		n.queue_free()

func addNewPanels():
	if Global.selectedGroup == "Group 1":
		addPnl(0)
	elif Global.selectedGroup == "Group 2":
		addPnl(1)
	elif Global.selectedGroup == "Group 3":
		addPnl(2)
	elif Global.selectedGroup == "Group 4":
		addPnl(3)
	elif Global.selectedGroup == "Group 5":
		addPnl(4)
	elif Global.selectedGroup == "Group 6":
		addPnl(5)
	elif Global.selectedGroup == "Group 7":
		addPnl(6)
		
func addPnl(group):
		
	for i in schedule[group]["schedule"]:
		var newPanel = load(mainSchedulePanel).instance()
		$ScrollContainer/VBoxContainer.add_child(newPanel)
		newPanel.setDayText(i)
		newPanel.setTimeText(schedule[group]["schedule"][i])
		
		
	
