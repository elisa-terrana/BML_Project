# Load the initial PDB and extract the protein structure
mol new ionizedWT_1.pdb
set a [atomselect top protein]
$a writepdb protein.pdb
$a delete

# Load PSFGEN and generate the initial PSF and PDB
package require psfgen
topology top_all27_prot_lipid.inp
pdbalias residue HIS HSE
pdbalias ILE CD1 CD

segment U {pdb protein.pdb}
coordpdb protein.pdb U
guesscoord
writepdb system.pdb
writepsf system.psf

# Load the system structure
mol new system.psf
mol addfile system.pdb

# Solvate the system
package require solvate
solvate system.psf system.pdb -t 5 -o solvated

# Add ions to neutralize the system
mol new solvated.psf
mol addfile solvated.pdb

package require autoionize
autoionize -psf solvated.psf -pdb solvated.pdb -neutralize -o ionized

# Perform measurements and write boundary information
mol new ionized.psf
mol addfile ionized.pdb

set all [atomselect top all]

set minmax [measure minmax $all]
set center [measure center $all]

set min [lindex $minmax 0]
set max [lindex $minmax 1]

set diff_x [expr {[lindex $max 0] - [lindex $min 0]}]
set diff_y [expr {[lindex $max 1] - [lindex $min 1]}]
set diff_z [expr {[lindex $max 2] - [lindex $min 2]}]

set outfile [open "boundary.txt" w]
puts $outfile "MIN: [lindex $minmax 0]"
puts $outfile "MAX: [lindex $minmax 1]"
puts $outfile "  X: $diff_x"
puts $outfile "  Y: $diff_y"
puts $outfile "  Z: $diff_z"
puts $outfile "CENTER: $center"
close $outfile

$all delete
