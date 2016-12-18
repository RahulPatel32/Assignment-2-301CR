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
	
	public function addPlayer()
	{
	var p = new Player();
	var data = Web.getParams();
	var jsonData = data.get("info"); //retrieve json data after "info" and assign to jsonData
	var jsonString = Json.parse(jsonData); //store jsonData in jsonString
	
	//convert player data to json strings
	p.name = jsonString.Name; 
	p.location = jsonString.Location;
	p.value = jsonString.Value;
	
	p.date = convertToSQLDateTime(Date.now()); //call function to convert Haxe DateTime to SQL DateTime
	
	/*p.name = data.get("name");
	p.location = data.get("location");
	p.value = 20;
	p.date = convertToSQLDateTime(Date.now());
	*/
	
	ConnectDatabase.Connect(); //contect to the database
	p.insert(); // insert player data
	ConnectDatabase.disconnect(); //disconnect database
	Lib.print("player added");
	ReturnData.Backup();// make back up from ReturnData.hx
	}
}