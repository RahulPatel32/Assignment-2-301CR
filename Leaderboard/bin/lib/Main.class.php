<?php

// Generated by Haxe 3.3.0
class Main {
	public function __construct(){}
	static function main() {
		Main::routing();
	}
	static function routing() {
		$tmp = php_Web::getURI();
		$tmp1 = php_Web::getParams();
		$d = new haxe_web_Dispatch($tmp, $tmp1);
		$len = $d->parts->length;
		$userInput = php_Web::getParams();
		$userInputString = null;
		$tmp2 = $d->parts[$len - 1];
		if($tmp2 === "createTables") {
			db_ConnectDatabase::Connect();
			db_ConnectDatabase::CreateTables();
			db_ConnectDatabase::disconnect();
		} else {
			$tmp3 = $d->parts[$len - 1];
			if($tmp3 === "addPlayer") {
				_hx_deref(new api_PlayerAPI())->addPlayer();
			} else {
				$tmp4 = $d->parts[$len - 1];
				if($tmp4 === "ReturnData") {
					api_ReturnData::ReturnAll();
				} else {
					$tmp5 = $d->parts[$len - 1];
					if($tmp5 === "ReturnLocation") {
						$userInputString = $userInput->get("Location");
						api_ReturnData::Location($userInputString);
					} else {
						$tmp6 = $d->parts[$len - 1];
						if($tmp6 === "ReturnPlayer") {
							$userInputString = $userInput->get("Player");
							api_ReturnData::PlayerScores($userInputString);
						} else {
							$tmp7 = $d->parts[$len - 1];
							if($tmp7 === "Delete") {
								$userInputString = $userInput->get("ID");
								api_ReturnData::Delete($userInputString);
							} else {
								$tmp8 = $d->parts[$len - 1];
								if($tmp8 === "ReturnWeekly") {
									api_ReturnData::Weekly();
								}
							}
						}
					}
				}
			}
		}
	}
	function __toString() { return 'Main'; }
}
