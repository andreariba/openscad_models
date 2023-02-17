use <loft.scad>

2032c_points = [[1000,1.6],[950,12.4],[900,22.9],[800,42.8],[700,61],[600,77.1],[500,90.5],[400,100.2],[300,104.8],[250,104.4],[200,101.3],[150,93.4],[100,78],[75,66.4],[50,51.3],[25,31.7],[12.5,19.3],[0,0],[12.5,-5],[25,-4.2],[50,-1],[75,2.8],[100,6.8],[150,14.5],[200,21.7],[250,28.2],[300,33.3],[400,38.5],[500,38.6],[600,35],[700,28.6],[800,20.2],[900,10],[950,4.4]];


function rotated_foil(rotation,angle) = [
    for (i = [0:len(2032c_points)-1])
        (0.003*cos(angle)*cos(angle)+0.003)*[[cos(rotation),0,-sin(rotation)],[0,1,0],[sin(rotation),0,cos(rotation)]]*[2032c_points[i][0],0, 2032c_points[i][1]] + 10*[cos(angle),sin(angle),0]
];

module single_propeller() {
    angle_step = 5;
    rotate([0,-5,0])
    translate([0,0,0])
    scale([0.5,1.0,1.0])
    for (angle = [0:angle_step:360]) {
        loft(rotated_foil(-20,angle),rotated_foil(-20,angle+angle_step), number_of_layers=10);
    }
};


difference(){
union(){
    scale(0.3)
    translate([0,-10,0.5])
    single_propeller();
    scale(0.3)
    translate([0,10,0.5])
    rotate([0,0,180])
    single_propeller();
        
    translate([0,0,-0.25])
    cylinder(0.5,r1=0.6,r2=0.6);
    }


translate([0,0,-0.25])
cylinder(0.5,r1=0.25,r2=0.25);
}

$fn=90;

