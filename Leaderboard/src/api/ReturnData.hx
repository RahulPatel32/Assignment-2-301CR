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

 
 /**
  * Class to return data from paramters set in the URL
  * Convert the Haxe DateTime to SQL DateTime for the SQL database
  * Functions to request different data, (ReturnAll, Location, PlayerScores, Weekly, Delete and Backup Leaderboard data) 
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
	
	/**
	 * Function to return all data from leaderboard table
	 * Create a new JSON array to store extracted data
	 * After "info" in URL, store data 
	 * Perform request to get all data from the Player table
	 * Convert data to JSON string
	 */
	public static function ReturnAll()
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); 
			var info = {data:JsonArray}; 
			var Request = cnx.request("SELECT * FROM Player");
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); 
	}
	
	/**
	 * Function to return all data from leaderboard table by location
	 * Create a new JSON array to store extracted data
	 * After "info" in URL, store data 
	 * Perform request to get all data from the Player table where location matches specified user input and order by top 10
	 * Convert data to JSON string
	 */
	public static function Location(location:String)
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); 
			var info = {data:JsonArray}; 
			var Request = cnx.request("SELECT * FROM Player WHERE location ='" + location + "' ORDER by value DESC LIMIT 10");
			
			
			//request information from the table headings
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); 
	}
	


	/**
	 * Function to return all data from leaderboard table by location
	 * Create a new JSON array to store extracted data
	 * After "info" in URL, store data 
	 * Perform request to get all data from the Player table where name matches specified user input and order by top 10
	 * Convert data to JSON string
	 */
	public static function PlayerScores(name:String)
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); 
			var info = {data:JsonArray};
			var Request = cnx.request("SELECT * FROM Player WHERE name ='" + name + "' ORDER by value DESC"); 
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); 
	}
	


	/**
	 * Function to return all data from leaderboard table by location
	 * Create a new JSON array to store extracted data
	 * After "info" in URL, store data 
	 * Perform request to get all data macthing specfied ID the delete the data entry from the table
	 */
	public static function Delete(id:String)
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("DELETE FROM Player WHERE id ='" + id + "'"); // request all player information
			
	}
	
	/**
	 * Function to return all data from leaderboard table by location
	 * Create a new JSON array to store extracted data
	 * After "info" in URL, store data 
	 * Perform request to get all data from the Player table where date matches most recent date and seven days before and put in descending order
	 * Convert data to JSON string
	 */
	public static function Weekly()
	{
	var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); 
			var info = {data:JsonArray}; 
			var Request = cnx.request("SELECT * FROM Player WHERE date BETWEEN'" + Date.fromTime(Date.now().getTime() - 7*24*3600*1000).toString() + "'AND'" + Date.now().toString() + "' ORDER by value DESC"); 
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			Lib.print(Json.stringify(info)); 
			
	}
	
	/**
	 * Function to get all data from leaderboard table
	 * Create a new JSON array to store extracted data
	 * After "info" in URL, store data 
	 * Perform request to get all data from the Player table
	 * Convert data to JSON string and create a save location
	 * save the location with the JSON string
	 * 
	 */
	public static function Backup()
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
	
			var JsonArray = new Array(); //create empty array to store json data
			var info = {data:JsonArray}; // everything after "info" is stored in array
			var Request = cnx.request("SELECT * FROM Player"); // request all player information
			
			
			//request information from the table headings 
			for (row in Request){
				info.data.push({ID: row.id, Name: row.name, Location: row.location, Value: row.value, Time: convertToHaxeDateTime(row.date)});
			
			}
			var saveInfo = Json.stringify(info); //convert json information into string for parser to display data
			
			
			
			File.saveContent("BackUp.JSON", saveInfo); // saves the JSON string
			
	}
	
	
}

