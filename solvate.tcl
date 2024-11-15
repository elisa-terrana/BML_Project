mol new system.psf
mol addfile system.pdb

package require solvate
solvate system.psf system.pdb -t 5 -o solvated
