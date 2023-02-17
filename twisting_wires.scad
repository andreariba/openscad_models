
radius = 1;

function p(angle) = angle < 360 ? concat([[radius*sin(angle), radius*cos(angle)]], p(angle+5)):[];

linear_extrude(height=10, center=true, twist=360 ){
    
    translate([1,0,0])
    polygon(p(0));
    
    translate([-1,0,0])
    polygon(p(0));
    
}


$fn=90;
