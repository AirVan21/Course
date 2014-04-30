 open (FILE, 'data.txt');
 
 while (<FILE>) {
	chomp $_;
	($vendorID, $vendorName) = split("\t");
	$lengthVID = length $vendorID;
	if ($lengthVID == 0) {
		($null, $deviceID, $deviceName) = split("\t");
		#open (ORDER, ">>order.txt")
			print "$lastVendorID";
			print " $deviceID";
			$strlen1 = length $lastVendorName;
			$strlen2 = length $deviceName;
			$stringLength = $strlen1 + $strlen2 + 1;
			print " $stringLength";
			print " $lastVendorName";
			print " $deviceName\$";
		#close (ORDER);
	} else {
		$lastVendorID = $vendorID;
		$lastVendorName = $vendorName;
	}
	
 }
 close (FILE);
 
 exit;