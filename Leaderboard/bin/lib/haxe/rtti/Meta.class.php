<?php

// Generated by Haxe 3.3.0
class haxe_rtti_Meta {
	public function __construct(){}
	static function getType($t) {
		$meta = haxe_rtti_Meta::getMeta($t);
		$tmp = null;
		if($meta !== null) {
			$tmp = _hx_field($meta, "obj") === null;
		} else {
			$tmp = true;
		}
		if($tmp) {
			return _hx_anonymous(array());
		} else {
			return $meta->obj;
		}
	}
	static function isInterface($t) {
		return $t instanceof _hx_interface;
	}
	static function getMeta($t) {
		$ret = Reflect::field($t, "__meta__");
		$tmp = null;
		if($ret === null) {
			$tmp = Std::is($t, _hx_qtype("Class"));
		} else {
			$tmp = false;
		}
		if($tmp) {
			$tmp1 = haxe_rtti_Meta::isInterface($t);
			if($tmp1) {
				$cls = Type::resolveClass(_hx_string_or_null(Type::getClassName($t)) . "_HxMeta");
				if($cls !== null) {
					return Reflect::field($cls, "__meta__");
				}
			}
		}
		return $ret;
	}
	function __toString() { return 'haxe.rtti.Meta'; }
}
