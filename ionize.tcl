mol new solvated.psf
mol addfile solvated.pdb

package require autoionize
autoionize -psf solvated.psf -pdb solvated.pdb -neutralize -o ionized
