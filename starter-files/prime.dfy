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

		// WRITE an imperative implementation that uses a **while loop**
    // to satisfy the postcondition

		return true;

    //####CodeMarker1End####
	}
}
