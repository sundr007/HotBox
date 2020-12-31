// Copyright 2020, mbugert
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the Lesser GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// Lesser GNU General Public License for more details.
// 
// You should have received a copy of the Lesser GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
include </home/evan/Documents/github/lasercut/lasercut.scad>; 
include <laserscad.scad>
include <label.scad>

render_3d = false;

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

module top()
{
    lpart("top", [x, y]) {
        
    translate([20,30,0])
       lengrave(thickness, true) {
           
            text_label(["Hot","Box"],20*1);
           

    }
    translate([120*1,30,0])
    lengrave(thickness, true) {
                    text_label([str(x_in,"x",y_in,"x",z_in),
                        "EDS",
                       ],10*1);
    }
        
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

}
}


top();

//lpart("rectangle", [x, y]) {
//    lengrave(thickness, true) {
//        // pacman
//        translate([0.25*x, y/2, 0])    
//            difference() {
//                circle(8);
//                translate([8,0,0])
//                    rotate([0,0,60])
//                        circle(8, $fn=3);
//            }
//        
//        // pills
//        for (i = [0:2]) {
//            translate([0.5*x + i*10, y/2, 0])
//                circle(2);
//        }
//    }
//    
//    // block
//    cube([x, y, thickness]);
//}