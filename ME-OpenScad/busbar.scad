include <laserscad.scad>

lkerf=1;

$fn = 100;

W = 5.5;
H = 45;


module busbar(i){
lpart(str("busbar_",i), [W, H]) {
    linear_extrude(height=4)
    square(size=[W,H]);
}
}

module busbars(how_many=1) {
    margin=7;
    for(i=[0:1:how_many-1]) {
        ltranslate([i*(margin),0,0])
            busbar(i);
    }
}

busbars(how_many=25);


