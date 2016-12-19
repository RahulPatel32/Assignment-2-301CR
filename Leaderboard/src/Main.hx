package;

import api.PlayerAPI;
import api.ReturnData;
import db.ConnectDatabase;
import db.Player;
import php.Lib;
import haxe.web.Dispatch;
import php.Web;
/**
 * ...
 * @author Rahul
 */

 /**
  * Class to create parameter for URL to extract data from the leaderboard database
  * Routing function checks user input at the end of URL
  * If statement used check for different parameters entered
  */
class Main 
{

	static function main() 
	{

		//Lib.print("Hello Haxe/PHP");
		routing();
	}

	static function routing()
	{
		var d = new Dispatch(Web.getURI(), Web.getParams());
		var len:Int = d.parts.length;
		var i:Int = 0;
		var userInput = Web.getParams();
		var userInputString:String;
		
		
		/**
		 * if a table doesn't exist then enter "createTables" to make player table
		 */
		if (d.parts[len-1] == "createTables") 
		//call the create table functions here
		{
			ConnectDatabase.Connect();
			ConnectDatabase.CreateTables();
			ConnectDatabase.disconnect();
		}
		
		/**
		 *  enter "addPlayer" to add new player data to leaderboard table
		 */
		else if (d.parts[len-1] == "addPlayer")
		{
			new PlayerAPI().addPlayer(); 
		}
		
		/**
		 * enter "ReturnAll" to get all data from leaderboard
		 */		
		else if (d.parts[len-1] == "ReturnData")
		{
			ReturnData.ReturnAll(); 
		}
		
		/**
		 * enter "ReturnLocation" to get all data by location from leaderboard
		 */	
		else if (d.parts[len-1] == "ReturnLocation")
		{
			userInputString = userInput.get("Location");
			ReturnData.Location(userInputString); 
		}
		
		/**
		 * enter "ReturnPlayer" to get all data by player name from leaderboard
		 */	
		else if (d.parts[len-1] == "ReturnPlayer")
		{
			userInputString = userInput.get("Player");
			ReturnData.PlayerScores(userInputString); //return all scores of player URL
		}
		
		/**
		 * enter "Delete" to remove data entry by matching ID
		 */	
		else if (d.parts[len-1] == "Delete")
		{
			userInputString = userInput.get("ID");
			ReturnData.Delete(userInputString); //return all scores of player URL
		}
		
		/**
		 * enter "ReturnWeekly" to get all data from leaderboard by most recent date and 7 days before
		 */	
		else if (d.parts[len-1] == "ReturnWeekly")
		{
			
			ReturnData.Weekly(); //return all scores of player URL
		}
				
		/**
		 * enter "ReturnBackup" to create backup file in server directory
		 */	
		else if (d.parts[len-1] == "ReturnBackup")
		{
			
			ReturnData.Backup(); //create backup file
		}
	}


}