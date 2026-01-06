// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvestmentModel {

 int get id; String get name; String? get cityName; String? get streetName; String? get developerName; String? get priceFrom; String? get areaFrom; int? get status; String? get description;
/// Create a copy of InvestmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestmentModelCopyWith<InvestmentModel> get copyWith => _$InvestmentModelCopyWithImpl<InvestmentModel>(this as InvestmentModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.developerName, developerName) || other.developerName == developerName)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.areaFrom, areaFrom) || other.areaFrom == areaFrom)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,cityName,streetName,developerName,priceFrom,areaFrom,status,description);

@override
String toString() {
  return 'InvestmentModel(id: $id, name: $name, cityName: $cityName, streetName: $streetName, developerName: $developerName, priceFrom: $priceFrom, areaFrom: $areaFrom, status: $status, description: $description)';
}


}

/// @nodoc
abstract mixin class $InvestmentModelCopyWith<$Res>  {
  factory $InvestmentModelCopyWith(InvestmentModel value, $Res Function(InvestmentModel) _then) = _$InvestmentModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? cityName, String? streetName, String? developerName, String? priceFrom, String? areaFrom, int? status, String? description
});




}
/// @nodoc
class _$InvestmentModelCopyWithImpl<$Res>
    implements $InvestmentModelCopyWith<$Res> {
  _$InvestmentModelCopyWithImpl(this._self, this._then);

  final InvestmentModel _self;
  final $Res Function(InvestmentModel) _then;

/// Create a copy of InvestmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cityName = freezed,Object? streetName = freezed,Object? developerName = freezed,Object? priceFrom = freezed,Object? areaFrom = freezed,Object? status = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,developerName: freezed == developerName ? _self.developerName : developerName // ignore: cast_nullable_to_non_nullable
as String?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as String?,areaFrom: freezed == areaFrom ? _self.areaFrom : areaFrom // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvestmentModel].
extension InvestmentModelPatterns on InvestmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvestmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvestmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvestmentModel value)  $default,){
final _that = this;
switch (_that) {
case _InvestmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvestmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvestmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? cityName,  String? streetName,  String? developerName,  String? priceFrom,  String? areaFrom,  int? status,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvestmentModel() when $default != null:
return $default(_that.id,_that.name,_that.cityName,_that.streetName,_that.developerName,_that.priceFrom,_that.areaFrom,_that.status,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? cityName,  String? streetName,  String? developerName,  String? priceFrom,  String? areaFrom,  int? status,  String? description)  $default,) {final _that = this;
switch (_that) {
case _InvestmentModel():
return $default(_that.id,_that.name,_that.cityName,_that.streetName,_that.developerName,_that.priceFrom,_that.areaFrom,_that.status,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? cityName,  String? streetName,  String? developerName,  String? priceFrom,  String? areaFrom,  int? status,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _InvestmentModel() when $default != null:
return $default(_that.id,_that.name,_that.cityName,_that.streetName,_that.developerName,_that.priceFrom,_that.areaFrom,_that.status,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _InvestmentModel implements InvestmentModel {
  const _InvestmentModel({required this.id, required this.name, this.cityName, this.streetName, this.developerName, this.priceFrom, this.areaFrom, this.status, this.description});
  

@override final  int id;
@override final  String name;
@override final  String? cityName;
@override final  String? streetName;
@override final  String? developerName;
@override final  String? priceFrom;
@override final  String? areaFrom;
@override final  int? status;
@override final  String? description;

/// Create a copy of InvestmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvestmentModelCopyWith<_InvestmentModel> get copyWith => __$InvestmentModelCopyWithImpl<_InvestmentModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvestmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.developerName, developerName) || other.developerName == developerName)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.areaFrom, areaFrom) || other.areaFrom == areaFrom)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,cityName,streetName,developerName,priceFrom,areaFrom,status,description);

@override
String toString() {
  return 'InvestmentModel(id: $id, name: $name, cityName: $cityName, streetName: $streetName, developerName: $developerName, priceFrom: $priceFrom, areaFrom: $areaFrom, status: $status, description: $description)';
}


}

/// @nodoc
abstract mixin class _$InvestmentModelCopyWith<$Res> implements $InvestmentModelCopyWith<$Res> {
  factory _$InvestmentModelCopyWith(_InvestmentModel value, $Res Function(_InvestmentModel) _then) = __$InvestmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? cityName, String? streetName, String? developerName, String? priceFrom, String? areaFrom, int? status, String? description
});




}
/// @nodoc
class __$InvestmentModelCopyWithImpl<$Res>
    implements _$InvestmentModelCopyWith<$Res> {
  __$InvestmentModelCopyWithImpl(this._self, this._then);

  final _InvestmentModel _self;
  final $Res Function(_InvestmentModel) _then;

/// Create a copy of InvestmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cityName = freezed,Object? streetName = freezed,Object? developerName = freezed,Object? priceFrom = freezed,Object? areaFrom = freezed,Object? status = freezed,Object? description = freezed,}) {
  return _then(_InvestmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,developerName: freezed == developerName ? _self.developerName : developerName // ignore: cast_nullable_to_non_nullable
as String?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as String?,areaFrom: freezed == areaFrom ? _self.areaFrom : areaFrom // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
