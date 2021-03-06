$fn=100;
pipeDia = 3.35;
blockY = 33;
blockZ = 17;
blockX = 18;
motorCenterX = 14; // X line of motor posts and shaft
motorOffsetY = 6; // move the motor +Y this much relative to center

boardScrewSpacing = 25.4*0.9; // screws are 0.9" apart
screwHoleDia = 3.3; // M3 screw thread clearance tunnel
screwHeadDia = 6; // M3 screw head clearance tunnel

difference() {
  translate([0,blockY/-2,0]) cube([blockX,blockY+motorOffsetY,blockZ]);
  translate([motorCenterX,motorOffsetY,-0.1]) cylinder(r = pipeDia/2, h = blockZ+.2); // pipe hole
  translate([motorCenterX,21/2+motorOffsetY,-0.1]) cylinder(r = 4.5/2, h = 2); // motor nub holes (drill to 4.3mm)
  translate([motorCenterX,-21/2+motorOffsetY,-0.1]) cylinder(r = 4.5/2, h = 2);
  translate([motorCenterX,21/2+motorOffsetY,1.7]) cylinder(r = 6.2/2, h = 6); // motor nub larger part
  translate([motorCenterX,-21/2+motorOffsetY,1.7]) cylinder(r = 6.2/2, h = 6);
  translate([motorCenterX,21/2+motorOffsetY,1.7+5.9]) cylinder(r1=6.2/2, r2=0, h = 6); // motor nub conical top (for printability)
  translate([motorCenterX,-21/2+motorOffsetY,1.7+5.9]) cylinder(r1=6.2/2, r2=0, h = 6);
  #translate([-0.1,blockY/2-2,blockZ]) rotate([-70,0,0]) cube([blockX+0.2,blockY+motorOffsetY,blockZ]);
  #translate([-0.1,-9,0]) rotate([125,0,0]) cube([blockX+0.2,blockY+motorOffsetY,blockZ]);

  translate([-0.1,-8,13-4]) cube([11.1,16,8.1]); // Vout connector with nothing plugged into it
  translate([-0.1,boardScrewSpacing / 2,13]) rotate([0,90,0]) cylinder(r = screwHoleDia/2, h = 16.2); // screw body hole
  translate([-0.1,-boardScrewSpacing / 2,13]) rotate([0,90,0]) cylinder(r = screwHoleDia/2, h = 16.2);
  translate([10,boardScrewSpacing / 2,13]) rotate([0,90,0]) cylinder(r = screwHeadDia/2, h = 16.2); // screw head clearance
  translate([10,-boardScrewSpacing / 2,13]) rotate([0,90,0]) cylinder(r = screwHeadDia/2, h = 16.2);
}
