include </home/evan/Documents/github/lasercut/lasercut.scad>; 

use<projection_renderer.scad>;
use<label.scad>;


// ##### RENDERING OPTIONS #####

render_3d = true;

// 3d parameters:
render_enclosure = 2; // 0=invisible; 1=translucent; 2=opaque color;
render_flaps = 2; // 0=invisible; 1=front flap only; 2=all flaps
render_flap_area = 0; // 0=invisible; 1=collapsed flap exclusion; 2=collapsed+extended flap exclusion
render_letters = "44";
render_units = len(render_letters);
render_unit_separation = 0;
render_pcb = true;
render_bolts = true;
render_motor = true;

// 2d parameters:
render_index = -1;
render_etch = false;

// Panelization:
panel_vertical = 0;
panel_horizontal = 0;

// Version label:
render_revision = "deadbeef";
render_date = "YYYY-MM-DD";


$fn=60;
thickness = 3;
x_in= 12;
y_in= 12;
z_in= 7;
x   = x_in*25.4;
y   = y_in*25.4;
z   = z_in*25.4;
// Intel Fan
HoleSize=2.5/2;
x_f = 95;
y_f = x_f;
// Cutout size
x_c = 90;
y_c = x_c;
// fingers
NfSide=3;
NfTop=4;

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
    color([0, 0, 0])
    linear_extrude(height=2, center=true) {
            text_label(["Hot","Box"],20);
    }
 
    translate([100,0,0]){
    color([0, 0, 0])
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
            [x/2-x_c/2, y/2-y_c/2, x_c, y_c]
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



module 3d() {
// Print the sides
side(z,y);
translate([0,y+20,thickness]) rotate([90,0,0]) 
    side(z,x); 
translate([0,-20,thickness+x]) rotate([-90,0,0]) 
    side(z,x); 
translate([0,y,thickness+x]) rotate([180,0,0]) 
        side(z,y); 

// Print the top
translate([-20,0,x+5]) rotate([0,90,0])
{
    top();
}
}

module laser_etch() {
    if (render_etch || render_index == -1) {
        children();
    }
}

if (render_3d) {
            3d();
} else {
   // projection_renderer(render_index=render_index, kerf_width//=0.1) {  
  projection(){  
            side(z,y);
        translate([z+thickness+.1, 0, 0]) 
            side(z,x);
        translate([(z+thickness+.1)*2, 0, 0]) 
            side(z,x);
        translate([(z+thickness+.1)*3, 0, 0])  
            side(z,y);
        translate([(y+thickness+80)*2, 0, 0]) 
            top();
        laser_etch()
            translate([(y+thickness+80)*2, 0, 0]) 
                mirror([0,0,0])
                    enclosure_bottom_etch();
}
}

