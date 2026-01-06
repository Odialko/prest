// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferResponse {

 int get id; String? get estateOfferUuid; String? get number; String? get typeName; String? get price; int? get priceCurrency; String? get pricePermeter; String? get areaTotal;@JsonKey(name: 'apartmentRoomNumber') int? get rooms;@JsonKey(name: 'apartmentFloor') int? get floor;@JsonKey(name: 'buildingFloornumber') int? get totalFloors; int? get buildingYear;// Локація
@JsonKey(name: 'locationCityName') String? get cityName;@JsonKey(name: 'locationStreetName') String? get streetName;@JsonKey(name: 'locationDistrictName') String? get districtName;@JsonKey(name: 'locationProvinceName') String? get provinceName;@JsonKey(name: 'locationLatitude') String? get lat;@JsonKey(name: 'locationLongitude') String? get lon;// Опис та контакти
 String? get portalTitle; String? get description; String? get contactEmail; String? get contactPhone;@JsonKey(name: 'contactFirstname') String? get firstName;@JsonKey(name: 'contactLastname') String? get lastName;// Технічні характеристики (перетворюємо int/null на bool)
@JsonKey(name: 'buildingAirConditioning') int? get airConditioning;@JsonKey(name: 'additionalParking') int? get parking;// Медіа
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.estateOfferUuid, estateOfferUuid) || other.estateOfferUuid == estateOfferUuid)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.pricePermeter, pricePermeter) || other.pricePermeter == pricePermeter)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.buildingYear, buildingYear) || other.buildingYear == buildingYear)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.airConditioning, airConditioning) || other.airConditioning == airConditioning)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other.pictures, pictures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,estateOfferUuid,number,typeName,price,priceCurrency,pricePermeter,areaTotal,rooms,floor,totalFloors,buildingYear,cityName,streetName,districtName,provinceName,lat,lon,portalTitle,description,contactEmail,contactPhone,firstName,lastName,airConditioning,parking,mainPicture,const DeepCollectionEquality().hash(pictures)]);

@override
String toString() {
  return 'OfferResponse(id: $id, estateOfferUuid: $estateOfferUuid, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, pricePermeter: $pricePermeter, areaTotal: $areaTotal, rooms: $rooms, floor: $floor, totalFloors: $totalFloors, buildingYear: $buildingYear, cityName: $cityName, streetName: $streetName, districtName: $districtName, provinceName: $provinceName, lat: $lat, lon: $lon, portalTitle: $portalTitle, description: $description, contactEmail: $contactEmail, contactPhone: $contactPhone, firstName: $firstName, lastName: $lastName, airConditioning: $airConditioning, parking: $parking, mainPicture: $mainPicture, pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class $OfferResponseCopyWith<$Res>  {
  factory $OfferResponseCopyWith(OfferResponse value, $Res Function(OfferResponse) _then) = _$OfferResponseCopyWithImpl;
@useResult
$Res call({
 int id, String? estateOfferUuid, String? number, String? typeName, String? price, int? priceCurrency, String? pricePermeter, String? areaTotal,@JsonKey(name: 'apartmentRoomNumber') int? rooms,@JsonKey(name: 'apartmentFloor') int? floor,@JsonKey(name: 'buildingFloornumber') int? totalFloors, int? buildingYear,@JsonKey(name: 'locationCityName') String? cityName,@JsonKey(name: 'locationStreetName') String? streetName,@JsonKey(name: 'locationDistrictName') String? districtName,@JsonKey(name: 'locationProvinceName') String? provinceName,@JsonKey(name: 'locationLatitude') String? lat,@JsonKey(name: 'locationLongitude') String? lon, String? portalTitle, String? description, String? contactEmail, String? contactPhone,@JsonKey(name: 'contactFirstname') String? firstName,@JsonKey(name: 'contactLastname') String? lastName,@JsonKey(name: 'buildingAirConditioning') int? airConditioning,@JsonKey(name: 'additionalParking') int? parking,@JsonKey(name: 'main_picture') String? mainPicture, List<String>? pictures
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? estateOfferUuid = freezed,Object? number = freezed,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? pricePermeter = freezed,Object? areaTotal = freezed,Object? rooms = freezed,Object? floor = freezed,Object? totalFloors = freezed,Object? buildingYear = freezed,Object? cityName = freezed,Object? streetName = freezed,Object? districtName = freezed,Object? provinceName = freezed,Object? lat = freezed,Object? lon = freezed,Object? portalTitle = freezed,Object? description = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? airConditioning = freezed,Object? parking = freezed,Object? mainPicture = freezed,Object? pictures = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,estateOfferUuid: freezed == estateOfferUuid ? _self.estateOfferUuid : estateOfferUuid // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as int?,pricePermeter: freezed == pricePermeter ? _self.pricePermeter : pricePermeter // ignore: cast_nullable_to_non_nullable
as String?,areaTotal: freezed == areaTotal ? _self.areaTotal : areaTotal // ignore: cast_nullable_to_non_nullable
as String?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,totalFloors: freezed == totalFloors ? _self.totalFloors : totalFloors // ignore: cast_nullable_to_non_nullable
as int?,buildingYear: freezed == buildingYear ? _self.buildingYear : buildingYear // ignore: cast_nullable_to_non_nullable
as int?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,provinceName: freezed == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,portalTitle: freezed == portalTitle ? _self.portalTitle : portalTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,airConditioning: freezed == airConditioning ? _self.airConditioning : airConditioning // ignore: cast_nullable_to_non_nullable
as int?,parking: freezed == parking ? _self.parking : parking // ignore: cast_nullable_to_non_nullable
as int?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? estateOfferUuid,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal, @JsonKey(name: 'apartmentRoomNumber')  int? rooms, @JsonKey(name: 'apartmentFloor')  int? floor, @JsonKey(name: 'buildingFloornumber')  int? totalFloors,  int? buildingYear, @JsonKey(name: 'locationCityName')  String? cityName, @JsonKey(name: 'locationStreetName')  String? streetName, @JsonKey(name: 'locationDistrictName')  String? districtName, @JsonKey(name: 'locationProvinceName')  String? provinceName, @JsonKey(name: 'locationLatitude')  String? lat, @JsonKey(name: 'locationLongitude')  String? lon,  String? portalTitle,  String? description,  String? contactEmail,  String? contactPhone, @JsonKey(name: 'contactFirstname')  String? firstName, @JsonKey(name: 'contactLastname')  String? lastName, @JsonKey(name: 'buildingAirConditioning')  int? airConditioning, @JsonKey(name: 'additionalParking')  int? parking, @JsonKey(name: 'main_picture')  String? mainPicture,  List<String>? pictures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.rooms,_that.floor,_that.totalFloors,_that.buildingYear,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.portalTitle,_that.description,_that.contactEmail,_that.contactPhone,_that.firstName,_that.lastName,_that.airConditioning,_that.parking,_that.mainPicture,_that.pictures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? estateOfferUuid,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal, @JsonKey(name: 'apartmentRoomNumber')  int? rooms, @JsonKey(name: 'apartmentFloor')  int? floor, @JsonKey(name: 'buildingFloornumber')  int? totalFloors,  int? buildingYear, @JsonKey(name: 'locationCityName')  String? cityName, @JsonKey(name: 'locationStreetName')  String? streetName, @JsonKey(name: 'locationDistrictName')  String? districtName, @JsonKey(name: 'locationProvinceName')  String? provinceName, @JsonKey(name: 'locationLatitude')  String? lat, @JsonKey(name: 'locationLongitude')  String? lon,  String? portalTitle,  String? description,  String? contactEmail,  String? contactPhone, @JsonKey(name: 'contactFirstname')  String? firstName, @JsonKey(name: 'contactLastname')  String? lastName, @JsonKey(name: 'buildingAirConditioning')  int? airConditioning, @JsonKey(name: 'additionalParking')  int? parking, @JsonKey(name: 'main_picture')  String? mainPicture,  List<String>? pictures)  $default,) {final _that = this;
switch (_that) {
case _OfferResponse():
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.rooms,_that.floor,_that.totalFloors,_that.buildingYear,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.portalTitle,_that.description,_that.contactEmail,_that.contactPhone,_that.firstName,_that.lastName,_that.airConditioning,_that.parking,_that.mainPicture,_that.pictures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? estateOfferUuid,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal, @JsonKey(name: 'apartmentRoomNumber')  int? rooms, @JsonKey(name: 'apartmentFloor')  int? floor, @JsonKey(name: 'buildingFloornumber')  int? totalFloors,  int? buildingYear, @JsonKey(name: 'locationCityName')  String? cityName, @JsonKey(name: 'locationStreetName')  String? streetName, @JsonKey(name: 'locationDistrictName')  String? districtName, @JsonKey(name: 'locationProvinceName')  String? provinceName, @JsonKey(name: 'locationLatitude')  String? lat, @JsonKey(name: 'locationLongitude')  String? lon,  String? portalTitle,  String? description,  String? contactEmail,  String? contactPhone, @JsonKey(name: 'contactFirstname')  String? firstName, @JsonKey(name: 'contactLastname')  String? lastName, @JsonKey(name: 'buildingAirConditioning')  int? airConditioning, @JsonKey(name: 'additionalParking')  int? parking, @JsonKey(name: 'main_picture')  String? mainPicture,  List<String>? pictures)?  $default,) {final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.rooms,_that.floor,_that.totalFloors,_that.buildingYear,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.portalTitle,_that.description,_that.contactEmail,_that.contactPhone,_that.firstName,_that.lastName,_that.airConditioning,_that.parking,_that.mainPicture,_that.pictures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferResponse implements OfferResponse {
  const _OfferResponse({required this.id, this.estateOfferUuid, this.number, this.typeName, this.price, this.priceCurrency, this.pricePermeter, this.areaTotal, @JsonKey(name: 'apartmentRoomNumber') this.rooms, @JsonKey(name: 'apartmentFloor') this.floor, @JsonKey(name: 'buildingFloornumber') this.totalFloors, this.buildingYear, @JsonKey(name: 'locationCityName') this.cityName, @JsonKey(name: 'locationStreetName') this.streetName, @JsonKey(name: 'locationDistrictName') this.districtName, @JsonKey(name: 'locationProvinceName') this.provinceName, @JsonKey(name: 'locationLatitude') this.lat, @JsonKey(name: 'locationLongitude') this.lon, this.portalTitle, this.description, this.contactEmail, this.contactPhone, @JsonKey(name: 'contactFirstname') this.firstName, @JsonKey(name: 'contactLastname') this.lastName, @JsonKey(name: 'buildingAirConditioning') this.airConditioning, @JsonKey(name: 'additionalParking') this.parking, @JsonKey(name: 'main_picture') this.mainPicture, final  List<String>? pictures}): _pictures = pictures;
  factory _OfferResponse.fromJson(Map<String, dynamic> json) => _$OfferResponseFromJson(json);

@override final  int id;
@override final  String? estateOfferUuid;
@override final  String? number;
@override final  String? typeName;
@override final  String? price;
@override final  int? priceCurrency;
@override final  String? pricePermeter;
@override final  String? areaTotal;
@override@JsonKey(name: 'apartmentRoomNumber') final  int? rooms;
@override@JsonKey(name: 'apartmentFloor') final  int? floor;
@override@JsonKey(name: 'buildingFloornumber') final  int? totalFloors;
@override final  int? buildingYear;
// Локація
@override@JsonKey(name: 'locationCityName') final  String? cityName;
@override@JsonKey(name: 'locationStreetName') final  String? streetName;
@override@JsonKey(name: 'locationDistrictName') final  String? districtName;
@override@JsonKey(name: 'locationProvinceName') final  String? provinceName;
@override@JsonKey(name: 'locationLatitude') final  String? lat;
@override@JsonKey(name: 'locationLongitude') final  String? lon;
// Опис та контакти
@override final  String? portalTitle;
@override final  String? description;
@override final  String? contactEmail;
@override final  String? contactPhone;
@override@JsonKey(name: 'contactFirstname') final  String? firstName;
@override@JsonKey(name: 'contactLastname') final  String? lastName;
// Технічні характеристики (перетворюємо int/null на bool)
@override@JsonKey(name: 'buildingAirConditioning') final  int? airConditioning;
@override@JsonKey(name: 'additionalParking') final  int? parking;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.estateOfferUuid, estateOfferUuid) || other.estateOfferUuid == estateOfferUuid)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.pricePermeter, pricePermeter) || other.pricePermeter == pricePermeter)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.buildingYear, buildingYear) || other.buildingYear == buildingYear)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.airConditioning, airConditioning) || other.airConditioning == airConditioning)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other._pictures, _pictures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,estateOfferUuid,number,typeName,price,priceCurrency,pricePermeter,areaTotal,rooms,floor,totalFloors,buildingYear,cityName,streetName,districtName,provinceName,lat,lon,portalTitle,description,contactEmail,contactPhone,firstName,lastName,airConditioning,parking,mainPicture,const DeepCollectionEquality().hash(_pictures)]);

@override
String toString() {
  return 'OfferResponse(id: $id, estateOfferUuid: $estateOfferUuid, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, pricePermeter: $pricePermeter, areaTotal: $areaTotal, rooms: $rooms, floor: $floor, totalFloors: $totalFloors, buildingYear: $buildingYear, cityName: $cityName, streetName: $streetName, districtName: $districtName, provinceName: $provinceName, lat: $lat, lon: $lon, portalTitle: $portalTitle, description: $description, contactEmail: $contactEmail, contactPhone: $contactPhone, firstName: $firstName, lastName: $lastName, airConditioning: $airConditioning, parking: $parking, mainPicture: $mainPicture, pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class _$OfferResponseCopyWith<$Res> implements $OfferResponseCopyWith<$Res> {
  factory _$OfferResponseCopyWith(_OfferResponse value, $Res Function(_OfferResponse) _then) = __$OfferResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String? estateOfferUuid, String? number, String? typeName, String? price, int? priceCurrency, String? pricePermeter, String? areaTotal,@JsonKey(name: 'apartmentRoomNumber') int? rooms,@JsonKey(name: 'apartmentFloor') int? floor,@JsonKey(name: 'buildingFloornumber') int? totalFloors, int? buildingYear,@JsonKey(name: 'locationCityName') String? cityName,@JsonKey(name: 'locationStreetName') String? streetName,@JsonKey(name: 'locationDistrictName') String? districtName,@JsonKey(name: 'locationProvinceName') String? provinceName,@JsonKey(name: 'locationLatitude') String? lat,@JsonKey(name: 'locationLongitude') String? lon, String? portalTitle, String? description, String? contactEmail, String? contactPhone,@JsonKey(name: 'contactFirstname') String? firstName,@JsonKey(name: 'contactLastname') String? lastName,@JsonKey(name: 'buildingAirConditioning') int? airConditioning,@JsonKey(name: 'additionalParking') int? parking,@JsonKey(name: 'main_picture') String? mainPicture, List<String>? pictures
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? estateOfferUuid = freezed,Object? number = freezed,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? pricePermeter = freezed,Object? areaTotal = freezed,Object? rooms = freezed,Object? floor = freezed,Object? totalFloors = freezed,Object? buildingYear = freezed,Object? cityName = freezed,Object? streetName = freezed,Object? districtName = freezed,Object? provinceName = freezed,Object? lat = freezed,Object? lon = freezed,Object? portalTitle = freezed,Object? description = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? airConditioning = freezed,Object? parking = freezed,Object? mainPicture = freezed,Object? pictures = freezed,}) {
  return _then(_OfferResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,estateOfferUuid: freezed == estateOfferUuid ? _self.estateOfferUuid : estateOfferUuid // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as int?,pricePermeter: freezed == pricePermeter ? _self.pricePermeter : pricePermeter // ignore: cast_nullable_to_non_nullable
as String?,areaTotal: freezed == areaTotal ? _self.areaTotal : areaTotal // ignore: cast_nullable_to_non_nullable
as String?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,totalFloors: freezed == totalFloors ? _self.totalFloors : totalFloors // ignore: cast_nullable_to_non_nullable
as int?,buildingYear: freezed == buildingYear ? _self.buildingYear : buildingYear // ignore: cast_nullable_to_non_nullable
as int?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,provinceName: freezed == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,portalTitle: freezed == portalTitle ? _self.portalTitle : portalTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,airConditioning: freezed == airConditioning ? _self.airConditioning : airConditioning // ignore: cast_nullable_to_non_nullable
as int?,parking: freezed == parking ? _self.parking : parking // ignore: cast_nullable_to_non_nullable
as int?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
