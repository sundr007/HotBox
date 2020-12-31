include </home/evan/Documents/github/lasercut/lasercut.scad>; 

use<projection_renderer.scad>;
use<label.scad>;

$fn=60;
// ##### RENDERING OPTIONS #####

render_3d   = false;
//2D
render_sides       = false;
render_top         = false;
render_gasket      = true;

// ##### Dimensions #####
x_in= 8;
y_in= 10;
z_in= 5;
// #####  #####

thickness = 3;
x   = x_in*25.4;
y   = y_in*25.4;
z   = z_in*25.4;
// PCB Size
x_pcb = 100;
y_pcb = 100;
// Intel Fan
HoleSize=3.5/2;
x_f = 95;
y_f = x_f;
// Cutout size
x_c = 90;
y_c = x_c;
// fingers
NfSide=3;
NfTop=4;
// Fan connector cutout
FconnL=12;
FconnP=8;
FconnDepth=5;

module side(x,y)
{
    lasercutoutSquare(thickness=thickness, x=x, y=y,
    bumpy_finger_joints=[
            [DOWN, 1, NfSide]
        ],
    finger_joints=[
            [LEFT, 1, NfTop],
            [UP,1,NfSide]
        ]
    );
}

module enclosure_bottom_etch() {
    color("red") 
    linear_extrude(height=2, center=true) {
            text_label(["Hot","Box"],20);
    }
 
    translate([100,0,0]){
    color("red") 
    linear_extrude(height=2, center=true) {
            text_label([str(x_in,"x",y_in,"x",z_in),
                        "EDS",
                       ],10);
    }
}
}

module top()
{
      lasercutoutSquare(thickness=thickness, x=x, y=y,
    bumpy_finger_joints=[
            [UP, 1, NfTop],
            [DOWN, 1, NfTop],
            [RIGHT, 1, NfTop],
            [LEFT, 1, NfTop]
        ],
    cutouts = [
            [x/2-x_c/2, y/2-y_c/2, x_c, y_c], // Main Cutout
            //[x/2-x_c/2-FconnDepth, y/2+y_c/2-FconnL-FconnP, FconnDepth, FconnL]  // Fan Connector
        ],
    circles_remove = [
            [HoleSize, x/2+x_f/2, y/2+y_f/2],
            [HoleSize, x/2+x_f/2, y/2-y_f/2],
            [HoleSize, x/2-x_f/2, y/2+y_f/2],
            [HoleSize, x/2-x_f/2, y/2-y_f/2],
        ]
    );
  for(off = [x/(NfTop*2*2) : x/NfTop : x]){
      translate([off,y,0])
        cylinder(r=x/(NfTop*2*2),h=thickness);
      translate([off+x/(NfTop*2),0,0])
        cylinder(r=x/(NfTop*2*2),h=thickness);
  }
  for(off = [y/(NfTop*2*2) : y/NfTop : y]){
      translate([0,off,0])
        cylinder(r=y/(NfTop*2*2),h=thickness);
      translate([x,off+y/(NfTop*2),0])
        cylinder(r=y/(NfTop*2*2),h=thickness);
  }  
  //translate([x/1,y/10,0]) mirror([1,0,0])
   // enclosure_bottom_etch();
}

module gasket(){
        linear_extrude(1){
            difference(){
                square([(x_pcb-x_c)/2,y_pcb-(y_pcb-y_c)],center=true);
                translate([0,y_c/2-(x_pcb-x_c)/2,0]) circle(HoleSize);      
            }
        }
}
module gasket_set(){
    shift = (x_pcb-x_c)/2;
    translate([x_c/2,shift,0])gasket();
    translate([0,0,0])gasket();
    translate([0,0,0])gasket();
    translate([0,0,0])gasket();
}


module 3d() {
// Print the sides
    side(z,y);
translate([0,y+3.5,thickness]) rotate([90,0,0]) 
    side(z,x); 
translate([0,-3.5,thickness+x]) rotate([-90,0,0]) 
    side(z,x); 
translate([0,y,thickness+x+3.5]) rotate([180,0,0]) 
    side(z,y); 

// Print the top
translate([-3.5,0,x+3.5]) rotate([0,90,0])
    top();
  translate([-3.5-1,y/2,x/2]) rotate([0,90,0])
    gasket_set();  
    
}

module laser_etch() {
    if (render_etch || render_index == -1) {
        children();
    }
}

if (render_3d) {
        rotate([90,90,0])
            3d();
} else {
    kerf=0.1;
   // projection_renderer(render_index=render_index, kerf_width//=0.1) {  
  projection(){
    if(render_sides){  
            side(z,y);
        translate([z+thickness+.1, 0, 0]) 
            side(z,x);
        translate([(z+thickness+.1)*2, 0, 0]) 
            side(z,x);
        translate([(z+thickness+.1)*3, 0, 0])  
            side(z,y);
    }
    if(render_top){
        //translate([(y+thickness+80)*2, 0, 0]) 
            top();
          //  translate([(y+thickness+80)*2, 0, 0]) 
            //    mirror([0,0,0])
              //  enclosure_bottom_etch();
    }
    if(render_gasket){
        for(ix=[0:3])
            translate([ix*((x_pcb-x_c)/2+kerf),0,0])
                gasket();
    }
}
}

