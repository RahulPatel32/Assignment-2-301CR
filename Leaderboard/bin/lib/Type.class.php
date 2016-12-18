<?php

// Generated by Haxe 3.3.0
class Type {
	public function __construct(){}
	static function getClass($o) {
		if($o === null) {
			return null;
		}
		$tmp = is_array($o);
		if($tmp) {
			$tmp1 = null;
			$tmp2 = count($o);
			if($tmp2 === 2) {
				$tmp1 = is_callable($o);
			} else {
				$tmp1 = false;
			}
			if($tmp1) {
				return null;
			}
			return _hx_ttype("Array");
		}
		$tmp3 = is_string($o);
		if($tmp3) {
			$tmp4 = _hx_is_lambda($o);
			if($tmp4) {
				return null;
			}
			return _hx_ttype("String");
		}
		$tmp5 = !is_object($o);
		if($tmp5) {
			return null;
		}
		$c = get_class($o);
		$tmp6 = null;
		$tmp7 = null;
		if($c !== false) {
			$tmp7 = $c === "_hx_anonymous";
		} else {
			$tmp7 = true;
		}
		if(!$tmp7) {
			$tmp6 = is_subclass_of($c, "enum");
		} else {
			$tmp6 = true;
		}
		if($tmp6) {
			return null;
		} else {
			return _hx_ttype($c);
		}
	}
	static function getClassName($c) {
		if($c === null) {
			return null;
		}
		return $c->__qname__;
	}
	static function getEnumName($e) {
		return $e->__qname__;
	}
	static function resolveClass($name) {
		$c = _hx_qtype($name);
		$tmp = $c instanceof _hx_class || $c instanceof _hx_interface;
		if($tmp) {
			return $c;
		} else {
			return null;
		}
	}
	static function resolveEnum($name) {
		$e = _hx_qtype($name);
		$tmp = $e instanceof _hx_enum;
		if($tmp) {
			return $e;
		} else {
			return null;
		}
	}
	static function createEmptyInstance($cl) {
		if($cl->__qname__ === "Array") {
			return (new _hx_array(array()));
		}
		if($cl->__qname__ === "String") {
			return "";
		}
		try {
			php_Boot::$skip_constructor = true;
			$rfl = $cl->__rfl__();
			if($rfl === null) {
				return null;
			}
			$m = $rfl->getConstructor();
			$nargs = $m->getNumberOfRequiredParameters();
			$i = null;
			if($nargs > 0) {
				$args = array_fill(0, $m->getNumberOfRequiredParameters(), null);
				$i = $rfl->newInstanceArgs($args);
			} else {
				$i = $rfl->newInstanceArgs(array());
			}
			php_Boot::$skip_constructor = false;
			return $i;
		}catch(Exception $__hx__e) {
			$_ex_ = ($__hx__e instanceof HException) && $__hx__e->getCode() == null ? $__hx__e->e : $__hx__e;
			$e = $_ex_;
			{
				php_Boot::$skip_constructor = false;
				$tmp = Std::string($cl);
				throw new HException("Unable to instantiate " . _hx_string_or_null($tmp));
			}
		}
	}
	static function createEnum($e, $constr, $params = null) {
		$f = Reflect::field($e, $constr);
		if($f === null) {
			throw new HException("No such constructor " . _hx_string_or_null($constr));
		}
		$tmp = Reflect::isFunction($f);
		if($tmp) {
			if($params === null) {
				throw new HException("Constructor " . _hx_string_or_null($constr) . " need parameters");
			}
			return Reflect::callMethod($e, $f, $params);
		}
		$tmp1 = null;
		if($params !== null) {
			$tmp1 = $params->length !== 0;
		} else {
			$tmp1 = false;
		}
		if($tmp1) {
			throw new HException("Constructor " . _hx_string_or_null($constr) . " does not need parameters");
		}
		return $f;
	}
	static function getEnumConstructs($e) {
		$tmp = $e->__tname__ == 'Bool';
		if($tmp) {
			return (new _hx_array(array("true", "false")));
		}
		$tmp1 = $e->__tname__ == 'Void';
		if($tmp1) {
			return (new _hx_array(array()));
		}
		return new _hx_array($e->__constructors);
	}
	static function typeof($v) {
		if($v === null) {
			return ValueType::$TNull;
		}
		$tmp = is_array($v);
		if($tmp) {
			$tmp1 = is_callable($v);
			if($tmp1) {
				return ValueType::$TFunction;
			}
			return ValueType::TClass(_hx_qtype("Array"));
		}
		$tmp2 = is_string($v);
		if($tmp2) {
			$tmp3 = _hx_is_lambda($v);
			if($tmp3) {
				return ValueType::$TFunction;
			}
			return ValueType::TClass(_hx_qtype("String"));
		}
		$tmp4 = is_bool($v);
		if($tmp4) {
			return ValueType::$TBool;
		}
		$tmp5 = is_int($v);
		if($tmp5) {
			return ValueType::$TInt;
		}
		$tmp6 = is_float($v);
		if($tmp6) {
			return ValueType::$TFloat;
		}
		$tmp7 = $v instanceof _hx_anonymous;
		if($tmp7) {
			return ValueType::$TObject;
		}
		$tmp8 = $v instanceof _hx_enum;
		if($tmp8) {
			return ValueType::$TObject;
		}
		$tmp9 = $v instanceof _hx_class;
		if($tmp9) {
			return ValueType::$TObject;
		}
		$c = _hx_ttype(get_class($v));
		$tmp10 = $c instanceof _hx_enum;
		if($tmp10) {
			return ValueType::TEnum($c);
		}
		$tmp11 = $c instanceof _hx_class;
		if($tmp11) {
			return ValueType::TClass($c);
		}
		return ValueType::$TUnknown;
	}
	function __toString() { return 'Type'; }
}
