package db;

import sys.db.Object;
import sys.db.Types.SId;
import sys.db.Types.SInt;
import sys.db.Types.SString;
import sys.db.Types.SDateTime;

/**
 * ...
 * @author Rahul
 */

 
 /**
  * Create variables for the data to be stored on players in the leaderboard
  */
class Player extends Object 
{

	public var id:SId;
	public var name: SString<32>;
	public var location: SString<32>;
	public var value:SInt;
	public var date:SDateTime;
	
}