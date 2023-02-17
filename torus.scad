
/*rotate_extrude(angle=360)
translate([10,0,0])
circle(r=4);*/

radius = 1;
function p(angle) = angle < 360   ?   concat([[radius * sin(angle), radius * cos(angle)]], p(angle + 5))   :   [];

rotate_extrude(angle=360 )
translate([5,0,0])
polygon(p(0));

$fn=90;