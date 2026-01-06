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
  const _OfferListResponse({required this.success, required this.count, required final  List<OfferResponse> data}): _data = data;
  factory _OfferListResponse.fromJson(Map<String, dynamic> json) => _$OfferListResponseFromJson(json);

@override final  bool success;
@override final  int count;
 final  List<OfferResponse> _data;
@override List<OfferResponse> get data {
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


/// @nodoc
mixin _$OfferResponse {

 int get id; String? get number; String? get typeName; String? get price; int? get priceCurrency; String? get areaTotal; String? get description; String? get portalTitle;// Локація
@JsonKey(name: 'locationCityName') String? get cityName;@JsonKey(name: 'locationStreetName') String? get streetName;@JsonKey(name: 'locationDistrictName') String? get districtName;@JsonKey(name: 'locationProvinceName') String? get provinceName;@JsonKey(name: 'locationLatitude') String? get lat;@JsonKey(name: 'locationLongitude') String? get lon;// Характеристики
@JsonKey(name: 'apartmentFloor') int? get floor;@JsonKey(name: 'apartmentRoomNumber') int? get rooms;@JsonKey(name: 'buildingFloornumber') int? get totalFloors;@JsonKey(name: 'buildingYear') int? get year;// Контакти
@JsonKey(name: 'contactFirstname') String? get firstName;@JsonKey(name: 'contactLastname') String? get lastName; String? get contactEmail; String? get contactPhone;// Медіа
@JsonKey(name: 'main_picture') String? get mainPicture; List<String>? get pictures;
/// Create a copy of OfferResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferResponseCopyWith<OfferResponse> get copyWith => _$OfferResponseCopyWithImpl<OfferResponse>(this as OfferResponse, _$identity);

  /// Serializes this OfferResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.description, description) || other.description == description)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.year, year) || other.year == year)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other.pictures, pictures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,number,typeName,price,priceCurrency,areaTotal,description,portalTitle,cityName,streetName,districtName,provinceName,lat,lon,floor,rooms,totalFloors,year,firstName,lastName,contactEmail,contactPhone,mainPicture,const DeepCollectionEquality().hash(pictures)]);

@override
String toString() {
  return 'OfferResponse(id: $id, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, areaTotal: $areaTotal, description: $description, portalTitle: $portalTitle, cityName: $cityName, streetName: $streetName, districtName: $districtName, provinceName: $provinceName, lat: $lat, lon: $lon, floor: $floor, rooms: $rooms, totalFloors: $totalFloors, year: $year, firstName: $firstName, lastName: $lastName, contactEmail: $contactEmail, contactPhone: $contactPhone, mainPicture: $mainPicture, pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class $OfferResponseCopyWith<$Res>  {
  factory $OfferResponseCopyWith(OfferResponse value, $Res Function(OfferResponse) _then) = _$OfferResponseCopyWithImpl;
@useResult
$Res call({
 int id, String? number, String? typeName, String? price, int? priceCurrency, String? areaTotal, String? description, String? portalTitle,@JsonKey(name: 'locationCityName') String? cityName,@JsonKey(name: 'locationStreetName') String? streetName,@JsonKey(name: 'locationDistrictName') String? districtName,@JsonKey(name: 'locationProvinceName') String? provinceName,@JsonKey(name: 'locationLatitude') String? lat,@JsonKey(name: 'locationLongitude') String? lon,@JsonKey(name: 'apartmentFloor') int? floor,@JsonKey(name: 'apartmentRoomNumber') int? rooms,@JsonKey(name: 'buildingFloornumber') int? totalFloors,@JsonKey(name: 'buildingYear') int? year,@JsonKey(name: 'contactFirstname') String? firstName,@JsonKey(name: 'contactLastname') String? lastName, String? contactEmail, String? contactPhone,@JsonKey(name: 'main_picture') String? mainPicture, List<String>? pictures
});




}
/// @nodoc
class _$OfferResponseCopyWithImpl<$Res>
    implements $OfferResponseCopyWith<$Res> {
  _$OfferResponseCopyWithImpl(this._self, this._then);

  final OfferResponse _self;
  final $Res Function(OfferResponse) _then;

/// Create a copy of OfferResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = freezed,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? areaTotal = freezed,Object? description = freezed,Object? portalTitle = freezed,Object? cityName = freezed,Object? streetName = freezed,Object? districtName = freezed,Object? provinceName = freezed,Object? lat = freezed,Object? lon = freezed,Object? floor = freezed,Object? rooms = freezed,Object? totalFloors = freezed,Object? year = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? mainPicture = freezed,Object? pictures = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as int?,areaTotal: freezed == areaTotal ? _self.areaTotal : areaTotal // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,portalTitle: freezed == portalTitle ? _self.portalTitle : portalTitle // ignore: cast_nullable_to_non_nullable
as String?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,provinceName: freezed == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int?,totalFloors: freezed == totalFloors ? _self.totalFloors : totalFloors // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self.pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferResponse].
extension OfferResponsePatterns on OfferResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferResponse value)  $default,){
final _that = this;
switch (_that) {
case _OfferResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? areaTotal,  String? description,  String? portalTitle, @JsonKey(name: 'locationCityName')  String? cityName, @JsonKey(name: 'locationStreetName')  String? streetName, @JsonKey(name: 'locationDistrictName')  String? districtName, @JsonKey(name: 'locationProvinceName')  String? provinceName, @JsonKey(name: 'locationLatitude')  String? lat, @JsonKey(name: 'locationLongitude')  String? lon, @JsonKey(name: 'apartmentFloor')  int? floor, @JsonKey(name: 'apartmentRoomNumber')  int? rooms, @JsonKey(name: 'buildingFloornumber')  int? totalFloors, @JsonKey(name: 'buildingYear')  int? year, @JsonKey(name: 'contactFirstname')  String? firstName, @JsonKey(name: 'contactLastname')  String? lastName,  String? contactEmail,  String? contactPhone, @JsonKey(name: 'main_picture')  String? mainPicture,  List<String>? pictures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
return $default(_that.id,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.areaTotal,_that.description,_that.portalTitle,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.floor,_that.rooms,_that.totalFloors,_that.year,_that.firstName,_that.lastName,_that.contactEmail,_that.contactPhone,_that.mainPicture,_that.pictures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? areaTotal,  String? description,  String? portalTitle, @JsonKey(name: 'locationCityName')  String? cityName, @JsonKey(name: 'locationStreetName')  String? streetName, @JsonKey(name: 'locationDistrictName')  String? districtName, @JsonKey(name: 'locationProvinceName')  String? provinceName, @JsonKey(name: 'locationLatitude')  String? lat, @JsonKey(name: 'locationLongitude')  String? lon, @JsonKey(name: 'apartmentFloor')  int? floor, @JsonKey(name: 'apartmentRoomNumber')  int? rooms, @JsonKey(name: 'buildingFloornumber')  int? totalFloors, @JsonKey(name: 'buildingYear')  int? year, @JsonKey(name: 'contactFirstname')  String? firstName, @JsonKey(name: 'contactLastname')  String? lastName,  String? contactEmail,  String? contactPhone, @JsonKey(name: 'main_picture')  String? mainPicture,  List<String>? pictures)  $default,) {final _that = this;
switch (_that) {
case _OfferResponse():
return $default(_that.id,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.areaTotal,_that.description,_that.portalTitle,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.floor,_that.rooms,_that.totalFloors,_that.year,_that.firstName,_that.lastName,_that.contactEmail,_that.contactPhone,_that.mainPicture,_that.pictures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? areaTotal,  String? description,  String? portalTitle, @JsonKey(name: 'locationCityName')  String? cityName, @JsonKey(name: 'locationStreetName')  String? streetName, @JsonKey(name: 'locationDistrictName')  String? districtName, @JsonKey(name: 'locationProvinceName')  String? provinceName, @JsonKey(name: 'locationLatitude')  String? lat, @JsonKey(name: 'locationLongitude')  String? lon, @JsonKey(name: 'apartmentFloor')  int? floor, @JsonKey(name: 'apartmentRoomNumber')  int? rooms, @JsonKey(name: 'buildingFloornumber')  int? totalFloors, @JsonKey(name: 'buildingYear')  int? year, @JsonKey(name: 'contactFirstname')  String? firstName, @JsonKey(name: 'contactLastname')  String? lastName,  String? contactEmail,  String? contactPhone, @JsonKey(name: 'main_picture')  String? mainPicture,  List<String>? pictures)?  $default,) {final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
return $default(_that.id,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.areaTotal,_that.description,_that.portalTitle,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.floor,_that.rooms,_that.totalFloors,_that.year,_that.firstName,_that.lastName,_that.contactEmail,_that.contactPhone,_that.mainPicture,_that.pictures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferResponse implements OfferResponse {
  const _OfferResponse({required this.id, this.number, this.typeName, this.price, this.priceCurrency, this.areaTotal, this.description, this.portalTitle, @JsonKey(name: 'locationCityName') this.cityName, @JsonKey(name: 'locationStreetName') this.streetName, @JsonKey(name: 'locationDistrictName') this.districtName, @JsonKey(name: 'locationProvinceName') this.provinceName, @JsonKey(name: 'locationLatitude') this.lat, @JsonKey(name: 'locationLongitude') this.lon, @JsonKey(name: 'apartmentFloor') this.floor, @JsonKey(name: 'apartmentRoomNumber') this.rooms, @JsonKey(name: 'buildingFloornumber') this.totalFloors, @JsonKey(name: 'buildingYear') this.year, @JsonKey(name: 'contactFirstname') this.firstName, @JsonKey(name: 'contactLastname') this.lastName, this.contactEmail, this.contactPhone, @JsonKey(name: 'main_picture') this.mainPicture, final  List<String>? pictures}): _pictures = pictures;
  factory _OfferResponse.fromJson(Map<String, dynamic> json) => _$OfferResponseFromJson(json);

@override final  int id;
@override final  String? number;
@override final  String? typeName;
@override final  String? price;
@override final  int? priceCurrency;
@override final  String? areaTotal;
@override final  String? description;
@override final  String? portalTitle;
// Локація
@override@JsonKey(name: 'locationCityName') final  String? cityName;
@override@JsonKey(name: 'locationStreetName') final  String? streetName;
@override@JsonKey(name: 'locationDistrictName') final  String? districtName;
@override@JsonKey(name: 'locationProvinceName') final  String? provinceName;
@override@JsonKey(name: 'locationLatitude') final  String? lat;
@override@JsonKey(name: 'locationLongitude') final  String? lon;
// Характеристики
@override@JsonKey(name: 'apartmentFloor') final  int? floor;
@override@JsonKey(name: 'apartmentRoomNumber') final  int? rooms;
@override@JsonKey(name: 'buildingFloornumber') final  int? totalFloors;
@override@JsonKey(name: 'buildingYear') final  int? year;
// Контакти
@override@JsonKey(name: 'contactFirstname') final  String? firstName;
@override@JsonKey(name: 'contactLastname') final  String? lastName;
@override final  String? contactEmail;
@override final  String? contactPhone;
// Медіа
@override@JsonKey(name: 'main_picture') final  String? mainPicture;
 final  List<String>? _pictures;
@override List<String>? get pictures {
  final value = _pictures;
  if (value == null) return null;
  if (_pictures is EqualUnmodifiableListView) return _pictures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OfferResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferResponseCopyWith<_OfferResponse> get copyWith => __$OfferResponseCopyWithImpl<_OfferResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.description, description) || other.description == description)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.year, year) || other.year == year)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other._pictures, _pictures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,number,typeName,price,priceCurrency,areaTotal,description,portalTitle,cityName,streetName,districtName,provinceName,lat,lon,floor,rooms,totalFloors,year,firstName,lastName,contactEmail,contactPhone,mainPicture,const DeepCollectionEquality().hash(_pictures)]);

@override
String toString() {
  return 'OfferResponse(id: $id, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, areaTotal: $areaTotal, description: $description, portalTitle: $portalTitle, cityName: $cityName, streetName: $streetName, districtName: $districtName, provinceName: $provinceName, lat: $lat, lon: $lon, floor: $floor, rooms: $rooms, totalFloors: $totalFloors, year: $year, firstName: $firstName, lastName: $lastName, contactEmail: $contactEmail, contactPhone: $contactPhone, mainPicture: $mainPicture, pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class _$OfferResponseCopyWith<$Res> implements $OfferResponseCopyWith<$Res> {
  factory _$OfferResponseCopyWith(_OfferResponse value, $Res Function(_OfferResponse) _then) = __$OfferResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String? number, String? typeName, String? price, int? priceCurrency, String? areaTotal, String? description, String? portalTitle,@JsonKey(name: 'locationCityName') String? cityName,@JsonKey(name: 'locationStreetName') String? streetName,@JsonKey(name: 'locationDistrictName') String? districtName,@JsonKey(name: 'locationProvinceName') String? provinceName,@JsonKey(name: 'locationLatitude') String? lat,@JsonKey(name: 'locationLongitude') String? lon,@JsonKey(name: 'apartmentFloor') int? floor,@JsonKey(name: 'apartmentRoomNumber') int? rooms,@JsonKey(name: 'buildingFloornumber') int? totalFloors,@JsonKey(name: 'buildingYear') int? year,@JsonKey(name: 'contactFirstname') String? firstName,@JsonKey(name: 'contactLastname') String? lastName, String? contactEmail, String? contactPhone,@JsonKey(name: 'main_picture') String? mainPicture, List<String>? pictures
});




}
/// @nodoc
class __$OfferResponseCopyWithImpl<$Res>
    implements _$OfferResponseCopyWith<$Res> {
  __$OfferResponseCopyWithImpl(this._self, this._then);

  final _OfferResponse _self;
  final $Res Function(_OfferResponse) _then;

/// Create a copy of OfferResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = freezed,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? areaTotal = freezed,Object? description = freezed,Object? portalTitle = freezed,Object? cityName = freezed,Object? streetName = freezed,Object? districtName = freezed,Object? provinceName = freezed,Object? lat = freezed,Object? lon = freezed,Object? floor = freezed,Object? rooms = freezed,Object? totalFloors = freezed,Object? year = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? mainPicture = freezed,Object? pictures = freezed,}) {
  return _then(_OfferResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as int?,areaTotal: freezed == areaTotal ? _self.areaTotal : areaTotal // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,portalTitle: freezed == portalTitle ? _self.portalTitle : portalTitle // ignore: cast_nullable_to_non_nullable
as String?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,provinceName: freezed == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int?,totalFloors: freezed == totalFloors ? _self.totalFloors : totalFloors // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
