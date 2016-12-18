<?php

// Generated by Haxe 3.3.0
class haxe_Json {
	public function __construct(){}
	static function phpJsonDecode($json) {
		$val = json_decode($json);
		return haxe_Json::convertAfterDecode($val);
	}
	static function convertAfterDecode($val) {
		$arr = null;
		$tmp = is_object($val);
		if($tmp) {
			$arr1 = php_Lib::associativeArrayOfObject($val);
			$arr = array_map((isset(haxe_Json::$convertAfterDecode) ? haxe_Json::$convertAfterDecode: array("haxe_Json", "convertAfterDecode")), $arr1);
			return _hx_anonymous($arr);
		} else {
			$tmp1 = is_array($val);
			if($tmp1) {
				$arr = array_map((isset(haxe_Json::$convertAfterDecode) ? haxe_Json::$convertAfterDecode: array("haxe_Json", "convertAfterDecode")), $val);
				return new _hx_array($arr);
			} else {
				return $val;
			}
		}
	}
	static function phpJsonEncode($val, $replacer = null, $space = null) {
		$tmp = null;
		if(null === $replacer) {
			$tmp = null !== $space;
		} else {
			$tmp = true;
		}
		if($tmp) {
			return haxe_format_JsonPrinter::hprint($val, $replacer, $space);
		}
		$json = json_encode(haxe_Json::convertBeforeEncode($val));
		$tmp1 = ($json === false);
		if($tmp1) {
			throw new HException("invalid json");
		} else {
			return $json;
		}
	}
	static function convertBeforeEncode($val) {
		$arr = null;
		$tmp = is_object($val);
		if($tmp) {
			$_g = get_class($val);
			switch($_g) {
			case "Date":{
				return Std::string($val);
			}break;
			case "HList":{
				$tmp1 = Lambda::harray($val);
				$arr = php_Lib::toPhpArray($tmp1);
			}break;
			case "IntMap":case "StringMap":{
				$arr = php_Lib::associativeArrayOfHash($val);
			}break;
			case "_hx_array":{
				$arr = php_Lib::toPhpArray($val);
			}break;
			case "_hx_enum":{
				return $val->index;
			}break;
			case "_hx_anonymous":case "stdClass":{
				$arr = php_Lib::associativeArrayOfObject($val);
			}break;
			default:{
				$arr = php_Lib::associativeArrayOfObject($val);
			}break;
			}
		} else {
			$tmp2 = is_array($val);
			if($tmp2) {
				$arr = $val;
			} else {
				$tmp3 = null;
				$tmp4 = is_float($val);
				if($tmp4) {
					$tmp3 = !is_finite($val);
				} else {
					$tmp3 = false;
				}
				if($tmp3) {
					$val = null;
				}
				return $val;
			}
		}
		return array_map((isset(haxe_Json::$convertBeforeEncode) ? haxe_Json::$convertBeforeEncode: array("haxe_Json", "convertBeforeEncode")), $arr);
	}
	function __toString() { return 'haxe.Json'; }
}
