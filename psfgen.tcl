package require psfgen
topology top_all27_prot_lipid.inp
pdbalias residue HIS HSE
pdbalias ILE CD1 CD
segment U {pdb protein.pdb}
coordpdb protein.pdb U
guesscoord
writepdb system.pdb
writepsf system.psf
