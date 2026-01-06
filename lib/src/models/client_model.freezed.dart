// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientModel {

 int get id; String get fullName; String? get phone; String? get email; String? get addUserName; String? get addDate;
/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientModelCopyWith<ClientModel> get copyWith => _$ClientModelCopyWithImpl<ClientModel>(this as ClientModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.addUserName, addUserName) || other.addUserName == addUserName)&&(identical(other.addDate, addDate) || other.addDate == addDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone,email,addUserName,addDate);

@override
String toString() {
  return 'ClientModel(id: $id, fullName: $fullName, phone: $phone, email: $email, addUserName: $addUserName, addDate: $addDate)';
}


}

/// @nodoc
abstract mixin class $ClientModelCopyWith<$Res>  {
  factory $ClientModelCopyWith(ClientModel value, $Res Function(ClientModel) _then) = _$ClientModelCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String? phone, String? email, String? addUserName, String? addDate
});




}
/// @nodoc
class _$ClientModelCopyWithImpl<$Res>
    implements $ClientModelCopyWith<$Res> {
  _$ClientModelCopyWithImpl(this._self, this._then);

  final ClientModel _self;
  final $Res Function(ClientModel) _then;

/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? phone = freezed,Object? email = freezed,Object? addUserName = freezed,Object? addDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,addUserName: freezed == addUserName ? _self.addUserName : addUserName // ignore: cast_nullable_to_non_nullable
as String?,addDate: freezed == addDate ? _self.addDate : addDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientModel].
extension ClientModelPatterns on ClientModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientModel value)  $default,){
final _that = this;
switch (_that) {
case _ClientModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClientModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  String? phone,  String? email,  String? addUserName,  String? addDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientModel() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.email,_that.addUserName,_that.addDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  String? phone,  String? email,  String? addUserName,  String? addDate)  $default,) {final _that = this;
switch (_that) {
case _ClientModel():
return $default(_that.id,_that.fullName,_that.phone,_that.email,_that.addUserName,_that.addDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  String? phone,  String? email,  String? addUserName,  String? addDate)?  $default,) {final _that = this;
switch (_that) {
case _ClientModel() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.email,_that.addUserName,_that.addDate);case _:
  return null;

}
}

}

/// @nodoc


class _ClientModel implements ClientModel {
  const _ClientModel({required this.id, required this.fullName, this.phone, this.email, this.addUserName, this.addDate});
  

@override final  int id;
@override final  String fullName;
@override final  String? phone;
@override final  String? email;
@override final  String? addUserName;
@override final  String? addDate;

/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientModelCopyWith<_ClientModel> get copyWith => __$ClientModelCopyWithImpl<_ClientModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.addUserName, addUserName) || other.addUserName == addUserName)&&(identical(other.addDate, addDate) || other.addDate == addDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone,email,addUserName,addDate);

@override
String toString() {
  return 'ClientModel(id: $id, fullName: $fullName, phone: $phone, email: $email, addUserName: $addUserName, addDate: $addDate)';
}


}

/// @nodoc
abstract mixin class _$ClientModelCopyWith<$Res> implements $ClientModelCopyWith<$Res> {
  factory _$ClientModelCopyWith(_ClientModel value, $Res Function(_ClientModel) _then) = __$ClientModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String? phone, String? email, String? addUserName, String? addDate
});




}
/// @nodoc
class __$ClientModelCopyWithImpl<$Res>
    implements _$ClientModelCopyWith<$Res> {
  __$ClientModelCopyWithImpl(this._self, this._then);

  final _ClientModel _self;
  final $Res Function(_ClientModel) _then;

/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? phone = freezed,Object? email = freezed,Object? addUserName = freezed,Object? addDate = freezed,}) {
  return _then(_ClientModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,addUserName: freezed == addUserName ? _self.addUserName : addUserName // ignore: cast_nullable_to_non_nullable
as String?,addDate: freezed == addDate ? _self.addDate : addDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
