mol new 5rsa.pdb
set a [atomselect top protein]
$a writepdb output/protein.pdb
$a delete
