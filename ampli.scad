 $fn=50;

boardWidth = 50;
boardLength = 84;

thickness = 2;

width = boardWidth + thickness*2;
length = boardLength + thickness*2 + 2;
height = 36;

BOTTOM= true;

bottom = 20;

if (BOTTOM) corners();
difference(){ 
    outer();
    inner();
    airflow();
    //jackAndPower();
    cables();
    
    if (BOTTOM) removeTop();
    if (!BOTTOM) removeBottom();
}  

 //board();


module board () {
    translate([thickness, thickness, 1]) {
        cube([boardWidth, boardLength, 9]);
        rjack = 4;
        translate([9+rjack, 0, 10]) rotate([90, 0, 0]) cylinder(r=rjack, h=10);
        rpower = 4;
        translate([34+rpower, 0, 10]) rotate([90, 0, 0]) cylinder(r=+rpower, h=10);
    }
}

module jackAndPower() {
    translate([thickness, thickness, 1]) {
        rjack = 4;
        translate([9+rjack, 0, 9]) rotate([90, 0, 0]) cylinder(r=rjack, h=10);
        rpower = 4;
        translate([34+rpower, 0, 10]) rotate([90, 0, 0]) cylinder(r=+rpower, h=10);
    }
}

module removeTop() {
    translate([-10,-10, bottom]) cube([width*2,length*2, height*2]);
}

module removeBottom() {
translate([-10,-10, -5]) cube([width*2,length*2, bottom+5]);
}

module outer() {
    minkowski() {
     cube([width,length, height]);
      cylinder(r=thickness,h=1);
    }
}

module inner () {
translate([0,0, thickness]) cube([width,length, height  - thickness]);
}

module corners() {
    corner();
    translate([width, 0, 0]) rotate([0, 0, 90]) corner();
    translate([width, length, 0]) rotate([0, 0, 180]) corner();
    translate([0, length, 0]) rotate([0, 0, 270]) corner();
}

module corner () {
    w = 10;
    cube([w, 1, bottom+2]);
    cube([1, w, bottom+2]);
}

module cables() {
    w = 20;
    translate([width / 2 - w / 2, length-2,bottom-2]) cube([w, 10, 2]);
}


module airflow () {
translate([10, 10, height]) cube([width - 20, 2, 10]);
translate([10, 15, height]) cube([width - 20, 2, 10]);
translate([10, 20, height]) cube([width - 20, 2, 10]);
translate([10, 25, height]) cube([width - 20, 2, 10]);
translate([10, 30, height]) cube([width - 20, 2, 10]);
translate([10, 35, height]) cube([width - 20, 2, 10]);
}