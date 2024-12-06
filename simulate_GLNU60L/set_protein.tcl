mol new LEU60_foldx.pdb
set a [atomselect top protein]
$a writepdb output/protein.pdb
$a delete
