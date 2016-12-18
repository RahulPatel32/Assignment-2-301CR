package api;
import haxe.Json;
import php.Lib;
import sys.FileStat;
import sys.db.Types.SDateTime;
import sys.io.File;


/**
 * ...
 * @author Rahul
 */
class ReturnData 
{

	public function new() 
	{
		
	}
	
public static function convertToHaxeDateTime(s_date:SDateTime):Date 
	{
		var t_date:String;

		t_date = s_date.getFullYear() + "-" + (s_date.getMonth() + 1) + "-" + s_date.getDate() + " " + s_date.getHours() + ":" + s_date.getMinutes() + ":" + s_date.getSeconds();

		return Date.fromString(t_date);
	}
	
	//funtion to return all player data
	public static function ReturnAll()
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("SELECT * FROM player"); // request all player information
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); //convert json information into string for parser to display data
	}
	
	//function to return player specific demographic Area API
	public static function Location(location:String)
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("SELECT * FROM player WHERE location ='" + location + "' ORDER by value DESC LIMIT 10"); // request player location from player table
			
			
			//request information from the table headings
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); //convert json information into string for parser to display data
	}
	


	//function to return player history scores
	public static function PlayerScores(name:String)
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("SELECT * FROM player WHERE name ='" + name + "' ORDER by value DESC"); // request all player information
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); //convert json information into string for parser to display data
	}
	


//Delete a player from the table
	public static function Delete(id:String)
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("DELETE FROM player WHERE id ='" + id + "'"); // request all player information
			
	}
	
//Get weekly score 
	public static function Weekly()
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("SELECT * FROM player WHERE date BETWEEN'" + Date.fromTime(Date.now().getTime() - 7*24*3600*1000).toString() + "'AND'" + Date.now().toString() + "' ORDER by value DESC"); // request all player information
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); //convert json information into string for parser to display data
			
	}
	
	//Create backup file
	public static function Backup()
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("SELECT * FROM player"); // request all player information
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({ID: row.id, Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			var saveInfo = Json.stringify(info); //convert json information into string for parser to display data
			
			
			
			File.saveContent("BackUp.JSON", saveInfo);
			
	}
	
	
}

