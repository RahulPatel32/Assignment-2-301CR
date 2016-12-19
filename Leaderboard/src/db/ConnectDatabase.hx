package db;

import sys.db.Manager;

/**
 * ...
 * @author Rahul
 */

 /**
  * Connect/disconnect database class
  * User matches the name admin username for database
  * Pass to grant admin access to leaderboard
  * Database must match name of the database for the leaderboard
  */
class ConnectDatabase 
{
	
	/**
	 * Connect to Database function
	 */
	public static function Connect() 
	{
		var cnx = sys.db.Mysql.connect({
			   host : "localhost",
			   port : 3306,
			   user : "leaderbo_Rahul",
			   pass : "123Admin123",
			   database : "leaderbo_Leaderboard", 
			   socket : null,
			});
			
	sys.db.Manager.cnx = cnx;
	Manager.initialize();

	}
	
	/**
	 * Disconnect Database function
	 */
	
	public static function disconnect()
	{
		Manager.cleanup();
		Manager.cnx.close();
	}
	
	/**
	 * Function to create tables for database if table does not already exist
	 */
	
	public static function CreateTables()
	{
		if ( !sys.db.TableCreate.exists(Player.manager) )
		{
			sys.db.TableCreate.create(Player.manager);
		}
	
	}

	
}