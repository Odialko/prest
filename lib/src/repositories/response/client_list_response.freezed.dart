// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientListResponse {

 bool get result; String? get message; List<ClientResponse> get data;
/// Create a copy of ClientListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientListResponseCopyWith<ClientListResponse> get copyWith => _$ClientListResponseCopyWithImpl<ClientListResponse>(this as ClientListResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientListResponse&&(identical(other.result, result) || other.result == result)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,result,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ClientListResponse(result: $result, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ClientListResponseCopyWith<$Res>  {
  factory $ClientListResponseCopyWith(ClientListResponse value, $Res Function(ClientListResponse) _then) = _$ClientListResponseCopyWithImpl;
@useResult
$Res call({
 bool result, String? message, List<ClientResponse> data
});




}
/// @nodoc
class _$ClientListResponseCopyWithImpl<$Res>
    implements $ClientListResponseCopyWith<$Res> {
  _$ClientListResponseCopyWithImpl(this._self, this._then);

  final ClientListResponse _self;
  final $Res Function(ClientListResponse) _then;

/// Create a copy of ClientListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? message = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ClientResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientListResponse].
extension ClientListResponsePatterns on ClientListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClientListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClientListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool result,  String? message,  List<ClientResponse> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientListResponse() when $default != null:
return $default(_that.result,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool result,  String? message,  List<ClientResponse> data)  $default,) {final _that = this;
switch (_that) {
case _ClientListResponse():
return $default(_that.result,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool result,  String? message,  List<ClientResponse> data)?  $default,) {final _that = this;
switch (_that) {
case _ClientListResponse() when $default != null:
return $default(_that.result,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _ClientListResponse implements ClientListResponse {
  const _ClientListResponse({required this.result, this.message, final  List<ClientResponse> data = const []}): _data = data;
  

@override final  bool result;
@override final  String? message;
 final  List<ClientResponse> _data;
@override@JsonKey() List<ClientResponse> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ClientListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientListResponseCopyWith<_ClientListResponse> get copyWith => __$ClientListResponseCopyWithImpl<_ClientListResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientListResponse&&(identical(other.result, result) || other.result == result)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,result,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ClientListResponse(result: $result, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ClientListResponseCopyWith<$Res> implements $ClientListResponseCopyWith<$Res> {
  factory _$ClientListResponseCopyWith(_ClientListResponse value, $Res Function(_ClientListResponse) _then) = __$ClientListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool result, String? message, List<ClientResponse> data
});




}
/// @nodoc
class __$ClientListResponseCopyWithImpl<$Res>
    implements _$ClientListResponseCopyWith<$Res> {
  __$ClientListResponseCopyWithImpl(this._self, this._then);

  final _ClientListResponse _self;
  final $Res Function(_ClientListResponse) _then;

/// Create a copy of ClientListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? message = freezed,Object? data = null,}) {
  return _then(_ClientListResponse(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ClientResponse>,
  ));
}


}

// dart format on
