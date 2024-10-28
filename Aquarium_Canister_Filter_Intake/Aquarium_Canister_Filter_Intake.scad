$fn = 128;

upper_radius = 17/2.0;
upper_inner_radius = 14/2.0;
upper_height = 10; //122;

lower_radius = 18.00/2.0;
lower_inner_radius = 15/2.0;
lower_height = 10; //130;

bend_radius = 27;

angle_1 = 0;
angle_2 = 180;

union()
{
    // lower arm
    rotate([ 0, 0, angle_1 ]) translate([ bend_radius + upper_radius, 0.02, 0 ]) rotate([ 90, 0, 0 ]) difference()
    {
        cylinder(r = lower_radius, h = lower_height);
        translate([ 0, 0, -1 ]) cylinder(r = lower_inner_radius, h = lower_height * 1.1);
    }
    // upper arm
    rotate([ 0, 0, angle_2 ]) translate([ bend_radius + upper_radius, -0.02, 0 ]) rotate([ -90, 0, 0 ]) difference()
    {
        cylinder(r = upper_radius, h = upper_height);
        translate([ 0, 0, -1 ]) cylinder(r = upper_inner_radius, h = upper_height * 1.1);
    }
    // bend
    difference()
    {
        // torus
        rotate_extrude() translate([ bend_radius + upper_radius, 0, 0 ]) circle(r = max(upper_radius, lower_radius));

        // torus cutout
        rotate_extrude() translate([ bend_radius + upper_radius, 0, 0 ]) circle(r = min(upper_inner_radius, lower_inner_radius));
        // lower cutout
        rotate([ 0, 0, angle_1 ]) translate([ -50 * (((angle_2 - angle_1) <= 180) ? 1 : 0), -100, -50 ])
            cube([ 100, 100, 100 ]);
        // upper cutout
        rotate([ 0, 0, angle_2 ]) translate([ -50 * (((angle_2 - angle_1) <= 180) ? 1 : 0), 0, -50 ])
            cube([ 100, 100, 100 ]);
    }
}