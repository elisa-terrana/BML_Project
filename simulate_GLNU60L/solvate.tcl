mol new output/system.psf
mol addfile output/system.pdb

package require solvate
solvate output/system.psf output/system.pdb -t 5 -o output/solvated
