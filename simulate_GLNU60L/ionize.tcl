mol new output/solvated.psf
mol addfile output/solvated.pdb

package require autoionize
autoionize -psf output/solvated.psf -pdb output/solvated.pdb -neutralize -o output/GLNU60L_ionized
