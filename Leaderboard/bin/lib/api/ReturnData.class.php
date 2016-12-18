<?php

// Generated by Haxe 3.3.0
class api_ReturnData {
	public function __construct() {}
	static function convertToHaxeDateTime($s_date) {
		$t_date = null;
		$tmp = $s_date->getFullYear();
		$tmp1 = _hx_string_rec($tmp, "") . "-";
		$tmp2 = $s_date->getMonth();
		$tmp3 = _hx_string_or_null($tmp1) . _hx_string_rec(($tmp2 + 1), "") . "-";
		$tmp4 = $s_date->getDate();
		$tmp5 = _hx_string_or_null($tmp3) . _hx_string_rec($tmp4, "") . " ";
		$tmp6 = $s_date->getHours();
		$tmp7 = _hx_string_or_null($tmp5) . _hx_string_rec($tmp6, "") . ":";
		$tmp8 = $s_date->getMinutes();
		$tmp9 = _hx_string_or_null($tmp7) . _hx_string_rec($tmp8, "") . ":";
		$tmp10 = $s_date->getSeconds();
		$t_date = _hx_string_or_null($tmp9) . _hx_string_rec($tmp10, "");
		return Date::fromString($t_date);
	}
	static function ReturnAll() {
		$cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "port" => 3306, "user" => "root", "pass" => "", "database" => "leaderboard", "socket" => null)));
		$JsonArray = new _hx_array(array());
		$info = _hx_anonymous(array("data" => $JsonArray));
		$Request = $cnx->request("SELECT * FROM player");
		while(true) {
			$tmp = !$Request->hasNext();
			if($tmp) {
				break;
			}
			$row = $Request->next();
			$tmp1 = api_ReturnData::convertToHaxeDateTime($row->date);
			$info->data->push(_hx_anonymous(array("Name" => $row->name, "Location" => $row->location, "Value" => $row->value, "Time" => $tmp1)));
			unset($tmp1,$tmp,$row);
		}
		$tmp2 = haxe_Json::phpJsonEncode($info, null, null);
		php_Lib::hprint($tmp2);
	}
	static function Location($location) {
		$cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "port" => 3306, "user" => "root", "pass" => "", "database" => "leaderboard", "socket" => null)));
		$JsonArray = new _hx_array(array());
		$info = _hx_anonymous(array("data" => $JsonArray));
		$Request = $cnx->request("SELECT * FROM player WHERE location ='" . _hx_string_or_null($location) . "' ORDER by value DESC LIMIT 10");
		while(true) {
			$tmp = !$Request->hasNext();
			if($tmp) {
				break;
			}
			$row = $Request->next();
			$tmp1 = api_ReturnData::convertToHaxeDateTime($row->date);
			$info->data->push(_hx_anonymous(array("Name" => $row->name, "Location" => $row->location, "Value" => $row->value, "Time" => $tmp1)));
			unset($tmp1,$tmp,$row);
		}
		$tmp2 = haxe_Json::phpJsonEncode($info, null, null);
		php_Lib::hprint($tmp2);
	}
	static function PlayerScores($name) {
		$cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "port" => 3306, "user" => "root", "pass" => "", "database" => "leaderboard", "socket" => null)));
		$JsonArray = new _hx_array(array());
		$info = _hx_anonymous(array("data" => $JsonArray));
		$Request = $cnx->request("SELECT * FROM player WHERE name ='" . _hx_string_or_null($name) . "' ORDER by value DESC");
		while(true) {
			$tmp = !$Request->hasNext();
			if($tmp) {
				break;
			}
			$row = $Request->next();
			$tmp1 = api_ReturnData::convertToHaxeDateTime($row->date);
			$info->data->push(_hx_anonymous(array("Name" => $row->name, "Location" => $row->location, "Value" => $row->value, "Time" => $tmp1)));
			unset($tmp1,$tmp,$row);
		}
		$tmp2 = haxe_Json::phpJsonEncode($info, null, null);
		php_Lib::hprint($tmp2);
	}
	static function Delete($id) {
		$cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "port" => 3306, "user" => "root", "pass" => "", "database" => "leaderboard", "socket" => null)));
		new _hx_array(array());
		$cnx->request("DELETE FROM player WHERE id ='" . _hx_string_or_null($id) . "'");
	}
	static function Weekly() {
		$cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "port" => 3306, "user" => "root", "pass" => "", "database" => "leaderboard", "socket" => null)));
		$JsonArray = new _hx_array(array());
		$info = _hx_anonymous(array("data" => $JsonArray));
		$tmp = Date::now()->getTime();
		$tmp1 = Date::fromTime($tmp - 604800000)->toString();
		$tmp2 = "SELECT * FROM player WHERE date BETWEEN'" . _hx_string_or_null($tmp1) . "'AND'";
		$tmp3 = Date::now()->toString();
		$Request = $cnx->request(_hx_string_or_null($tmp2) . _hx_string_or_null($tmp3) . "' ORDER by value DESC");
		while(true) {
			$tmp4 = !$Request->hasNext();
			if($tmp4) {
				break;
			}
			$row = $Request->next();
			$tmp5 = api_ReturnData::convertToHaxeDateTime($row->date);
			$info->data->push(_hx_anonymous(array("Name" => $row->name, "Location" => $row->location, "Value" => $row->value, "Time" => $tmp5)));
			unset($tmp5,$tmp4,$row);
		}
		$tmp6 = haxe_Json::phpJsonEncode($info, null, null);
		php_Lib::hprint($tmp6);
	}
	static function Backup() {
		$cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "port" => 3306, "user" => "root", "pass" => "", "database" => "leaderboard", "socket" => null)));
		$JsonArray = new _hx_array(array());
		$info = _hx_anonymous(array("data" => $JsonArray));
		$Request = $cnx->request("SELECT * FROM player");
		while(true) {
			$tmp = !$Request->hasNext();
			if($tmp) {
				break;
			}
			$row = $Request->next();
			$tmp1 = api_ReturnData::convertToHaxeDateTime($row->date);
			$info->data->push(_hx_anonymous(array("ID" => $row->id, "Name" => $row->name, "Location" => $row->location, "Value" => $row->value, "Time" => $tmp1)));
			unset($tmp1,$tmp,$row);
		}
		$saveInfo = haxe_Json::phpJsonEncode($info, null, null);
		sys_io_File::saveContent("BackUp.JSON", $saveInfo);
	}
	function __toString() { return 'api.ReturnData'; }
}
