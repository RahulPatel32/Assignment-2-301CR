<?php

// Generated by Haxe 3.3.0
interface sys_db_Connection {
	function request($s);
	function close();
	function addValue($s, $v);
	function lastInsertId();
	function dbName();
}
