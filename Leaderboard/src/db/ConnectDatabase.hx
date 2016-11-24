package db;

import sys.db.Manager;

/**
 * ...
 * @author Rahul
 */
class ConnectDatabase 
{

	public static function Connect() 
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "root",
			   pass : "",
			   database : "leaderboard", 
			   socket : null,
			});
			
	sys.db.Manager.cnx = cnx;
	Manager.initialize();

	}
	public static function disconnect()
	{
		Manager.cleanup();
		Manager.cnx.close();
	}
		
	
	public static function CreateTables() //Create table for database
	{
		if ( !sys.db.TableCreate.exists(Player.manager) )
		{
			sys.db.TableCreate.create(Player.manager);
		}
		
		//if ( !sys.db.TableCreate.exists(Score.manager) )
		//{
			//sys.db.TableCreate.create(Score.manager);
		//}

	}

	
}