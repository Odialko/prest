// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientResponse {

 int get id;@JsonKey(name: 'fullname') String? get fullname;@JsonKey(name: 'phone') String? get phone;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'add_user_name') String? get addUserName;@JsonKey(name: 'add_date') String? get addDate;
/// Create a copy of ClientResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientResponseCopyWith<ClientResponse> get copyWith => _$ClientResponseCopyWithImpl<ClientResponse>(this as ClientResponse, _$identity);

  /// Serializes this ClientResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.addUserName, addUserName) || other.addUserName == addUserName)&&(identical(other.addDate, addDate) || other.addDate == addDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullname,phone,email,addUserName,addDate);

@override
String toString() {
  return 'ClientResponse(id: $id, fullname: $fullname, phone: $phone, email: $email, addUserName: $addUserName, addDate: $addDate)';
}


}

/// @nodoc
abstract mixin class $ClientResponseCopyWith<$Res>  {
  factory $ClientResponseCopyWith(ClientResponse value, $Res Function(ClientResponse) _then) = _$ClientResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'fullname') String? fullname,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'email') String? email,@JsonKey(name: 'add_user_name') String? addUserName,@JsonKey(name: 'add_date') String? addDate
});




}
/// @nodoc
class _$ClientResponseCopyWithImpl<$Res>
    implements $ClientResponseCopyWith<$Res> {
  _$ClientResponseCopyWithImpl(this._self, this._then);

  final ClientResponse _self;
  final $Res Function(ClientResponse) _then;

/// Create a copy of ClientResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullname = freezed,Object? phone = freezed,Object? email = freezed,Object? addUserName = freezed,Object? addDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,addUserName: freezed == addUserName ? _self.addUserName : addUserName // ignore: cast_nullable_to_non_nullable
as String?,addDate: freezed == addDate ? _self.addDate : addDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientResponse].
extension ClientResponsePatterns on ClientResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClientResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClientResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'fullname')  String? fullname, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'add_user_name')  String? addUserName, @JsonKey(name: 'add_date')  String? addDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientResponse() when $default != null:
return $default(_that.id,_that.fullname,_that.phone,_that.email,_that.addUserName,_that.addDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'fullname')  String? fullname, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'add_user_name')  String? addUserName, @JsonKey(name: 'add_date')  String? addDate)  $default,) {final _that = this;
switch (_that) {
case _ClientResponse():
return $default(_that.id,_that.fullname,_that.phone,_that.email,_that.addUserName,_that.addDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'fullname')  String? fullname, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'add_user_name')  String? addUserName, @JsonKey(name: 'add_date')  String? addDate)?  $default,) {final _that = this;
switch (_that) {
case _ClientResponse() when $default != null:
return $default(_that.id,_that.fullname,_that.phone,_that.email,_that.addUserName,_that.addDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientResponse implements ClientResponse {
  const _ClientResponse({required this.id, @JsonKey(name: 'fullname') this.fullname, @JsonKey(name: 'phone') this.phone, @JsonKey(name: 'email') this.email, @JsonKey(name: 'add_user_name') this.addUserName, @JsonKey(name: 'add_date') this.addDate});
  factory _ClientResponse.fromJson(Map<String, dynamic> json) => _$ClientResponseFromJson(json);

@override final  int id;
@override@JsonKey(name: 'fullname') final  String? fullname;
@override@JsonKey(name: 'phone') final  String? phone;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'add_user_name') final  String? addUserName;
@override@JsonKey(name: 'add_date') final  String? addDate;

/// Create a copy of ClientResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientResponseCopyWith<_ClientResponse> get copyWith => __$ClientResponseCopyWithImpl<_ClientResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.addUserName, addUserName) || other.addUserName == addUserName)&&(identical(other.addDate, addDate) || other.addDate == addDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullname,phone,email,addUserName,addDate);

@override
String toString() {
  return 'ClientResponse(id: $id, fullname: $fullname, phone: $phone, email: $email, addUserName: $addUserName, addDate: $addDate)';
}


}

/// @nodoc
abstract mixin class _$ClientResponseCopyWith<$Res> implements $ClientResponseCopyWith<$Res> {
  factory _$ClientResponseCopyWith(_ClientResponse value, $Res Function(_ClientResponse) _then) = __$ClientResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'fullname') String? fullname,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'email') String? email,@JsonKey(name: 'add_user_name') String? addUserName,@JsonKey(name: 'add_date') String? addDate
});




}
/// @nodoc
class __$ClientResponseCopyWithImpl<$Res>
    implements _$ClientResponseCopyWith<$Res> {
  __$ClientResponseCopyWithImpl(this._self, this._then);

  final _ClientResponse _self;
  final $Res Function(_ClientResponse) _then;

/// Create a copy of ClientResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullname = freezed,Object? phone = freezed,Object? email = freezed,Object? addUserName = freezed,Object? addDate = freezed,}) {
  return _then(_ClientResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,addUserName: freezed == addUserName ? _self.addUserName : addUserName // ignore: cast_nullable_to_non_nullable
as String?,addDate: freezed == addDate ? _self.addDate : addDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
