 $fn=50;

width = 54;
length = 86;
height = 36;
thickness = 2;

BOTTOM= false;

bottom = 20;

if (BOTTOM) corners();
difference(){ 
    outer();
    inner();
    airflow();
    //jack();
    cables();
    if (BOTTOM) removeTop();
    if (!BOTTOM) removeBottom();
}  

module jack() {
    j = 4;
    translate([15, 10, bottom]) rotate([90, 0, 0]) cylinder(r=j, h=20);
}

module removeTop() {
    translate([-10,-10, bottom]) cube([width*2,length*2, height*2]);
}

module removeBottom() {
translate([-10,-10, 0]) cube([width*2,length*2, bottom]);
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