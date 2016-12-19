package api;
import db.ConnectDatabase;
import db.Player;
import haxe.Json;
import php.Lib;
import php.Web;
import sys.db.Types.SDateTime;

/**
 * ...
 * @author Rahul
 */

 /**
  * PlayerAPI Class
  * Converts Haxe DateTime to SQL so the database can store the data
  * h_date is Haxe date
  * t_date gets Haxe year, month, date, hour, minute, second and separates them using "-" operator(conversion)
  * Return new t_date
  */
class PlayerAPI 
{
	//convert Haxe DateTime to SQL DateTime
	public static function convertToSQLDateTime(h_date:Date):SDateTime
	{
		var t_date:String;
		
		t_date = h_date.getFullYear() + "-" + (h_date.getMonth() + 1) + "-" + h_date.getDate() + " " + 
		h_date.getHours() +":" + h_date.getMinutes() + ":" + h_date.getSeconds();
		
		return cast(t_date, SDateTime);
	}
	
	
	public function new() 
	{
		
	
	}
	
	
	/**
	 * Add new player function
	 * Made up verification key used to acts as a username to grant access to leaderboard server, password is also needed
	 * If statement then checks if the password in the http header matches the verification key
	 * If yes then create new player get data from URL parameters and convert JSON data to JSON string
	 * Connect to the database via connect function, insert the data into the table then disconnect the database with the new data added 
	 * Print a message to confirm data has been added
	 * Create a backup of the updated table
	 * If password doesn't match verification key then print message that it is not verified
	 */
	public function addPlayer()
	
{
	var verify = "GFJ4324ghjhRF";
	var password = Web.getClientHeader("098Haxe098");
	
	if (password == verify)
	{
	var p = new Player();
	var data = Web.getParams();
	var jsonData = data.get("info"); //retrieve json data after "info" and assign to jsonData
	var jsonString = Json.parse(jsonData); //store jsonData in jsonString
	
	/**
	 * convert player data to json strings
	 */
	p.name = jsonString.Name; 
	p.location = jsonString.Location;
	p.value = jsonString.Value;
	
	p.date = convertToSQLDateTime(Date.now()); //call function to convert Haxe DateTime to SQL DateTime
	
	
	ConnectDatabase.Connect(); //connect to the database
	p.insert(); // insert player data
	ConnectDatabase.disconnect(); //disconnect database
	Lib.print("player added");
	ReturnData.Backup();// make back up from ReturnData.hx
	}
	else 
	{
	Lib.print("Password not verified");
	}
}

}