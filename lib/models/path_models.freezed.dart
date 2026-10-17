// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Point2D {

@JsonKey(fromJson: _toInt) int get x;@JsonKey(fromJson: _toInt) int get y;
/// Create a copy of Point2D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Point2DCopyWith<Point2D> get copyWith => _$Point2DCopyWithImpl<Point2D>(this as Point2D, _$identity);

  /// Serializes this Point2D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Point2D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Point2D&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Point2D;
  return Object.hash(runtimeType,_this.x,_this.y);
}

@override
String toString() {
  final _this = this as Point2D;
  return 'Point2D(x: ${_this.x}, y: ${_this.y})';
}


}

/// @nodoc
abstract mixin class $Point2DCopyWith<$Res>  {
  factory $Point2DCopyWith(Point2D value, $Res Function(Point2D) _then) = _$Point2DCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toInt) int x,@JsonKey(fromJson: _toInt) int y
});




}
/// @nodoc
class _$Point2DCopyWithImpl<$Res>
    implements $Point2DCopyWith<$Res> {
  _$Point2DCopyWithImpl(this._self, this._then);

  final Point2D _self;
  final $Res Function(Point2D) _then;

/// Create a copy of Point2D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(Point2D(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Point2D].
extension Point2DPatterns on Point2D {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Point2D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Point2D() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Point2D value)  $default,){
final _that = this;
switch (_that) {
case _Point2D():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Point2D value)?  $default,){
final _that = this;
switch (_that) {
case _Point2D() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int x, @JsonKey(fromJson: _toInt)  int y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Point2D() when $default != null:
return $default(_that.x,_that.y);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int x, @JsonKey(fromJson: _toInt)  int y)  $default,) {final _that = this;
switch (_that) {
case _Point2D():
return $default(_that.x,_that.y);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toInt)  int x, @JsonKey(fromJson: _toInt)  int y)?  $default,) {final _that = this;
switch (_that) {
case _Point2D() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Point2D implements Point2D {
  const _Point2D({@JsonKey(fromJson: _toInt) required this.x, @JsonKey(fromJson: _toInt) required this.y});
  factory _Point2D.fromJson(Map<String, dynamic> json) => _$Point2DFromJson(json);

@override@JsonKey(fromJson: _toInt) final  int x;
@override@JsonKey(fromJson: _toInt) final  int y;

/// Create a copy of Point2D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Point2DCopyWith<_Point2D> get copyWith => __$Point2DCopyWithImpl<_Point2D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Point2DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Point2D&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y);
}

@override
String toString() {
    return 'Point2D(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$Point2DCopyWith<$Res> implements $Point2DCopyWith<$Res> {
  factory _$Point2DCopyWith(_Point2D value, $Res Function(_Point2D) _then) = __$Point2DCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toInt) int x,@JsonKey(fromJson: _toInt) int y
});




}
/// @nodoc
class __$Point2DCopyWithImpl<$Res>
    implements _$Point2DCopyWith<$Res> {
  __$Point2DCopyWithImpl(this._self, this._then);

  final _Point2D _self;
  final $Res Function(_Point2D) _then;

/// Create a copy of Point2D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_Point2D(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Grid {

 int get width; int get height; Set<Point2D> get walls;
/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridCopyWith<Grid> get copyWith => _$GridCopyWithImpl<Grid>(this as Grid, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Grid;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Grid&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&const DeepCollectionEquality().equals(other.walls, _this.walls));
}


@override
int get hashCode {
  final _this = this as Grid;
  return Object.hash(runtimeType,_this.width,_this.height,const DeepCollectionEquality().hash(_this.walls));
}

@override
String toString() {
  final _this = this as Grid;
  return 'Grid(width: ${_this.width}, height: ${_this.height}, walls: ${_this.walls})';
}


}

/// @nodoc
abstract mixin class $GridCopyWith<$Res>  {
  factory $GridCopyWith(Grid value, $Res Function(Grid) _then) = _$GridCopyWithImpl;
@useResult
$Res call({
 int width, int height, Set<Point2D> walls
});




}
/// @nodoc
class _$GridCopyWithImpl<$Res>
    implements $GridCopyWith<$Res> {
  _$GridCopyWithImpl(this._self, this._then);

  final Grid _self;
  final $Res Function(Grid) _then;

/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? height = null,Object? walls = null,}) {
  return _then(Grid(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,walls: null == walls ? _self.walls : walls // ignore: cast_nullable_to_non_nullable
as Set<Point2D>,
  ));
}

}


/// Adds pattern-matching-related methods to [Grid].
extension GridPatterns on Grid {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Grid value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Grid() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Grid value)  $default,){
final _that = this;
switch (_that) {
case _Grid():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Grid value)?  $default,){
final _that = this;
switch (_that) {
case _Grid() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int width,  int height,  Set<Point2D> walls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Grid() when $default != null:
return $default(_that.width,_that.height,_that.walls);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int width,  int height,  Set<Point2D> walls)  $default,) {final _that = this;
switch (_that) {
case _Grid():
return $default(_that.width,_that.height,_that.walls);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int width,  int height,  Set<Point2D> walls)?  $default,) {final _that = this;
switch (_that) {
case _Grid() when $default != null:
return $default(_that.width,_that.height,_that.walls);case _:
  return null;

}
}

}

/// @nodoc


class _Grid extends Grid {
  const _Grid({required this.width, required this.height,  Set<Point2D> walls = const <Point2D>{}}): _walls = walls,super._();
  

@override final  int width;
@override final  int height;
 final  Set<Point2D> _walls;
@override@JsonKey() Set<Point2D> get walls {
  if (_walls is EqualUnmodifiableSetView) return _walls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_walls);
}


/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridCopyWith<_Grid> get copyWith => __$GridCopyWithImpl<_Grid>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Grid&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.walls, _walls));
}


@override
int get hashCode {
    return Object.hash(runtimeType,width,height,const DeepCollectionEquality().hash(_walls));
}

@override
String toString() {
    return 'Grid(width: $width, height: $height, walls: $walls)';
}


}

/// @nodoc
abstract mixin class _$GridCopyWith<$Res> implements $GridCopyWith<$Res> {
  factory _$GridCopyWith(_Grid value, $Res Function(_Grid) _then) = __$GridCopyWithImpl;
@override @useResult
$Res call({
 int width, int height, Set<Point2D> walls
});




}
/// @nodoc
class __$GridCopyWithImpl<$Res>
    implements _$GridCopyWith<$Res> {
  __$GridCopyWithImpl(this._self, this._then);

  final _Grid _self;
  final $Res Function(_Grid) _then;

/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,Object? walls = null,}) {
  return _then(_Grid(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,walls: null == walls ? _self._walls : walls // ignore: cast_nullable_to_non_nullable
as Set<Point2D>,
  ));
}


}

/// @nodoc
mixin _$PathResult {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PathResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathResult()';
}


}

/// @nodoc
class $PathResultCopyWith<$Res>  {
$PathResultCopyWith(PathResult _, $Res Function(PathResult) __);
}


/// Adds pattern-matching-related methods to [PathResult].
extension PathResultPatterns on PathResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PathResultSuccess value)?  success,TResult Function( _PathResultNotFound value)?  notFound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathResultSuccess() when success != null:
return success(_that);case _PathResultNotFound() when notFound != null:
return notFound(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PathResultSuccess value)  success,required TResult Function( _PathResultNotFound value)  notFound,}){
final _that = this;
switch (_that) {
case _PathResultSuccess():
return success(_that);case _PathResultNotFound():
return notFound(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PathResultSuccess value)?  success,TResult? Function( _PathResultNotFound value)?  notFound,}){
final _that = this;
switch (_that) {
case _PathResultSuccess() when success != null:
return success(_that);case _PathResultNotFound() when notFound != null:
return notFound(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Point2D> path)?  success,TResult Function()?  notFound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathResultSuccess() when success != null:
return success(_that.path);case _PathResultNotFound() when notFound != null:
return notFound();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Point2D> path)  success,required TResult Function()  notFound,}) {final _that = this;
switch (_that) {
case _PathResultSuccess():
return success(_that.path);case _PathResultNotFound():
return notFound();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Point2D> path)?  success,TResult? Function()?  notFound,}) {final _that = this;
switch (_that) {
case _PathResultSuccess() when success != null:
return success(_that.path);case _PathResultNotFound() when notFound != null:
return notFound();case _:
  return null;

}
}

}

/// @nodoc


class _PathResultSuccess implements PathResult {
  const _PathResultSuccess({required  List<Point2D> path}): _path = path;
  

 final  List<Point2D> _path;
 List<Point2D> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of PathResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathResultSuccessCopyWith<_PathResultSuccess> get copyWith => __$PathResultSuccessCopyWithImpl<_PathResultSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathResultSuccess&&const DeepCollectionEquality().equals(other.path, _path));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_path));
}

@override
String toString() {
    return 'PathResult.success(path: $path)';
}


}

/// @nodoc
abstract mixin class _$PathResultSuccessCopyWith<$Res> implements $PathResultCopyWith<$Res> {
  factory _$PathResultSuccessCopyWith(_PathResultSuccess value, $Res Function(_PathResultSuccess) _then) = __$PathResultSuccessCopyWithImpl;
@useResult
$Res call({
 List<Point2D> path
});




}
/// @nodoc
class __$PathResultSuccessCopyWithImpl<$Res>
    implements _$PathResultSuccessCopyWith<$Res> {
  __$PathResultSuccessCopyWithImpl(this._self, this._then);

  final _PathResultSuccess _self;
  final $Res Function(_PathResultSuccess) _then;

/// Create a copy of PathResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_PathResultSuccess(
path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<Point2D>,
  ));
}


}

/// @nodoc


class _PathResultNotFound implements PathResult {
  const _PathResultNotFound();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathResultNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathResult.notFound()';
}


}




// dart format on
