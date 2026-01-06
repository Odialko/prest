// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfferListModel {

 bool get success; int get count; List<OfferModel> get offers;
/// Create a copy of OfferListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferListModelCopyWith<OfferListModel> get copyWith => _$OfferListModelCopyWithImpl<OfferListModel>(this as OfferListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferListModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.offers, offers));
}


@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(offers));

@override
String toString() {
  return 'OfferListModel(success: $success, count: $count, offers: $offers)';
}


}

/// @nodoc
abstract mixin class $OfferListModelCopyWith<$Res>  {
  factory $OfferListModelCopyWith(OfferListModel value, $Res Function(OfferListModel) _then) = _$OfferListModelCopyWithImpl;
@useResult
$Res call({
 bool success, int count, List<OfferModel> offers
});




}
/// @nodoc
class _$OfferListModelCopyWithImpl<$Res>
    implements $OfferListModelCopyWith<$Res> {
  _$OfferListModelCopyWithImpl(this._self, this._then);

  final OfferListModel _self;
  final $Res Function(OfferListModel) _then;

/// Create a copy of OfferListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? offers = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferListModel].
extension OfferListModelPatterns on OfferListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferListModel value)  $default,){
final _that = this;
switch (_that) {
case _OfferListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferListModel value)?  $default,){
final _that = this;
switch (_that) {
case _OfferListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int count,  List<OfferModel> offers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferListModel() when $default != null:
return $default(_that.success,_that.count,_that.offers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int count,  List<OfferModel> offers)  $default,) {final _that = this;
switch (_that) {
case _OfferListModel():
return $default(_that.success,_that.count,_that.offers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int count,  List<OfferModel> offers)?  $default,) {final _that = this;
switch (_that) {
case _OfferListModel() when $default != null:
return $default(_that.success,_that.count,_that.offers);case _:
  return null;

}
}

}

/// @nodoc


class _OfferListModel implements OfferListModel {
  const _OfferListModel({required this.success, required this.count, required final  List<OfferModel> offers}): _offers = offers;
  

@override final  bool success;
@override final  int count;
 final  List<OfferModel> _offers;
@override List<OfferModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}


/// Create a copy of OfferListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferListModelCopyWith<_OfferListModel> get copyWith => __$OfferListModelCopyWithImpl<_OfferListModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferListModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._offers, _offers));
}


@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(_offers));

@override
String toString() {
  return 'OfferListModel(success: $success, count: $count, offers: $offers)';
}


}

/// @nodoc
abstract mixin class _$OfferListModelCopyWith<$Res> implements $OfferListModelCopyWith<$Res> {
  factory _$OfferListModelCopyWith(_OfferListModel value, $Res Function(_OfferListModel) _then) = __$OfferListModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, int count, List<OfferModel> offers
});




}
/// @nodoc
class __$OfferListModelCopyWithImpl<$Res>
    implements _$OfferListModelCopyWith<$Res> {
  __$OfferListModelCopyWithImpl(this._self, this._then);

  final _OfferListModel _self;
  final $Res Function(_OfferListModel) _then;

/// Create a copy of OfferListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? offers = null,}) {
  return _then(_OfferListModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,
  ));
}


}

// dart format on
