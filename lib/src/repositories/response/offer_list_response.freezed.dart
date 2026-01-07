// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferListResponse {

// Using @Default to prevent 'null is not a subtype of bool' in release builds
 bool get success; int get count; List<OfferResponse> get data;
/// Create a copy of OfferListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferListResponseCopyWith<OfferListResponse> get copyWith => _$OfferListResponseCopyWithImpl<OfferListResponse>(this as OfferListResponse, _$identity);

  /// Serializes this OfferListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'OfferListResponse(success: $success, count: $count, data: $data)';
}


}

/// @nodoc
abstract mixin class $OfferListResponseCopyWith<$Res>  {
  factory $OfferListResponseCopyWith(OfferListResponse value, $Res Function(OfferListResponse) _then) = _$OfferListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, int count, List<OfferResponse> data
});




}
/// @nodoc
class _$OfferListResponseCopyWithImpl<$Res>
    implements $OfferListResponseCopyWith<$Res> {
  _$OfferListResponseCopyWithImpl(this._self, this._then);

  final OfferListResponse _self;
  final $Res Function(OfferListResponse) _then;

/// Create a copy of OfferListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<OfferResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferListResponse].
extension OfferListResponsePatterns on OfferListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferListResponse value)  $default,){
final _that = this;
switch (_that) {
case _OfferListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OfferListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int count,  List<OfferResponse> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int count,  List<OfferResponse> data)  $default,) {final _that = this;
switch (_that) {
case _OfferListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int count,  List<OfferResponse> data)?  $default,) {final _that = this;
switch (_that) {
case _OfferListResponse() when $default != null:
return $default(_that.success,_that.count,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferListResponse implements OfferListResponse {
  const _OfferListResponse({this.success = false, this.count = 0, final  List<OfferResponse> data = const []}): _data = data;
  factory _OfferListResponse.fromJson(Map<String, dynamic> json) => _$OfferListResponseFromJson(json);

// Using @Default to prevent 'null is not a subtype of bool' in release builds
@override@JsonKey() final  bool success;
@override@JsonKey() final  int count;
 final  List<OfferResponse> _data;
@override@JsonKey() List<OfferResponse> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of OfferListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferListResponseCopyWith<_OfferListResponse> get copyWith => __$OfferListResponseCopyWithImpl<_OfferListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'OfferListResponse(success: $success, count: $count, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OfferListResponseCopyWith<$Res> implements $OfferListResponseCopyWith<$Res> {
  factory _$OfferListResponseCopyWith(_OfferListResponse value, $Res Function(_OfferListResponse) _then) = __$OfferListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, int count, List<OfferResponse> data
});




}
/// @nodoc
class __$OfferListResponseCopyWithImpl<$Res>
    implements _$OfferListResponseCopyWith<$Res> {
  __$OfferListResponseCopyWithImpl(this._self, this._then);

  final _OfferListResponse _self;
  final $Res Function(_OfferListResponse) _then;

/// Create a copy of OfferListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? data = null,}) {
  return _then(_OfferListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<OfferResponse>,
  ));
}


}

// dart format on
