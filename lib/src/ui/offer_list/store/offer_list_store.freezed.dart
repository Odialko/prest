// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_list_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfferListState {

 OffersState get offersState; String get currentType; int get currentPage; bool get hasMore;// Чи є ще дані для завантаження
 bool get isLoadingMore;
/// Create a copy of OfferListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferListStateCopyWith<OfferListState> get copyWith => _$OfferListStateCopyWithImpl<OfferListState>(this as OfferListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferListState&&(identical(other.offersState, offersState) || other.offersState == offersState)&&(identical(other.currentType, currentType) || other.currentType == currentType)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,offersState,currentType,currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'OfferListState(offersState: $offersState, currentType: $currentType, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $OfferListStateCopyWith<$Res>  {
  factory $OfferListStateCopyWith(OfferListState value, $Res Function(OfferListState) _then) = _$OfferListStateCopyWithImpl;
@useResult
$Res call({
 OffersState offersState, String currentType, int currentPage, bool hasMore, bool isLoadingMore
});


$OffersStateCopyWith<$Res> get offersState;

}
/// @nodoc
class _$OfferListStateCopyWithImpl<$Res>
    implements $OfferListStateCopyWith<$Res> {
  _$OfferListStateCopyWithImpl(this._self, this._then);

  final OfferListState _self;
  final $Res Function(OfferListState) _then;

/// Create a copy of OfferListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offersState = null,Object? currentType = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
offersState: null == offersState ? _self.offersState : offersState // ignore: cast_nullable_to_non_nullable
as OffersState,currentType: null == currentType ? _self.currentType : currentType // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of OfferListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OffersStateCopyWith<$Res> get offersState {
  
  return $OffersStateCopyWith<$Res>(_self.offersState, (value) {
    return _then(_self.copyWith(offersState: value));
  });
}
}


/// Adds pattern-matching-related methods to [OfferListState].
extension OfferListStatePatterns on OfferListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferListState value)  $default,){
final _that = this;
switch (_that) {
case _OfferListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferListState value)?  $default,){
final _that = this;
switch (_that) {
case _OfferListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OffersState offersState,  String currentType,  int currentPage,  bool hasMore,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferListState() when $default != null:
return $default(_that.offersState,_that.currentType,_that.currentPage,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OffersState offersState,  String currentType,  int currentPage,  bool hasMore,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _OfferListState():
return $default(_that.offersState,_that.currentType,_that.currentPage,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OffersState offersState,  String currentType,  int currentPage,  bool hasMore,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _OfferListState() when $default != null:
return $default(_that.offersState,_that.currentType,_that.currentPage,_that.hasMore,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _OfferListState implements OfferListState {
  const _OfferListState({required this.offersState, this.currentType = 'all', this.currentPage = 1, this.hasMore = true, this.isLoadingMore = false});
  

@override final  OffersState offersState;
@override@JsonKey() final  String currentType;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
// Чи є ще дані для завантаження
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of OfferListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferListStateCopyWith<_OfferListState> get copyWith => __$OfferListStateCopyWithImpl<_OfferListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferListState&&(identical(other.offersState, offersState) || other.offersState == offersState)&&(identical(other.currentType, currentType) || other.currentType == currentType)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,offersState,currentType,currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'OfferListState(offersState: $offersState, currentType: $currentType, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$OfferListStateCopyWith<$Res> implements $OfferListStateCopyWith<$Res> {
  factory _$OfferListStateCopyWith(_OfferListState value, $Res Function(_OfferListState) _then) = __$OfferListStateCopyWithImpl;
@override @useResult
$Res call({
 OffersState offersState, String currentType, int currentPage, bool hasMore, bool isLoadingMore
});


@override $OffersStateCopyWith<$Res> get offersState;

}
/// @nodoc
class __$OfferListStateCopyWithImpl<$Res>
    implements _$OfferListStateCopyWith<$Res> {
  __$OfferListStateCopyWithImpl(this._self, this._then);

  final _OfferListState _self;
  final $Res Function(_OfferListState) _then;

/// Create a copy of OfferListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offersState = null,Object? currentType = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_OfferListState(
offersState: null == offersState ? _self.offersState : offersState // ignore: cast_nullable_to_non_nullable
as OffersState,currentType: null == currentType ? _self.currentType : currentType // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of OfferListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OffersStateCopyWith<$Res> get offersState {
  
  return $OffersStateCopyWith<$Res>(_self.offersState, (value) {
    return _then(_self.copyWith(offersState: value));
  });
}
}

// dart format on
