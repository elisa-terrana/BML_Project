package require psfgen
topology ../top_all27_prot_lipid.inp
pdbalias residue HIS HSE
pdbalias ILE CD1 CD
segment U {pdb output/protein.pdb}
coordpdb output/protein.pdb U
guesscoord
writepdb output/LEU60_ionized.pdb
writepsf output/LEU60_ionized.psf
