mol new output/GLNU60L_ionized.psf
mol addfile output/GLNU60L_ionized.pdb

set all [atomselect top all]

set minmax [measure minmax $all]
set center [measure center $all]

set min [lindex $minmax 0]
set max [lindex $minmax 1]

set diff_x [expr {[lindex $max 0] - [lindex $min 0]}]
set diff_y [expr {[lindex $max 1] - [lindex $min 1]}]
set diff_z [expr {[lindex $max 2] - [lindex $min 2]}]

set outfile [open "output/boundary.txt" w]
puts $outfile "MIN: [lindex $minmax 0]"
puts $outfile "MAX: [lindex $minmax 1]"
puts $outfile "  X: $diff_x"
puts $outfile "  Y: $diff_y"
puts $outfile "  Z: $diff_z"
puts $outfile "CENTER: $center"
close $outfile

$all delete

