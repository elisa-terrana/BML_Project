mol new 5rsa.pdb
set a [atomselect top protein]
$a writepdb protein.pdb
$a delete
