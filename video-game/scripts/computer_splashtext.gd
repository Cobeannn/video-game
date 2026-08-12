extends Label
var splashtexts = ["HELLO WORLD!", "IT'S COMPUTER TIME", "AT THE CROSSROADS, DON'T TURN LEFT", "I'M COMPUTING IT", "A REPLACEMENT FOR REAL LIFE", "YOUR SUFFERING IS INEVITABLE :3", "ERR. NO SPLASHTEXT FOUND", "JOIN THE BLACK PARADE", "WHAT IF I TOLD YOU..", "..THERE'S A SIMPLE WAY TO MAKE A TRIANGLE WITH YOUR HANDS", "LOVE, ME NORMALLY", "ROAD WORK AHEAD? I SURE HOPE IT DOES", "SAFE FOR WORK", "WILL WOULD? I'M NOT SURE, ASK HIM", "THIS STATEMENT IS FALSE", "WHEN LIFE GIVES YOU LEMONS, BURN LIFE'S HOUSE DOWN!", "HORRIFIED AT THE SIGHT OF MY REFLECTION IN YOUR EYES", "HATE. LET ME TELL YOU HOW MUCH I HAVE COME TO HATE- err. message cancelled for hate speech", "GLASS HALF FULL? I'D PROBABLY JUST DRINK THAT TOO"]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var splashtext = splashtexts.pick_random()
	text = splashtext


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
