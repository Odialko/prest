// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfferModel {

 int get id; String? get estateOfferUuid; String get number; String? get typeName;// Цінові показники
 String? get price; int? get priceCurrency; String? get pricePermeter;// Площа та стан
 String? get areaTotal; int? get rooms; int? get floor; int? get totalFloors; int? get buildingYear;// Локація
 String? get cityName; String? get streetName; String? get districtName; String? get provinceName; String? get lat; String? get lon;// Опис та контакти
 String? get portalTitle; String? get description; String? get contactEmail; String? get contactPhone; String? get contactName;// Медіа
 String? get mainPicture; List<String>? get pictures;// Додаткові технічні прапорці (можна розширювати за потребою)
 bool? get hasElevator; bool? get hasParking; bool? get isAirConditioned;
/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferModelCopyWith<OfferModel> get copyWith => _$OfferModelCopyWithImpl<OfferModel>(this as OfferModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.estateOfferUuid, estateOfferUuid) || other.estateOfferUuid == estateOfferUuid)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.pricePermeter, pricePermeter) || other.pricePermeter == pricePermeter)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.buildingYear, buildingYear) || other.buildingYear == buildingYear)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other.pictures, pictures)&&(identical(other.hasElevator, hasElevator) || other.hasElevator == hasElevator)&&(identical(other.hasParking, hasParking) || other.hasParking == hasParking)&&(identical(other.isAirConditioned, isAirConditioned) || other.isAirConditioned == isAirConditioned));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,estateOfferUuid,number,typeName,price,priceCurrency,pricePermeter,areaTotal,rooms,floor,totalFloors,buildingYear,cityName,streetName,districtName,provinceName,lat,lon,portalTitle,description,contactEmail,contactPhone,contactName,mainPicture,const DeepCollectionEquality().hash(pictures),hasElevator,hasParking,isAirConditioned]);

@override
String toString() {
  return 'OfferModel(id: $id, estateOfferUuid: $estateOfferUuid, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, pricePermeter: $pricePermeter, areaTotal: $areaTotal, rooms: $rooms, floor: $floor, totalFloors: $totalFloors, buildingYear: $buildingYear, cityName: $cityName, streetName: $streetName, districtName: $districtName, provinceName: $provinceName, lat: $lat, lon: $lon, portalTitle: $portalTitle, description: $description, contactEmail: $contactEmail, contactPhone: $contactPhone, contactName: $contactName, mainPicture: $mainPicture, pictures: $pictures, hasElevator: $hasElevator, hasParking: $hasParking, isAirConditioned: $isAirConditioned)';
}


}

/// @nodoc
abstract mixin class $OfferModelCopyWith<$Res>  {
  factory $OfferModelCopyWith(OfferModel value, $Res Function(OfferModel) _then) = _$OfferModelCopyWithImpl;
@useResult
$Res call({
 int id, String? estateOfferUuid, String number, String? typeName, String? price, int? priceCurrency, String? pricePermeter, String? areaTotal, int? rooms, int? floor, int? totalFloors, int? buildingYear, String? cityName, String? streetName, String? districtName, String? provinceName, String? lat, String? lon, String? portalTitle, String? description, String? contactEmail, String? contactPhone, String? contactName, String? mainPicture, List<String>? pictures, bool? hasElevator, bool? hasParking, bool? isAirConditioned
});




}
/// @nodoc
class _$OfferModelCopyWithImpl<$Res>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._self, this._then);

  final OfferModel _self;
  final $Res Function(OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? estateOfferUuid = freezed,Object? number = null,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? pricePermeter = freezed,Object? areaTotal = freezed,Object? rooms = freezed,Object? floor = freezed,Object? totalFloors = freezed,Object? buildingYear = freezed,Object? cityName = freezed,Object? streetName = freezed,Object? districtName = freezed,Object? provinceName = freezed,Object? lat = freezed,Object? lon = freezed,Object? portalTitle = freezed,Object? description = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? contactName = freezed,Object? mainPicture = freezed,Object? pictures = freezed,Object? hasElevator = freezed,Object? hasParking = freezed,Object? isAirConditioned = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,estateOfferUuid: freezed == estateOfferUuid ? _self.estateOfferUuid : estateOfferUuid // ignore: cast_nullable_to_non_nullable
as String?,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
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
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self.pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>?,hasElevator: freezed == hasElevator ? _self.hasElevator : hasElevator // ignore: cast_nullable_to_non_nullable
as bool?,hasParking: freezed == hasParking ? _self.hasParking : hasParking // ignore: cast_nullable_to_non_nullable
as bool?,isAirConditioned: freezed == isAirConditioned ? _self.isAirConditioned : isAirConditioned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferModel].
extension OfferModelPatterns on OfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferModel value)  $default,){
final _that = this;
switch (_that) {
case _OfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? estateOfferUuid,  String number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal,  int? rooms,  int? floor,  int? totalFloors,  int? buildingYear,  String? cityName,  String? streetName,  String? districtName,  String? provinceName,  String? lat,  String? lon,  String? portalTitle,  String? description,  String? contactEmail,  String? contactPhone,  String? contactName,  String? mainPicture,  List<String>? pictures,  bool? hasElevator,  bool? hasParking,  bool? isAirConditioned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.rooms,_that.floor,_that.totalFloors,_that.buildingYear,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.portalTitle,_that.description,_that.contactEmail,_that.contactPhone,_that.contactName,_that.mainPicture,_that.pictures,_that.hasElevator,_that.hasParking,_that.isAirConditioned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? estateOfferUuid,  String number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal,  int? rooms,  int? floor,  int? totalFloors,  int? buildingYear,  String? cityName,  String? streetName,  String? districtName,  String? provinceName,  String? lat,  String? lon,  String? portalTitle,  String? description,  String? contactEmail,  String? contactPhone,  String? contactName,  String? mainPicture,  List<String>? pictures,  bool? hasElevator,  bool? hasParking,  bool? isAirConditioned)  $default,) {final _that = this;
switch (_that) {
case _OfferModel():
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.rooms,_that.floor,_that.totalFloors,_that.buildingYear,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.portalTitle,_that.description,_that.contactEmail,_that.contactPhone,_that.contactName,_that.mainPicture,_that.pictures,_that.hasElevator,_that.hasParking,_that.isAirConditioned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? estateOfferUuid,  String number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal,  int? rooms,  int? floor,  int? totalFloors,  int? buildingYear,  String? cityName,  String? streetName,  String? districtName,  String? provinceName,  String? lat,  String? lon,  String? portalTitle,  String? description,  String? contactEmail,  String? contactPhone,  String? contactName,  String? mainPicture,  List<String>? pictures,  bool? hasElevator,  bool? hasParking,  bool? isAirConditioned)?  $default,) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.rooms,_that.floor,_that.totalFloors,_that.buildingYear,_that.cityName,_that.streetName,_that.districtName,_that.provinceName,_that.lat,_that.lon,_that.portalTitle,_that.description,_that.contactEmail,_that.contactPhone,_that.contactName,_that.mainPicture,_that.pictures,_that.hasElevator,_that.hasParking,_that.isAirConditioned);case _:
  return null;

}
}

}

/// @nodoc


class _OfferModel implements OfferModel {
  const _OfferModel({required this.id, this.estateOfferUuid, required this.number, this.typeName, this.price, this.priceCurrency, this.pricePermeter, this.areaTotal, this.rooms, this.floor, this.totalFloors, this.buildingYear, this.cityName, this.streetName, this.districtName, this.provinceName, this.lat, this.lon, this.portalTitle, this.description, this.contactEmail, this.contactPhone, this.contactName, this.mainPicture, final  List<String>? pictures, this.hasElevator, this.hasParking, this.isAirConditioned}): _pictures = pictures;
  

@override final  int id;
@override final  String? estateOfferUuid;
@override final  String number;
@override final  String? typeName;
// Цінові показники
@override final  String? price;
@override final  int? priceCurrency;
@override final  String? pricePermeter;
// Площа та стан
@override final  String? areaTotal;
@override final  int? rooms;
@override final  int? floor;
@override final  int? totalFloors;
@override final  int? buildingYear;
// Локація
@override final  String? cityName;
@override final  String? streetName;
@override final  String? districtName;
@override final  String? provinceName;
@override final  String? lat;
@override final  String? lon;
// Опис та контакти
@override final  String? portalTitle;
@override final  String? description;
@override final  String? contactEmail;
@override final  String? contactPhone;
@override final  String? contactName;
// Медіа
@override final  String? mainPicture;
 final  List<String>? _pictures;
@override List<String>? get pictures {
  final value = _pictures;
  if (value == null) return null;
  if (_pictures is EqualUnmodifiableListView) return _pictures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Додаткові технічні прапорці (можна розширювати за потребою)
@override final  bool? hasElevator;
@override final  bool? hasParking;
@override final  bool? isAirConditioned;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferModelCopyWith<_OfferModel> get copyWith => __$OfferModelCopyWithImpl<_OfferModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.estateOfferUuid, estateOfferUuid) || other.estateOfferUuid == estateOfferUuid)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.pricePermeter, pricePermeter) || other.pricePermeter == pricePermeter)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.buildingYear, buildingYear) || other.buildingYear == buildingYear)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other._pictures, _pictures)&&(identical(other.hasElevator, hasElevator) || other.hasElevator == hasElevator)&&(identical(other.hasParking, hasParking) || other.hasParking == hasParking)&&(identical(other.isAirConditioned, isAirConditioned) || other.isAirConditioned == isAirConditioned));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,estateOfferUuid,number,typeName,price,priceCurrency,pricePermeter,areaTotal,rooms,floor,totalFloors,buildingYear,cityName,streetName,districtName,provinceName,lat,lon,portalTitle,description,contactEmail,contactPhone,contactName,mainPicture,const DeepCollectionEquality().hash(_pictures),hasElevator,hasParking,isAirConditioned]);

@override
String toString() {
  return 'OfferModel(id: $id, estateOfferUuid: $estateOfferUuid, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, pricePermeter: $pricePermeter, areaTotal: $areaTotal, rooms: $rooms, floor: $floor, totalFloors: $totalFloors, buildingYear: $buildingYear, cityName: $cityName, streetName: $streetName, districtName: $districtName, provinceName: $provinceName, lat: $lat, lon: $lon, portalTitle: $portalTitle, description: $description, contactEmail: $contactEmail, contactPhone: $contactPhone, contactName: $contactName, mainPicture: $mainPicture, pictures: $pictures, hasElevator: $hasElevator, hasParking: $hasParking, isAirConditioned: $isAirConditioned)';
}


}

/// @nodoc
abstract mixin class _$OfferModelCopyWith<$Res> implements $OfferModelCopyWith<$Res> {
  factory _$OfferModelCopyWith(_OfferModel value, $Res Function(_OfferModel) _then) = __$OfferModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? estateOfferUuid, String number, String? typeName, String? price, int? priceCurrency, String? pricePermeter, String? areaTotal, int? rooms, int? floor, int? totalFloors, int? buildingYear, String? cityName, String? streetName, String? districtName, String? provinceName, String? lat, String? lon, String? portalTitle, String? description, String? contactEmail, String? contactPhone, String? contactName, String? mainPicture, List<String>? pictures, bool? hasElevator, bool? hasParking, bool? isAirConditioned
});




}
/// @nodoc
class __$OfferModelCopyWithImpl<$Res>
    implements _$OfferModelCopyWith<$Res> {
  __$OfferModelCopyWithImpl(this._self, this._then);

  final _OfferModel _self;
  final $Res Function(_OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? estateOfferUuid = freezed,Object? number = null,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? pricePermeter = freezed,Object? areaTotal = freezed,Object? rooms = freezed,Object? floor = freezed,Object? totalFloors = freezed,Object? buildingYear = freezed,Object? cityName = freezed,Object? streetName = freezed,Object? districtName = freezed,Object? provinceName = freezed,Object? lat = freezed,Object? lon = freezed,Object? portalTitle = freezed,Object? description = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? contactName = freezed,Object? mainPicture = freezed,Object? pictures = freezed,Object? hasElevator = freezed,Object? hasParking = freezed,Object? isAirConditioned = freezed,}) {
  return _then(_OfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,estateOfferUuid: freezed == estateOfferUuid ? _self.estateOfferUuid : estateOfferUuid // ignore: cast_nullable_to_non_nullable
as String?,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
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
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>?,hasElevator: freezed == hasElevator ? _self.hasElevator : hasElevator // ignore: cast_nullable_to_non_nullable
as bool?,hasParking: freezed == hasParking ? _self.hasParking : hasParking // ignore: cast_nullable_to_non_nullable
as bool?,isAirConditioned: freezed == isAirConditioned ? _self.isAirConditioned : isAirConditioned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
