var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

canvas.width = window.innerwidth;
//canvas.height = window.innerHeight + 100;

ctx.fillStyle = 'green';
ctx.fillRect(10, 10, 100, 100);

// 공룡
var dino = {
    x : 10,
    y : 200,
    width : 50,
    height : 50,
    draw(){
        ctx.fillStyle = "rgb(200, 0, 0)";
        ctx.fillRect(this.x, this.y, this.width, this.height);
		//ctx.drawImage(charImg, this.x, this.y)
    }
}

dino.draw();
/*
var charImg = new Image();
var cactusImg = new Image();
charImg.src = 'cactus.png';
cactusImg.src = 'cactus.png';
*/

// 장애물
class Cactus {
    constructor(){
        this.x = 500;
        this.y = 200;
        this.width = 50;
        this.width = 50;
    }
    draw(){
        ctx.fillStyle = "rgb(200, 0, 0)";
        ctx.fillRect(this.x, this.y, this.width, this.height);
		//ctx.drawImage(cactusImg, this.x, this.y)
    }
}

var timer = 0;
var cactusGroup = [];
var jumpTimer = 0;

function animationDino() {
	animDino = requestAnimationFrame(animationDino);
	timer++;
	
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	
	if(timer % 200 == 0){
		var cactus = new Cactus();
		cactusGroup.push(cactus);
		
	}
	cactusGroup.forEach((a, i, o)=> {
		// x좌표가 0미만이면 제거
		if(a.x < 0){
			o.splice(i, 1)
		}
		a.x--;
		collisionCheck(dino, a);
		
		a.draw();
	})
	
	// 점프 기능
	if(jumping == true){
		dino.y--;
		jumpTimer++;
	}
	if(jumping == false){
		if(dino.y > 200){
			dino.y++;
		}
	}
	if(jumpTimer > 100){
		jumping = false;
		jumpTimer = 0;
	}
	
	dino.draw()
}

animationDino();

// Collision Check
function collisionCheck(dino, cactus) {
	var xDiffer = cactus.x - (dino.x + dino.width);
	var yDiffer = cactus.y - (dino.y + dino.height);
	
	if(xDiffer < 0 && yDiffer < 0){
		ctx.clearRect(0,0, canvas.width, canvas.height);
		cancelAnimationFrame(animDino);
	}
}

var jumping = false;
document.addEventListener('keydown', function(e) {
	if(e.code === 'Space'){
		jumping = true;	
	}
})
