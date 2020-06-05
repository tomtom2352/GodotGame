extends Area2D	


const speed = 200
var velocity = Vector2()	
var direction = 1
var damage
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x  = speed * delta * direction
	translate(velocity)

func set_damage(dmg):
	damage = dmg

func setSprite(sprite):
	$Sprite.set_frame(sprite)

func set_bullet_direction(dir):
	direction = dir 
	if dir == -1:
		$Sprite.flip_h = true 

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bullet_body_entered(body):
	if "Blob" in body.name:
		body.hit(damage)
	queue_free()