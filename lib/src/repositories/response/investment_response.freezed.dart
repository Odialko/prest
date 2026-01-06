// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvestmentResponse {

@JsonKey(name: 'estate_investment') InvestmentData get estateInvestment;
/// Create a copy of InvestmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestmentResponseCopyWith<InvestmentResponse> get copyWith => _$InvestmentResponseCopyWithImpl<InvestmentResponse>(this as InvestmentResponse, _$identity);

  /// Serializes this InvestmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestmentResponse&&(identical(other.estateInvestment, estateInvestment) || other.estateInvestment == estateInvestment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,estateInvestment);

@override
String toString() {
  return 'InvestmentResponse(estateInvestment: $estateInvestment)';
}


}

/// @nodoc
abstract mixin class $InvestmentResponseCopyWith<$Res>  {
  factory $InvestmentResponseCopyWith(InvestmentResponse value, $Res Function(InvestmentResponse) _then) = _$InvestmentResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'estate_investment') InvestmentData estateInvestment
});


$InvestmentDataCopyWith<$Res> get estateInvestment;

}
/// @nodoc
class _$InvestmentResponseCopyWithImpl<$Res>
    implements $InvestmentResponseCopyWith<$Res> {
  _$InvestmentResponseCopyWithImpl(this._self, this._then);

  final InvestmentResponse _self;
  final $Res Function(InvestmentResponse) _then;

/// Create a copy of InvestmentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? estateInvestment = null,}) {
  return _then(_self.copyWith(
estateInvestment: null == estateInvestment ? _self.estateInvestment : estateInvestment // ignore: cast_nullable_to_non_nullable
as InvestmentData,
  ));
}
/// Create a copy of InvestmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvestmentDataCopyWith<$Res> get estateInvestment {
  
  return $InvestmentDataCopyWith<$Res>(_self.estateInvestment, (value) {
    return _then(_self.copyWith(estateInvestment: value));
  });
}
}


/// Adds pattern-matching-related methods to [InvestmentResponse].
extension InvestmentResponsePatterns on InvestmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvestmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvestmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvestmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvestmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvestmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvestmentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'estate_investment')  InvestmentData estateInvestment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvestmentResponse() when $default != null:
return $default(_that.estateInvestment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'estate_investment')  InvestmentData estateInvestment)  $default,) {final _that = this;
switch (_that) {
case _InvestmentResponse():
return $default(_that.estateInvestment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'estate_investment')  InvestmentData estateInvestment)?  $default,) {final _that = this;
switch (_that) {
case _InvestmentResponse() when $default != null:
return $default(_that.estateInvestment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvestmentResponse implements InvestmentResponse {
  const _InvestmentResponse({@JsonKey(name: 'estate_investment') required this.estateInvestment});
  factory _InvestmentResponse.fromJson(Map<String, dynamic> json) => _$InvestmentResponseFromJson(json);

@override@JsonKey(name: 'estate_investment') final  InvestmentData estateInvestment;

/// Create a copy of InvestmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvestmentResponseCopyWith<_InvestmentResponse> get copyWith => __$InvestmentResponseCopyWithImpl<_InvestmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvestmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvestmentResponse&&(identical(other.estateInvestment, estateInvestment) || other.estateInvestment == estateInvestment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,estateInvestment);

@override
String toString() {
  return 'InvestmentResponse(estateInvestment: $estateInvestment)';
}


}

/// @nodoc
abstract mixin class _$InvestmentResponseCopyWith<$Res> implements $InvestmentResponseCopyWith<$Res> {
  factory _$InvestmentResponseCopyWith(_InvestmentResponse value, $Res Function(_InvestmentResponse) _then) = __$InvestmentResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'estate_investment') InvestmentData estateInvestment
});


@override $InvestmentDataCopyWith<$Res> get estateInvestment;

}
/// @nodoc
class __$InvestmentResponseCopyWithImpl<$Res>
    implements _$InvestmentResponseCopyWith<$Res> {
  __$InvestmentResponseCopyWithImpl(this._self, this._then);

  final _InvestmentResponse _self;
  final $Res Function(_InvestmentResponse) _then;

/// Create a copy of InvestmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? estateInvestment = null,}) {
  return _then(_InvestmentResponse(
estateInvestment: null == estateInvestment ? _self.estateInvestment : estateInvestment // ignore: cast_nullable_to_non_nullable
as InvestmentData,
  ));
}

/// Create a copy of InvestmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvestmentDataCopyWith<$Res> get estateInvestment {
  
  return $InvestmentDataCopyWith<$Res>(_self.estateInvestment, (value) {
    return _then(_self.copyWith(estateInvestment: value));
  });
}
}


/// @nodoc
mixin _$InvestmentData {

 int get id; String get name;@JsonKey(name: 'location_city_name') String? get cityName;@JsonKey(name: 'location_street_name') String? get streetName;@JsonKey(name: 'developer_name') String? get developerName;@JsonKey(name: 'price_from') dynamic get priceFrom;@JsonKey(name: 'area_from') dynamic get areaFrom; int? get status; String? get description;
/// Create a copy of InvestmentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestmentDataCopyWith<InvestmentData> get copyWith => _$InvestmentDataCopyWithImpl<InvestmentData>(this as InvestmentData, _$identity);

  /// Serializes this InvestmentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestmentData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.developerName, developerName) || other.developerName == developerName)&&const DeepCollectionEquality().equals(other.priceFrom, priceFrom)&&const DeepCollectionEquality().equals(other.areaFrom, areaFrom)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityName,streetName,developerName,const DeepCollectionEquality().hash(priceFrom),const DeepCollectionEquality().hash(areaFrom),status,description);

@override
String toString() {
  return 'InvestmentData(id: $id, name: $name, cityName: $cityName, streetName: $streetName, developerName: $developerName, priceFrom: $priceFrom, areaFrom: $areaFrom, status: $status, description: $description)';
}


}

/// @nodoc
abstract mixin class $InvestmentDataCopyWith<$Res>  {
  factory $InvestmentDataCopyWith(InvestmentData value, $Res Function(InvestmentData) _then) = _$InvestmentDataCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'location_city_name') String? cityName,@JsonKey(name: 'location_street_name') String? streetName,@JsonKey(name: 'developer_name') String? developerName,@JsonKey(name: 'price_from') dynamic priceFrom,@JsonKey(name: 'area_from') dynamic areaFrom, int? status, String? description
});




}
/// @nodoc
class _$InvestmentDataCopyWithImpl<$Res>
    implements $InvestmentDataCopyWith<$Res> {
  _$InvestmentDataCopyWithImpl(this._self, this._then);

  final InvestmentData _self;
  final $Res Function(InvestmentData) _then;

/// Create a copy of InvestmentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cityName = freezed,Object? streetName = freezed,Object? developerName = freezed,Object? priceFrom = freezed,Object? areaFrom = freezed,Object? status = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,developerName: freezed == developerName ? _self.developerName : developerName // ignore: cast_nullable_to_non_nullable
as String?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as dynamic,areaFrom: freezed == areaFrom ? _self.areaFrom : areaFrom // ignore: cast_nullable_to_non_nullable
as dynamic,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvestmentData].
extension InvestmentDataPatterns on InvestmentData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvestmentData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvestmentData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvestmentData value)  $default,){
final _that = this;
switch (_that) {
case _InvestmentData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvestmentData value)?  $default,){
final _that = this;
switch (_that) {
case _InvestmentData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'location_city_name')  String? cityName, @JsonKey(name: 'location_street_name')  String? streetName, @JsonKey(name: 'developer_name')  String? developerName, @JsonKey(name: 'price_from')  dynamic priceFrom, @JsonKey(name: 'area_from')  dynamic areaFrom,  int? status,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvestmentData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'location_city_name')  String? cityName, @JsonKey(name: 'location_street_name')  String? streetName, @JsonKey(name: 'developer_name')  String? developerName, @JsonKey(name: 'price_from')  dynamic priceFrom, @JsonKey(name: 'area_from')  dynamic areaFrom,  int? status,  String? description)  $default,) {final _that = this;
switch (_that) {
case _InvestmentData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'location_city_name')  String? cityName, @JsonKey(name: 'location_street_name')  String? streetName, @JsonKey(name: 'developer_name')  String? developerName, @JsonKey(name: 'price_from')  dynamic priceFrom, @JsonKey(name: 'area_from')  dynamic areaFrom,  int? status,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _InvestmentData() when $default != null:
return $default(_that.id,_that.name,_that.cityName,_that.streetName,_that.developerName,_that.priceFrom,_that.areaFrom,_that.status,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvestmentData implements InvestmentData {
  const _InvestmentData({required this.id, required this.name, @JsonKey(name: 'location_city_name') this.cityName, @JsonKey(name: 'location_street_name') this.streetName, @JsonKey(name: 'developer_name') this.developerName, @JsonKey(name: 'price_from') this.priceFrom, @JsonKey(name: 'area_from') this.areaFrom, this.status, this.description});
  factory _InvestmentData.fromJson(Map<String, dynamic> json) => _$InvestmentDataFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'location_city_name') final  String? cityName;
@override@JsonKey(name: 'location_street_name') final  String? streetName;
@override@JsonKey(name: 'developer_name') final  String? developerName;
@override@JsonKey(name: 'price_from') final  dynamic priceFrom;
@override@JsonKey(name: 'area_from') final  dynamic areaFrom;
@override final  int? status;
@override final  String? description;

/// Create a copy of InvestmentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvestmentDataCopyWith<_InvestmentData> get copyWith => __$InvestmentDataCopyWithImpl<_InvestmentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvestmentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvestmentData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.developerName, developerName) || other.developerName == developerName)&&const DeepCollectionEquality().equals(other.priceFrom, priceFrom)&&const DeepCollectionEquality().equals(other.areaFrom, areaFrom)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityName,streetName,developerName,const DeepCollectionEquality().hash(priceFrom),const DeepCollectionEquality().hash(areaFrom),status,description);

@override
String toString() {
  return 'InvestmentData(id: $id, name: $name, cityName: $cityName, streetName: $streetName, developerName: $developerName, priceFrom: $priceFrom, areaFrom: $areaFrom, status: $status, description: $description)';
}


}

/// @nodoc
abstract mixin class _$InvestmentDataCopyWith<$Res> implements $InvestmentDataCopyWith<$Res> {
  factory _$InvestmentDataCopyWith(_InvestmentData value, $Res Function(_InvestmentData) _then) = __$InvestmentDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'location_city_name') String? cityName,@JsonKey(name: 'location_street_name') String? streetName,@JsonKey(name: 'developer_name') String? developerName,@JsonKey(name: 'price_from') dynamic priceFrom,@JsonKey(name: 'area_from') dynamic areaFrom, int? status, String? description
});




}
/// @nodoc
class __$InvestmentDataCopyWithImpl<$Res>
    implements _$InvestmentDataCopyWith<$Res> {
  __$InvestmentDataCopyWithImpl(this._self, this._then);

  final _InvestmentData _self;
  final $Res Function(_InvestmentData) _then;

/// Create a copy of InvestmentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cityName = freezed,Object? streetName = freezed,Object? developerName = freezed,Object? priceFrom = freezed,Object? areaFrom = freezed,Object? status = freezed,Object? description = freezed,}) {
  return _then(_InvestmentData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,developerName: freezed == developerName ? _self.developerName : developerName // ignore: cast_nullable_to_non_nullable
as String?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as dynamic,areaFrom: freezed == areaFrom ? _self.areaFrom : areaFrom // ignore: cast_nullable_to_non_nullable
as dynamic,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
