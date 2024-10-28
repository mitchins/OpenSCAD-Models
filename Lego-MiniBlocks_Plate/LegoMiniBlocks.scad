// Parameters
lego_stud_spacing = 8; // LEGO stud spacing in mm
nano_peg_spacing = 4; // Nano block peg spacing in mm
adapter_width = 6; // Width in LEGO studs
adapter_length = 6; // Length in LEGO studs
peg_diameter = 2; // Diameter for nano block pegs
peg_height = 2; // Height of the nano block pegs

// Bottom: LEGO studs
module lego_studs() {
    for (x = [0 : lego_stud_spacing : (adapter_width - 1) * lego_stud_spacing])
        for (y = [0 : lego_stud_spacing : (adapter_length - 1) * lego_stud_spacing])
            translate([x, y, 0])
                cylinder(h = 1.8, d = 4.8, center = true); // LEGO stud height and diameter
}

// Top: Nano Block pegs
module nano_pegs() {
    for (x = [0 : nano_peg_spacing : (adapter_width - 1) * nano_peg_spacing])
        for (y = [0 : nano_peg_spacing : (adapter_length - 1) * nano_peg_spacing])
            translate([x, y, lego_stud_spacing / 2]) // Adjust for LEGO height
                cylinder(h = peg_height, d = peg_diameter, center = true);
}

// Base adapter
module adapter_base() {
    cube([adapter_width * lego_stud_spacing, adapter_length * lego_stud_spacing, lego_stud_spacing / 2], center = true);
}

// Assemble the adapter
adapter_base();
lego_studs();
nano_pegs();
