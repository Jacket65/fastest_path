// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProcessState {

 ProcessStatus get status; String get url; List<CalculationResult> get results; double get progress; String? get errorMessage; List<Map<String, dynamic>> get submissionResults;
/// Create a copy of ProcessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessStateCopyWith<ProcessState> get copyWith => _$ProcessStateCopyWithImpl<ProcessState>(this as ProcessState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProcessState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.url, _this.url) || other.url == _this.url)&&const DeepCollectionEquality().equals(other.results, _this.results)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&const DeepCollectionEquality().equals(other.submissionResults, _this.submissionResults));
}


@override
int get hashCode {
  final _this = this as ProcessState;
  return Object.hash(runtimeType,_this.status,_this.url,const DeepCollectionEquality().hash(_this.results),_this.progress,_this.errorMessage,const DeepCollectionEquality().hash(_this.submissionResults));
}

@override
String toString() {
  final _this = this as ProcessState;
  return 'ProcessState(status: ${_this.status}, url: ${_this.url}, results: ${_this.results}, progress: ${_this.progress}, errorMessage: ${_this.errorMessage}, submissionResults: ${_this.submissionResults})';
}


}

/// @nodoc
abstract mixin class $ProcessStateCopyWith<$Res>  {
  factory $ProcessStateCopyWith(ProcessState value, $Res Function(ProcessState) _then) = _$ProcessStateCopyWithImpl;
@useResult
$Res call({
 ProcessStatus status, String url, List<CalculationResult> results, double progress, String? errorMessage, List<Map<String, dynamic>> submissionResults
});




}
/// @nodoc
class _$ProcessStateCopyWithImpl<$Res>
    implements $ProcessStateCopyWith<$Res> {
  _$ProcessStateCopyWithImpl(this._self, this._then);

  final ProcessState _self;
  final $Res Function(ProcessState) _then;

/// Create a copy of ProcessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? url = null,Object? results = null,Object? progress = null,Object? errorMessage = freezed,Object? submissionResults = null,}) {
  return _then(ProcessState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProcessStatus,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<CalculationResult>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,submissionResults: null == submissionResults ? _self.submissionResults : submissionResults // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessState].
extension ProcessStatePatterns on ProcessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessState value)  $default,){
final _that = this;
switch (_that) {
case _ProcessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessState value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProcessStatus status,  String url,  List<CalculationResult> results,  double progress,  String? errorMessage,  List<Map<String, dynamic>> submissionResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessState() when $default != null:
return $default(_that.status,_that.url,_that.results,_that.progress,_that.errorMessage,_that.submissionResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProcessStatus status,  String url,  List<CalculationResult> results,  double progress,  String? errorMessage,  List<Map<String, dynamic>> submissionResults)  $default,) {final _that = this;
switch (_that) {
case _ProcessState():
return $default(_that.status,_that.url,_that.results,_that.progress,_that.errorMessage,_that.submissionResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProcessStatus status,  String url,  List<CalculationResult> results,  double progress,  String? errorMessage,  List<Map<String, dynamic>> submissionResults)?  $default,) {final _that = this;
switch (_that) {
case _ProcessState() when $default != null:
return $default(_that.status,_that.url,_that.results,_that.progress,_that.errorMessage,_that.submissionResults);case _:
  return null;

}
}

}

/// @nodoc


class _ProcessState implements ProcessState {
  const _ProcessState({required this.status, required this.url, required  List<CalculationResult> results, required this.progress, required this.errorMessage, required  List<Map<String, dynamic>> submissionResults}): _results = results,_submissionResults = submissionResults;
  

@override final  ProcessStatus status;
@override final  String url;
 final  List<CalculationResult> _results;
@override List<CalculationResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  double progress;
@override final  String? errorMessage;
 final  List<Map<String, dynamic>> _submissionResults;
@override List<Map<String, dynamic>> get submissionResults {
  if (_submissionResults is EqualUnmodifiableListView) return _submissionResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_submissionResults);
}


/// Create a copy of ProcessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessStateCopyWith<_ProcessState> get copyWith => __$ProcessStateCopyWithImpl<_ProcessState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessState&&(identical(other.status, status) || other.status == status)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.results, _results)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.submissionResults, _submissionResults));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,url,const DeepCollectionEquality().hash(_results),progress,errorMessage,const DeepCollectionEquality().hash(_submissionResults));
}

@override
String toString() {
    return 'ProcessState(status: $status, url: $url, results: $results, progress: $progress, errorMessage: $errorMessage, submissionResults: $submissionResults)';
}


}

/// @nodoc
abstract mixin class _$ProcessStateCopyWith<$Res> implements $ProcessStateCopyWith<$Res> {
  factory _$ProcessStateCopyWith(_ProcessState value, $Res Function(_ProcessState) _then) = __$ProcessStateCopyWithImpl;
@override @useResult
$Res call({
 ProcessStatus status, String url, List<CalculationResult> results, double progress, String? errorMessage, List<Map<String, dynamic>> submissionResults
});




}
/// @nodoc
class __$ProcessStateCopyWithImpl<$Res>
    implements _$ProcessStateCopyWith<$Res> {
  __$ProcessStateCopyWithImpl(this._self, this._then);

  final _ProcessState _self;
  final $Res Function(_ProcessState) _then;

/// Create a copy of ProcessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? url = null,Object? results = null,Object? progress = null,Object? errorMessage = freezed,Object? submissionResults = null,}) {
  return _then(_ProcessState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProcessStatus,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<CalculationResult>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,submissionResults: null == submissionResults ? _self._submissionResults : submissionResults // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
