// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_details_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfferDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferDetailsState()';
}


}

/// @nodoc
class $OfferDetailsStateCopyWith<$Res>  {
$OfferDetailsStateCopyWith(OfferDetailsState _, $Res Function(OfferDetailsState) __);
}


/// Adds pattern-matching-related methods to [OfferDetailsState].
extension OfferDetailsStatePatterns on OfferDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OfferDetailsStateInit value)?  init,TResult Function( OfferDetailsStateLoading value)?  loading,TResult Function( OfferDetailsStateError value)?  error,TResult Function( OfferDetailsStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OfferDetailsStateInit() when init != null:
return init(_that);case OfferDetailsStateLoading() when loading != null:
return loading(_that);case OfferDetailsStateError() when error != null:
return error(_that);case OfferDetailsStateLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OfferDetailsStateInit value)  init,required TResult Function( OfferDetailsStateLoading value)  loading,required TResult Function( OfferDetailsStateError value)  error,required TResult Function( OfferDetailsStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case OfferDetailsStateInit():
return init(_that);case OfferDetailsStateLoading():
return loading(_that);case OfferDetailsStateError():
return error(_that);case OfferDetailsStateLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OfferDetailsStateInit value)?  init,TResult? Function( OfferDetailsStateLoading value)?  loading,TResult? Function( OfferDetailsStateError value)?  error,TResult? Function( OfferDetailsStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case OfferDetailsStateInit() when init != null:
return init(_that);case OfferDetailsStateLoading() when loading != null:
return loading(_that);case OfferDetailsStateError() when error != null:
return error(_that);case OfferDetailsStateLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function( String? message)?  error,TResult Function( OfferModel item)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OfferDetailsStateInit() when init != null:
return init();case OfferDetailsStateLoading() when loading != null:
return loading();case OfferDetailsStateError() when error != null:
return error(_that.message);case OfferDetailsStateLoaded() when loaded != null:
return loaded(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function( String? message)  error,required TResult Function( OfferModel item)  loaded,}) {final _that = this;
switch (_that) {
case OfferDetailsStateInit():
return init();case OfferDetailsStateLoading():
return loading();case OfferDetailsStateError():
return error(_that.message);case OfferDetailsStateLoaded():
return loaded(_that.item);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function( String? message)?  error,TResult? Function( OfferModel item)?  loaded,}) {final _that = this;
switch (_that) {
case OfferDetailsStateInit() when init != null:
return init();case OfferDetailsStateLoading() when loading != null:
return loading();case OfferDetailsStateError() when error != null:
return error(_that.message);case OfferDetailsStateLoaded() when loaded != null:
return loaded(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class OfferDetailsStateInit implements OfferDetailsState {
  const OfferDetailsStateInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDetailsStateInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferDetailsState.init()';
}


}




/// @nodoc


class OfferDetailsStateLoading implements OfferDetailsState {
  const OfferDetailsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDetailsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferDetailsState.loading()';
}


}




/// @nodoc


class OfferDetailsStateError implements OfferDetailsState {
  const OfferDetailsStateError({this.message});
  

 final  String? message;

/// Create a copy of OfferDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferDetailsStateErrorCopyWith<OfferDetailsStateError> get copyWith => _$OfferDetailsStateErrorCopyWithImpl<OfferDetailsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDetailsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OfferDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OfferDetailsStateErrorCopyWith<$Res> implements $OfferDetailsStateCopyWith<$Res> {
  factory $OfferDetailsStateErrorCopyWith(OfferDetailsStateError value, $Res Function(OfferDetailsStateError) _then) = _$OfferDetailsStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$OfferDetailsStateErrorCopyWithImpl<$Res>
    implements $OfferDetailsStateErrorCopyWith<$Res> {
  _$OfferDetailsStateErrorCopyWithImpl(this._self, this._then);

  final OfferDetailsStateError _self;
  final $Res Function(OfferDetailsStateError) _then;

/// Create a copy of OfferDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(OfferDetailsStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OfferDetailsStateLoaded implements OfferDetailsState {
  const OfferDetailsStateLoaded({required this.item});
  

 final  OfferModel item;

/// Create a copy of OfferDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferDetailsStateLoadedCopyWith<OfferDetailsStateLoaded> get copyWith => _$OfferDetailsStateLoadedCopyWithImpl<OfferDetailsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDetailsStateLoaded&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OfferDetailsState.loaded(item: $item)';
}


}

/// @nodoc
abstract mixin class $OfferDetailsStateLoadedCopyWith<$Res> implements $OfferDetailsStateCopyWith<$Res> {
  factory $OfferDetailsStateLoadedCopyWith(OfferDetailsStateLoaded value, $Res Function(OfferDetailsStateLoaded) _then) = _$OfferDetailsStateLoadedCopyWithImpl;
@useResult
$Res call({
 OfferModel item
});


$OfferModelCopyWith<$Res> get item;

}
/// @nodoc
class _$OfferDetailsStateLoadedCopyWithImpl<$Res>
    implements $OfferDetailsStateLoadedCopyWith<$Res> {
  _$OfferDetailsStateLoadedCopyWithImpl(this._self, this._then);

  final OfferDetailsStateLoaded _self;
  final $Res Function(OfferDetailsStateLoaded) _then;

/// Create a copy of OfferDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(OfferDetailsStateLoaded(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OfferModel,
  ));
}

/// Create a copy of OfferDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferModelCopyWith<$Res> get item {
  
  return $OfferModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
