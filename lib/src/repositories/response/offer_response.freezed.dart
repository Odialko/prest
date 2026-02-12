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

 dynamic get id; String? get estateOfferUuid; String? get number; String? get typeName; String? get price; int? get priceCurrency; String? get pricePermeter; String? get areaTotal; String? get areaUsable; String? get areaPlot; String? get description; String? get descriptionWebsite; String? get portalTitle;// Локація
 String? get locationCityName; String? get locationStreetName; String? get locationDistrictName; String? get locationProvinceName; String? get locationLatitude; String? get locationLongitude;// Характеристики (EstiCRM naming)
 int? get apartmentFloor; int? get apartmentRoomNumber; int? get apartmentLevelNumber;// Total floors
 int? get apartmentBathroomNumber; int? get apartmentBedroomNumber; int? get buildingYear; int? get market; int? get transaction;// Контакти
 String? get contactFirstname; String? get contactLastname; String? get contactEmail; String? get contactPhone;// Технічні
 dynamic get buildingAirConditioning;// Може бути int або bool
 dynamic get additionalParking; dynamic get additionalGarden; dynamic get additionalTerrace;// Медіа
 String? get mainPicture; List<String>? get pictures;
/// Create a copy of OfferResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferResponseCopyWith<OfferResponse> get copyWith => _$OfferResponseCopyWithImpl<OfferResponse>(this as OfferResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferResponse&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.estateOfferUuid, estateOfferUuid) || other.estateOfferUuid == estateOfferUuid)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.pricePermeter, pricePermeter) || other.pricePermeter == pricePermeter)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.areaUsable, areaUsable) || other.areaUsable == areaUsable)&&(identical(other.areaPlot, areaPlot) || other.areaPlot == areaPlot)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionWebsite, descriptionWebsite) || other.descriptionWebsite == descriptionWebsite)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.locationCityName, locationCityName) || other.locationCityName == locationCityName)&&(identical(other.locationStreetName, locationStreetName) || other.locationStreetName == locationStreetName)&&(identical(other.locationDistrictName, locationDistrictName) || other.locationDistrictName == locationDistrictName)&&(identical(other.locationProvinceName, locationProvinceName) || other.locationProvinceName == locationProvinceName)&&(identical(other.locationLatitude, locationLatitude) || other.locationLatitude == locationLatitude)&&(identical(other.locationLongitude, locationLongitude) || other.locationLongitude == locationLongitude)&&(identical(other.apartmentFloor, apartmentFloor) || other.apartmentFloor == apartmentFloor)&&(identical(other.apartmentRoomNumber, apartmentRoomNumber) || other.apartmentRoomNumber == apartmentRoomNumber)&&(identical(other.apartmentLevelNumber, apartmentLevelNumber) || other.apartmentLevelNumber == apartmentLevelNumber)&&(identical(other.apartmentBathroomNumber, apartmentBathroomNumber) || other.apartmentBathroomNumber == apartmentBathroomNumber)&&(identical(other.apartmentBedroomNumber, apartmentBedroomNumber) || other.apartmentBedroomNumber == apartmentBedroomNumber)&&(identical(other.buildingYear, buildingYear) || other.buildingYear == buildingYear)&&(identical(other.market, market) || other.market == market)&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.contactFirstname, contactFirstname) || other.contactFirstname == contactFirstname)&&(identical(other.contactLastname, contactLastname) || other.contactLastname == contactLastname)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&const DeepCollectionEquality().equals(other.buildingAirConditioning, buildingAirConditioning)&&const DeepCollectionEquality().equals(other.additionalParking, additionalParking)&&const DeepCollectionEquality().equals(other.additionalGarden, additionalGarden)&&const DeepCollectionEquality().equals(other.additionalTerrace, additionalTerrace)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other.pictures, pictures));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(id),estateOfferUuid,number,typeName,price,priceCurrency,pricePermeter,areaTotal,areaUsable,areaPlot,description,descriptionWebsite,portalTitle,locationCityName,locationStreetName,locationDistrictName,locationProvinceName,locationLatitude,locationLongitude,apartmentFloor,apartmentRoomNumber,apartmentLevelNumber,apartmentBathroomNumber,apartmentBedroomNumber,buildingYear,market,transaction,contactFirstname,contactLastname,contactEmail,contactPhone,const DeepCollectionEquality().hash(buildingAirConditioning),const DeepCollectionEquality().hash(additionalParking),const DeepCollectionEquality().hash(additionalGarden),const DeepCollectionEquality().hash(additionalTerrace),mainPicture,const DeepCollectionEquality().hash(pictures)]);

@override
String toString() {
  return 'OfferResponse(id: $id, estateOfferUuid: $estateOfferUuid, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, pricePermeter: $pricePermeter, areaTotal: $areaTotal, areaUsable: $areaUsable, areaPlot: $areaPlot, description: $description, descriptionWebsite: $descriptionWebsite, portalTitle: $portalTitle, locationCityName: $locationCityName, locationStreetName: $locationStreetName, locationDistrictName: $locationDistrictName, locationProvinceName: $locationProvinceName, locationLatitude: $locationLatitude, locationLongitude: $locationLongitude, apartmentFloor: $apartmentFloor, apartmentRoomNumber: $apartmentRoomNumber, apartmentLevelNumber: $apartmentLevelNumber, apartmentBathroomNumber: $apartmentBathroomNumber, apartmentBedroomNumber: $apartmentBedroomNumber, buildingYear: $buildingYear, market: $market, transaction: $transaction, contactFirstname: $contactFirstname, contactLastname: $contactLastname, contactEmail: $contactEmail, contactPhone: $contactPhone, buildingAirConditioning: $buildingAirConditioning, additionalParking: $additionalParking, additionalGarden: $additionalGarden, additionalTerrace: $additionalTerrace, mainPicture: $mainPicture, pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class $OfferResponseCopyWith<$Res>  {
  factory $OfferResponseCopyWith(OfferResponse value, $Res Function(OfferResponse) _then) = _$OfferResponseCopyWithImpl;
@useResult
$Res call({
 dynamic id, String? estateOfferUuid, String? number, String? typeName, String? price, int? priceCurrency, String? pricePermeter, String? areaTotal, String? areaUsable, String? areaPlot, String? description, String? descriptionWebsite, String? portalTitle, String? locationCityName, String? locationStreetName, String? locationDistrictName, String? locationProvinceName, String? locationLatitude, String? locationLongitude, int? apartmentFloor, int? apartmentRoomNumber, int? apartmentLevelNumber, int? apartmentBathroomNumber, int? apartmentBedroomNumber, int? buildingYear, int? market, int? transaction, String? contactFirstname, String? contactLastname, String? contactEmail, String? contactPhone, dynamic buildingAirConditioning, dynamic additionalParking, dynamic additionalGarden, dynamic additionalTerrace, String? mainPicture, List<String>? pictures
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? estateOfferUuid = freezed,Object? number = freezed,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? pricePermeter = freezed,Object? areaTotal = freezed,Object? areaUsable = freezed,Object? areaPlot = freezed,Object? description = freezed,Object? descriptionWebsite = freezed,Object? portalTitle = freezed,Object? locationCityName = freezed,Object? locationStreetName = freezed,Object? locationDistrictName = freezed,Object? locationProvinceName = freezed,Object? locationLatitude = freezed,Object? locationLongitude = freezed,Object? apartmentFloor = freezed,Object? apartmentRoomNumber = freezed,Object? apartmentLevelNumber = freezed,Object? apartmentBathroomNumber = freezed,Object? apartmentBedroomNumber = freezed,Object? buildingYear = freezed,Object? market = freezed,Object? transaction = freezed,Object? contactFirstname = freezed,Object? contactLastname = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? buildingAirConditioning = freezed,Object? additionalParking = freezed,Object? additionalGarden = freezed,Object? additionalTerrace = freezed,Object? mainPicture = freezed,Object? pictures = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,estateOfferUuid: freezed == estateOfferUuid ? _self.estateOfferUuid : estateOfferUuid // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as int?,pricePermeter: freezed == pricePermeter ? _self.pricePermeter : pricePermeter // ignore: cast_nullable_to_non_nullable
as String?,areaTotal: freezed == areaTotal ? _self.areaTotal : areaTotal // ignore: cast_nullable_to_non_nullable
as String?,areaUsable: freezed == areaUsable ? _self.areaUsable : areaUsable // ignore: cast_nullable_to_non_nullable
as String?,areaPlot: freezed == areaPlot ? _self.areaPlot : areaPlot // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionWebsite: freezed == descriptionWebsite ? _self.descriptionWebsite : descriptionWebsite // ignore: cast_nullable_to_non_nullable
as String?,portalTitle: freezed == portalTitle ? _self.portalTitle : portalTitle // ignore: cast_nullable_to_non_nullable
as String?,locationCityName: freezed == locationCityName ? _self.locationCityName : locationCityName // ignore: cast_nullable_to_non_nullable
as String?,locationStreetName: freezed == locationStreetName ? _self.locationStreetName : locationStreetName // ignore: cast_nullable_to_non_nullable
as String?,locationDistrictName: freezed == locationDistrictName ? _self.locationDistrictName : locationDistrictName // ignore: cast_nullable_to_non_nullable
as String?,locationProvinceName: freezed == locationProvinceName ? _self.locationProvinceName : locationProvinceName // ignore: cast_nullable_to_non_nullable
as String?,locationLatitude: freezed == locationLatitude ? _self.locationLatitude : locationLatitude // ignore: cast_nullable_to_non_nullable
as String?,locationLongitude: freezed == locationLongitude ? _self.locationLongitude : locationLongitude // ignore: cast_nullable_to_non_nullable
as String?,apartmentFloor: freezed == apartmentFloor ? _self.apartmentFloor : apartmentFloor // ignore: cast_nullable_to_non_nullable
as int?,apartmentRoomNumber: freezed == apartmentRoomNumber ? _self.apartmentRoomNumber : apartmentRoomNumber // ignore: cast_nullable_to_non_nullable
as int?,apartmentLevelNumber: freezed == apartmentLevelNumber ? _self.apartmentLevelNumber : apartmentLevelNumber // ignore: cast_nullable_to_non_nullable
as int?,apartmentBathroomNumber: freezed == apartmentBathroomNumber ? _self.apartmentBathroomNumber : apartmentBathroomNumber // ignore: cast_nullable_to_non_nullable
as int?,apartmentBedroomNumber: freezed == apartmentBedroomNumber ? _self.apartmentBedroomNumber : apartmentBedroomNumber // ignore: cast_nullable_to_non_nullable
as int?,buildingYear: freezed == buildingYear ? _self.buildingYear : buildingYear // ignore: cast_nullable_to_non_nullable
as int?,market: freezed == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as int?,transaction: freezed == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as int?,contactFirstname: freezed == contactFirstname ? _self.contactFirstname : contactFirstname // ignore: cast_nullable_to_non_nullable
as String?,contactLastname: freezed == contactLastname ? _self.contactLastname : contactLastname // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,buildingAirConditioning: freezed == buildingAirConditioning ? _self.buildingAirConditioning : buildingAirConditioning // ignore: cast_nullable_to_non_nullable
as dynamic,additionalParking: freezed == additionalParking ? _self.additionalParking : additionalParking // ignore: cast_nullable_to_non_nullable
as dynamic,additionalGarden: freezed == additionalGarden ? _self.additionalGarden : additionalGarden // ignore: cast_nullable_to_non_nullable
as dynamic,additionalTerrace: freezed == additionalTerrace ? _self.additionalTerrace : additionalTerrace // ignore: cast_nullable_to_non_nullable
as dynamic,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String? estateOfferUuid,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal,  String? areaUsable,  String? areaPlot,  String? description,  String? descriptionWebsite,  String? portalTitle,  String? locationCityName,  String? locationStreetName,  String? locationDistrictName,  String? locationProvinceName,  String? locationLatitude,  String? locationLongitude,  int? apartmentFloor,  int? apartmentRoomNumber,  int? apartmentLevelNumber,  int? apartmentBathroomNumber,  int? apartmentBedroomNumber,  int? buildingYear,  int? market,  int? transaction,  String? contactFirstname,  String? contactLastname,  String? contactEmail,  String? contactPhone,  dynamic buildingAirConditioning,  dynamic additionalParking,  dynamic additionalGarden,  dynamic additionalTerrace,  String? mainPicture,  List<String>? pictures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.areaUsable,_that.areaPlot,_that.description,_that.descriptionWebsite,_that.portalTitle,_that.locationCityName,_that.locationStreetName,_that.locationDistrictName,_that.locationProvinceName,_that.locationLatitude,_that.locationLongitude,_that.apartmentFloor,_that.apartmentRoomNumber,_that.apartmentLevelNumber,_that.apartmentBathroomNumber,_that.apartmentBedroomNumber,_that.buildingYear,_that.market,_that.transaction,_that.contactFirstname,_that.contactLastname,_that.contactEmail,_that.contactPhone,_that.buildingAirConditioning,_that.additionalParking,_that.additionalGarden,_that.additionalTerrace,_that.mainPicture,_that.pictures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String? estateOfferUuid,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal,  String? areaUsable,  String? areaPlot,  String? description,  String? descriptionWebsite,  String? portalTitle,  String? locationCityName,  String? locationStreetName,  String? locationDistrictName,  String? locationProvinceName,  String? locationLatitude,  String? locationLongitude,  int? apartmentFloor,  int? apartmentRoomNumber,  int? apartmentLevelNumber,  int? apartmentBathroomNumber,  int? apartmentBedroomNumber,  int? buildingYear,  int? market,  int? transaction,  String? contactFirstname,  String? contactLastname,  String? contactEmail,  String? contactPhone,  dynamic buildingAirConditioning,  dynamic additionalParking,  dynamic additionalGarden,  dynamic additionalTerrace,  String? mainPicture,  List<String>? pictures)  $default,) {final _that = this;
switch (_that) {
case _OfferResponse():
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.areaUsable,_that.areaPlot,_that.description,_that.descriptionWebsite,_that.portalTitle,_that.locationCityName,_that.locationStreetName,_that.locationDistrictName,_that.locationProvinceName,_that.locationLatitude,_that.locationLongitude,_that.apartmentFloor,_that.apartmentRoomNumber,_that.apartmentLevelNumber,_that.apartmentBathroomNumber,_that.apartmentBedroomNumber,_that.buildingYear,_that.market,_that.transaction,_that.contactFirstname,_that.contactLastname,_that.contactEmail,_that.contactPhone,_that.buildingAirConditioning,_that.additionalParking,_that.additionalGarden,_that.additionalTerrace,_that.mainPicture,_that.pictures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String? estateOfferUuid,  String? number,  String? typeName,  String? price,  int? priceCurrency,  String? pricePermeter,  String? areaTotal,  String? areaUsable,  String? areaPlot,  String? description,  String? descriptionWebsite,  String? portalTitle,  String? locationCityName,  String? locationStreetName,  String? locationDistrictName,  String? locationProvinceName,  String? locationLatitude,  String? locationLongitude,  int? apartmentFloor,  int? apartmentRoomNumber,  int? apartmentLevelNumber,  int? apartmentBathroomNumber,  int? apartmentBedroomNumber,  int? buildingYear,  int? market,  int? transaction,  String? contactFirstname,  String? contactLastname,  String? contactEmail,  String? contactPhone,  dynamic buildingAirConditioning,  dynamic additionalParking,  dynamic additionalGarden,  dynamic additionalTerrace,  String? mainPicture,  List<String>? pictures)?  $default,) {final _that = this;
switch (_that) {
case _OfferResponse() when $default != null:
return $default(_that.id,_that.estateOfferUuid,_that.number,_that.typeName,_that.price,_that.priceCurrency,_that.pricePermeter,_that.areaTotal,_that.areaUsable,_that.areaPlot,_that.description,_that.descriptionWebsite,_that.portalTitle,_that.locationCityName,_that.locationStreetName,_that.locationDistrictName,_that.locationProvinceName,_that.locationLatitude,_that.locationLongitude,_that.apartmentFloor,_that.apartmentRoomNumber,_that.apartmentLevelNumber,_that.apartmentBathroomNumber,_that.apartmentBedroomNumber,_that.buildingYear,_that.market,_that.transaction,_that.contactFirstname,_that.contactLastname,_that.contactEmail,_that.contactPhone,_that.buildingAirConditioning,_that.additionalParking,_that.additionalGarden,_that.additionalTerrace,_that.mainPicture,_that.pictures);case _:
  return null;

}
}

}

/// @nodoc


class _OfferResponse implements OfferResponse {
  const _OfferResponse({required this.id, this.estateOfferUuid, this.number, this.typeName, this.price, this.priceCurrency, this.pricePermeter, this.areaTotal, this.areaUsable, this.areaPlot, this.description, this.descriptionWebsite, this.portalTitle, this.locationCityName, this.locationStreetName, this.locationDistrictName, this.locationProvinceName, this.locationLatitude, this.locationLongitude, this.apartmentFloor, this.apartmentRoomNumber, this.apartmentLevelNumber, this.apartmentBathroomNumber, this.apartmentBedroomNumber, this.buildingYear, this.market, this.transaction, this.contactFirstname, this.contactLastname, this.contactEmail, this.contactPhone, this.buildingAirConditioning, this.additionalParking, this.additionalGarden, this.additionalTerrace, this.mainPicture, final  List<String>? pictures}): _pictures = pictures;
  

@override final  dynamic id;
@override final  String? estateOfferUuid;
@override final  String? number;
@override final  String? typeName;
@override final  String? price;
@override final  int? priceCurrency;
@override final  String? pricePermeter;
@override final  String? areaTotal;
@override final  String? areaUsable;
@override final  String? areaPlot;
@override final  String? description;
@override final  String? descriptionWebsite;
@override final  String? portalTitle;
// Локація
@override final  String? locationCityName;
@override final  String? locationStreetName;
@override final  String? locationDistrictName;
@override final  String? locationProvinceName;
@override final  String? locationLatitude;
@override final  String? locationLongitude;
// Характеристики (EstiCRM naming)
@override final  int? apartmentFloor;
@override final  int? apartmentRoomNumber;
@override final  int? apartmentLevelNumber;
// Total floors
@override final  int? apartmentBathroomNumber;
@override final  int? apartmentBedroomNumber;
@override final  int? buildingYear;
@override final  int? market;
@override final  int? transaction;
// Контакти
@override final  String? contactFirstname;
@override final  String? contactLastname;
@override final  String? contactEmail;
@override final  String? contactPhone;
// Технічні
@override final  dynamic buildingAirConditioning;
// Може бути int або bool
@override final  dynamic additionalParking;
@override final  dynamic additionalGarden;
@override final  dynamic additionalTerrace;
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


/// Create a copy of OfferResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferResponseCopyWith<_OfferResponse> get copyWith => __$OfferResponseCopyWithImpl<_OfferResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferResponse&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.estateOfferUuid, estateOfferUuid) || other.estateOfferUuid == estateOfferUuid)&&(identical(other.number, number) || other.number == number)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.pricePermeter, pricePermeter) || other.pricePermeter == pricePermeter)&&(identical(other.areaTotal, areaTotal) || other.areaTotal == areaTotal)&&(identical(other.areaUsable, areaUsable) || other.areaUsable == areaUsable)&&(identical(other.areaPlot, areaPlot) || other.areaPlot == areaPlot)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionWebsite, descriptionWebsite) || other.descriptionWebsite == descriptionWebsite)&&(identical(other.portalTitle, portalTitle) || other.portalTitle == portalTitle)&&(identical(other.locationCityName, locationCityName) || other.locationCityName == locationCityName)&&(identical(other.locationStreetName, locationStreetName) || other.locationStreetName == locationStreetName)&&(identical(other.locationDistrictName, locationDistrictName) || other.locationDistrictName == locationDistrictName)&&(identical(other.locationProvinceName, locationProvinceName) || other.locationProvinceName == locationProvinceName)&&(identical(other.locationLatitude, locationLatitude) || other.locationLatitude == locationLatitude)&&(identical(other.locationLongitude, locationLongitude) || other.locationLongitude == locationLongitude)&&(identical(other.apartmentFloor, apartmentFloor) || other.apartmentFloor == apartmentFloor)&&(identical(other.apartmentRoomNumber, apartmentRoomNumber) || other.apartmentRoomNumber == apartmentRoomNumber)&&(identical(other.apartmentLevelNumber, apartmentLevelNumber) || other.apartmentLevelNumber == apartmentLevelNumber)&&(identical(other.apartmentBathroomNumber, apartmentBathroomNumber) || other.apartmentBathroomNumber == apartmentBathroomNumber)&&(identical(other.apartmentBedroomNumber, apartmentBedroomNumber) || other.apartmentBedroomNumber == apartmentBedroomNumber)&&(identical(other.buildingYear, buildingYear) || other.buildingYear == buildingYear)&&(identical(other.market, market) || other.market == market)&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.contactFirstname, contactFirstname) || other.contactFirstname == contactFirstname)&&(identical(other.contactLastname, contactLastname) || other.contactLastname == contactLastname)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&const DeepCollectionEquality().equals(other.buildingAirConditioning, buildingAirConditioning)&&const DeepCollectionEquality().equals(other.additionalParking, additionalParking)&&const DeepCollectionEquality().equals(other.additionalGarden, additionalGarden)&&const DeepCollectionEquality().equals(other.additionalTerrace, additionalTerrace)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&const DeepCollectionEquality().equals(other._pictures, _pictures));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(id),estateOfferUuid,number,typeName,price,priceCurrency,pricePermeter,areaTotal,areaUsable,areaPlot,description,descriptionWebsite,portalTitle,locationCityName,locationStreetName,locationDistrictName,locationProvinceName,locationLatitude,locationLongitude,apartmentFloor,apartmentRoomNumber,apartmentLevelNumber,apartmentBathroomNumber,apartmentBedroomNumber,buildingYear,market,transaction,contactFirstname,contactLastname,contactEmail,contactPhone,const DeepCollectionEquality().hash(buildingAirConditioning),const DeepCollectionEquality().hash(additionalParking),const DeepCollectionEquality().hash(additionalGarden),const DeepCollectionEquality().hash(additionalTerrace),mainPicture,const DeepCollectionEquality().hash(_pictures)]);

@override
String toString() {
  return 'OfferResponse(id: $id, estateOfferUuid: $estateOfferUuid, number: $number, typeName: $typeName, price: $price, priceCurrency: $priceCurrency, pricePermeter: $pricePermeter, areaTotal: $areaTotal, areaUsable: $areaUsable, areaPlot: $areaPlot, description: $description, descriptionWebsite: $descriptionWebsite, portalTitle: $portalTitle, locationCityName: $locationCityName, locationStreetName: $locationStreetName, locationDistrictName: $locationDistrictName, locationProvinceName: $locationProvinceName, locationLatitude: $locationLatitude, locationLongitude: $locationLongitude, apartmentFloor: $apartmentFloor, apartmentRoomNumber: $apartmentRoomNumber, apartmentLevelNumber: $apartmentLevelNumber, apartmentBathroomNumber: $apartmentBathroomNumber, apartmentBedroomNumber: $apartmentBedroomNumber, buildingYear: $buildingYear, market: $market, transaction: $transaction, contactFirstname: $contactFirstname, contactLastname: $contactLastname, contactEmail: $contactEmail, contactPhone: $contactPhone, buildingAirConditioning: $buildingAirConditioning, additionalParking: $additionalParking, additionalGarden: $additionalGarden, additionalTerrace: $additionalTerrace, mainPicture: $mainPicture, pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class _$OfferResponseCopyWith<$Res> implements $OfferResponseCopyWith<$Res> {
  factory _$OfferResponseCopyWith(_OfferResponse value, $Res Function(_OfferResponse) _then) = __$OfferResponseCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String? estateOfferUuid, String? number, String? typeName, String? price, int? priceCurrency, String? pricePermeter, String? areaTotal, String? areaUsable, String? areaPlot, String? description, String? descriptionWebsite, String? portalTitle, String? locationCityName, String? locationStreetName, String? locationDistrictName, String? locationProvinceName, String? locationLatitude, String? locationLongitude, int? apartmentFloor, int? apartmentRoomNumber, int? apartmentLevelNumber, int? apartmentBathroomNumber, int? apartmentBedroomNumber, int? buildingYear, int? market, int? transaction, String? contactFirstname, String? contactLastname, String? contactEmail, String? contactPhone, dynamic buildingAirConditioning, dynamic additionalParking, dynamic additionalGarden, dynamic additionalTerrace, String? mainPicture, List<String>? pictures
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? estateOfferUuid = freezed,Object? number = freezed,Object? typeName = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? pricePermeter = freezed,Object? areaTotal = freezed,Object? areaUsable = freezed,Object? areaPlot = freezed,Object? description = freezed,Object? descriptionWebsite = freezed,Object? portalTitle = freezed,Object? locationCityName = freezed,Object? locationStreetName = freezed,Object? locationDistrictName = freezed,Object? locationProvinceName = freezed,Object? locationLatitude = freezed,Object? locationLongitude = freezed,Object? apartmentFloor = freezed,Object? apartmentRoomNumber = freezed,Object? apartmentLevelNumber = freezed,Object? apartmentBathroomNumber = freezed,Object? apartmentBedroomNumber = freezed,Object? buildingYear = freezed,Object? market = freezed,Object? transaction = freezed,Object? contactFirstname = freezed,Object? contactLastname = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? buildingAirConditioning = freezed,Object? additionalParking = freezed,Object? additionalGarden = freezed,Object? additionalTerrace = freezed,Object? mainPicture = freezed,Object? pictures = freezed,}) {
  return _then(_OfferResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,estateOfferUuid: freezed == estateOfferUuid ? _self.estateOfferUuid : estateOfferUuid // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as int?,pricePermeter: freezed == pricePermeter ? _self.pricePermeter : pricePermeter // ignore: cast_nullable_to_non_nullable
as String?,areaTotal: freezed == areaTotal ? _self.areaTotal : areaTotal // ignore: cast_nullable_to_non_nullable
as String?,areaUsable: freezed == areaUsable ? _self.areaUsable : areaUsable // ignore: cast_nullable_to_non_nullable
as String?,areaPlot: freezed == areaPlot ? _self.areaPlot : areaPlot // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionWebsite: freezed == descriptionWebsite ? _self.descriptionWebsite : descriptionWebsite // ignore: cast_nullable_to_non_nullable
as String?,portalTitle: freezed == portalTitle ? _self.portalTitle : portalTitle // ignore: cast_nullable_to_non_nullable
as String?,locationCityName: freezed == locationCityName ? _self.locationCityName : locationCityName // ignore: cast_nullable_to_non_nullable
as String?,locationStreetName: freezed == locationStreetName ? _self.locationStreetName : locationStreetName // ignore: cast_nullable_to_non_nullable
as String?,locationDistrictName: freezed == locationDistrictName ? _self.locationDistrictName : locationDistrictName // ignore: cast_nullable_to_non_nullable
as String?,locationProvinceName: freezed == locationProvinceName ? _self.locationProvinceName : locationProvinceName // ignore: cast_nullable_to_non_nullable
as String?,locationLatitude: freezed == locationLatitude ? _self.locationLatitude : locationLatitude // ignore: cast_nullable_to_non_nullable
as String?,locationLongitude: freezed == locationLongitude ? _self.locationLongitude : locationLongitude // ignore: cast_nullable_to_non_nullable
as String?,apartmentFloor: freezed == apartmentFloor ? _self.apartmentFloor : apartmentFloor // ignore: cast_nullable_to_non_nullable
as int?,apartmentRoomNumber: freezed == apartmentRoomNumber ? _self.apartmentRoomNumber : apartmentRoomNumber // ignore: cast_nullable_to_non_nullable
as int?,apartmentLevelNumber: freezed == apartmentLevelNumber ? _self.apartmentLevelNumber : apartmentLevelNumber // ignore: cast_nullable_to_non_nullable
as int?,apartmentBathroomNumber: freezed == apartmentBathroomNumber ? _self.apartmentBathroomNumber : apartmentBathroomNumber // ignore: cast_nullable_to_non_nullable
as int?,apartmentBedroomNumber: freezed == apartmentBedroomNumber ? _self.apartmentBedroomNumber : apartmentBedroomNumber // ignore: cast_nullable_to_non_nullable
as int?,buildingYear: freezed == buildingYear ? _self.buildingYear : buildingYear // ignore: cast_nullable_to_non_nullable
as int?,market: freezed == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as int?,transaction: freezed == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as int?,contactFirstname: freezed == contactFirstname ? _self.contactFirstname : contactFirstname // ignore: cast_nullable_to_non_nullable
as String?,contactLastname: freezed == contactLastname ? _self.contactLastname : contactLastname // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,buildingAirConditioning: freezed == buildingAirConditioning ? _self.buildingAirConditioning : buildingAirConditioning // ignore: cast_nullable_to_non_nullable
as dynamic,additionalParking: freezed == additionalParking ? _self.additionalParking : additionalParking // ignore: cast_nullable_to_non_nullable
as dynamic,additionalGarden: freezed == additionalGarden ? _self.additionalGarden : additionalGarden // ignore: cast_nullable_to_non_nullable
as dynamic,additionalTerrace: freezed == additionalTerrace ? _self.additionalTerrace : additionalTerrace // ignore: cast_nullable_to_non_nullable
as dynamic,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
