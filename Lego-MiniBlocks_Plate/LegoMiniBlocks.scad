$fn=40;
// Parameters
lego_stud_spacing = 8; // LEGO stud spacing in mm
nano_peg_spacing = 4; // Nano block peg spacing in mm
peg_diameter = 2.8; // Diameter for nano block pegs
peg_height = 2; // Height of the nano block pegs
// BYGGLEK SIZES
// Small: 16x11
// Large: 
adapter_width = 16; // Width in LEGO studs
adapter_length = 11; // Length in LEGO studs

// Dimensions of the plate
plate_width = adapter_width * lego_stud_spacing;
plate_depth = adapter_length * lego_stud_spacing;
plate_height = lego_stud_spacing / 2;

// Bottom: LEGO studs
module lego_studs() {
  lego_stud_height = 1.8;
  lego_stud_width_male = 4.8;
  lego_stud_width_female = 5;
  for (x = [lego_stud_spacing/2 -plate_width/2 : lego_stud_spacing : plate_width/2 - lego_stud_spacing/2]) {
    for (y = [lego_stud_spacing/2 -plate_depth/2 : lego_stud_spacing : plate_depth/2 - lego_stud_spacing/2]) {
      translate([x, y, -plate_height/2])
      cylinder(h = lego_stud_height, d = lego_stud_width_female, center = false); // LEGO stud height and diameter
    }
  }
}

// Top: Nano Block pegs
module nano_pegs() {
  for (x = [nano_peg_spacing/2 -plate_width/2 : nano_peg_spacing : plate_width/2 - nano_peg_spacing/2]) {
    for (y = [nano_peg_spacing/2 -plate_depth/2 : nano_peg_spacing : plate_depth/2 - nano_peg_spacing/2]) {
      translate([x, y, plate_height/2]) // Adjust for LEGO height
      cylinder(h = peg_height, d = peg_diameter, center = false);
    }
  }
}



// Base adapter
module adapter_base() {
  difference() {
    cube([plate_width, plate_depth, plate_height], center = true);
    lego_studs();
  }
}

// Assemble the adapter
adapter_base();

nano_pegs();
