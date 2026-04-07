module Prime {
	////////////////////////////////////////////////////////
	// DO NOT CHANGE THE SPECIFICATION
	////////////////////////////////////////////////////////
	ghost predicate prime(n:int)
	{
		n >= 2 && forall i :: 2 <= i < n ==> n % i != 0
	}

	method IsPrime(n:nat) returns (res:bool)
	requires n >= 2
	ensures res <==> prime(n)
	{
    // DO NOT remove the code marker 
    // DO NOT modify the code beyond the code markers 
    //####CodeMarker1Begin#### 
    var i := 2;
    while i < n
    invariant 1 <= i <= n
    invariant forall k::2 <= k < i ==> n % k != 0
    {
    	if n%i == 0{
    		return false;
    	}
    	i:=i+1;
    }
    return true;

    //####CodeMarker1End####
 }
}
