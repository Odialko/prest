// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvestmentListResponse {

 bool get success; int get count; List<InvestmentResponse> get data;
/// Create a copy of InvestmentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestmentListResponseCopyWith<InvestmentListResponse> get copyWith => _$InvestmentListResponseCopyWithImpl<InvestmentListResponse>(this as InvestmentListResponse, _$identity);

  /// Serializes this InvestmentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestmentListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InvestmentListResponse(success: $success, count: $count, data: $data)';
}


}

/// @nodoc
abstract mixin class $InvestmentListResponseCopyWith<$Res>  {
  factory $InvestmentListResponseCopyWith(InvestmentListResponse value, $Res Function(InvestmentListResponse) _then) = _$InvestmentListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, int count, List<InvestmentResponse> data
});




}
/// @nodoc
class _$InvestmentListResponseCopyWithImpl<$Res>
    implements $InvestmentListResponseCopyWith<$Res> {
  _$InvestmentListResponseCopyWithImpl(this._self, this._then);

  final InvestmentListResponse _self;
  final $Res Function(InvestmentListResponse) _then;

/// Create a copy of InvestmentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<InvestmentResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [InvestmentListResponse].
extension InvestmentListResponsePatterns on InvestmentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvestmentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvestmentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvestmentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvestmentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvestmentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvestmentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int count,  List<InvestmentResponse> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvestmentListResponse() when $default != null:
return $default(_that.success,_that.count,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int count,  List<InvestmentResponse> data)  $default,) {final _that = this;
switch (_that) {
case _InvestmentListResponse():
return $default(_that.success,_that.count,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int count,  List<InvestmentResponse> data)?  $default,) {final _that = this;
switch (_that) {
case _InvestmentListResponse() when $default != null:
return $default(_that.success,_that.count,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvestmentListResponse implements InvestmentListResponse {
  const _InvestmentListResponse({required this.success, required this.count, required final  List<InvestmentResponse> data}): _data = data;
  factory _InvestmentListResponse.fromJson(Map<String, dynamic> json) => _$InvestmentListResponseFromJson(json);

@override final  bool success;
@override final  int count;
 final  List<InvestmentResponse> _data;
@override List<InvestmentResponse> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of InvestmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvestmentListResponseCopyWith<_InvestmentListResponse> get copyWith => __$InvestmentListResponseCopyWithImpl<_InvestmentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvestmentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvestmentListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'InvestmentListResponse(success: $success, count: $count, data: $data)';
}


}

/// @nodoc
abstract mixin class _$InvestmentListResponseCopyWith<$Res> implements $InvestmentListResponseCopyWith<$Res> {
  factory _$InvestmentListResponseCopyWith(_InvestmentListResponse value, $Res Function(_InvestmentListResponse) _then) = __$InvestmentListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, int count, List<InvestmentResponse> data
});




}
/// @nodoc
class __$InvestmentListResponseCopyWithImpl<$Res>
    implements _$InvestmentListResponseCopyWith<$Res> {
  __$InvestmentListResponseCopyWithImpl(this._self, this._then);

  final _InvestmentListResponse _self;
  final $Res Function(_InvestmentListResponse) _then;

/// Create a copy of InvestmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? data = null,}) {
  return _then(_InvestmentListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<InvestmentResponse>,
  ));
}


}

// dart format on
