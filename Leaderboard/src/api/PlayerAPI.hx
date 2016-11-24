package api;
import db.ConnectDatabase;
import db.Player;
import php.Lib;
import php.Web;

/**
 * ...
 * @author Rahul
 */
class PlayerAPI 
{

	public function new() 
	{
		
	
	}
	
	public function addPlayer()
	{
	var p = new Player();
	var data = Web.getParams();
	p.name = data.get("name");
	p.location = data.get("location");
	p.value = 20;
	p.date = Date.now();
	ConnectDatabase.Connect();
	p.insert();
	ConnectDatabase.disconnect();
	Lib.print("player added");
	}
}