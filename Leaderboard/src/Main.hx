package;

import api.PlayerAPI;
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

		Lib.print("Hello Haxe/PHP");
		routing();
	}

	static function routing()
	{
		var d = new Dispatch(Web.getURI(), Web.getParams());
		var len:Int = d.parts.length;
		var i:Int = 0;
				
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
	}
	

	
}