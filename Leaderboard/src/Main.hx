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
		
		if (d.parts[len-1] == "createTables") 
		//call the create table functions here
		{
			ConnectDatabase.Connect();
			ConnectDatabase.CreateTables();
			ConnectDatabase.disconnect();
		}
		else if (d.parts[len-1] == "addPlayer")
		{
			new PlayerAPI().addPlayer(); // add new player data in URL
		}
		
		else if (d.parts[len-1] == "ReturnData")
		{
			ReturnData.ReturnAll(); //return all player data in URL
		}
		
		else if (d.parts[len-1] == "ReturnLocation")
		{
			userInputString = userInput.get("Location");
			ReturnData.Location(userInputString); //return locations of players URL
		}
		
		else if (d.parts[len-1] == "ReturnPlayer")
		{
			userInputString = userInput.get("Player");
			ReturnData.PlayerScores(userInputString); //return all scores of player URL
		}
		
		else if (d.parts[len-1] == "Delete")
		{
			userInputString = userInput.get("ID");
			ReturnData.Delete(userInputString); //return all scores of player URL
		}
		
		else if (d.parts[len-1] == "ReturnWeekly")
		{
			
			ReturnData.Weekly(); //return all scores of player URL
		}
	}


}