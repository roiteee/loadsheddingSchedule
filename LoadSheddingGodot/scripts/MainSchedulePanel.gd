extends Panel

var dayText
var timeText

func _ready():
	Global.MainSchedulePanel = self

func setDayText(text):
	$Day.text = str(text)
	
func setTimeText(text):
	$Time.text = str(text)
