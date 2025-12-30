// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_hub_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavigationHubStore {

 bool get isScrolled; String? get activeRoute;
/// Create a copy of NavigationHubStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationHubStoreCopyWith<NavigationHubStore> get copyWith => _$NavigationHubStoreCopyWithImpl<NavigationHubStore>(this as NavigationHubStore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationHubStore&&(identical(other.isScrolled, isScrolled) || other.isScrolled == isScrolled)&&(identical(other.activeRoute, activeRoute) || other.activeRoute == activeRoute));
}


@override
int get hashCode => Object.hash(runtimeType,isScrolled,activeRoute);

@override
String toString() {
  return 'NavigationHubStore(isScrolled: $isScrolled, activeRoute: $activeRoute)';
}


}

/// @nodoc
abstract mixin class $NavigationHubStoreCopyWith<$Res>  {
  factory $NavigationHubStoreCopyWith(NavigationHubStore value, $Res Function(NavigationHubStore) _then) = _$NavigationHubStoreCopyWithImpl;
@useResult
$Res call({
 bool isScrolled, String? activeRoute
});




}
/// @nodoc
class _$NavigationHubStoreCopyWithImpl<$Res>
    implements $NavigationHubStoreCopyWith<$Res> {
  _$NavigationHubStoreCopyWithImpl(this._self, this._then);

  final NavigationHubStore _self;
  final $Res Function(NavigationHubStore) _then;

/// Create a copy of NavigationHubStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isScrolled = null,Object? activeRoute = freezed,}) {
  return _then(_self.copyWith(
isScrolled: null == isScrolled ? _self.isScrolled : isScrolled // ignore: cast_nullable_to_non_nullable
as bool,activeRoute: freezed == activeRoute ? _self.activeRoute : activeRoute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationHubStore].
extension NavigationHubStorePatterns on NavigationHubStore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationHubStore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationHubStore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationHubStore value)  $default,){
final _that = this;
switch (_that) {
case _NavigationHubStore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationHubStore value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationHubStore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isScrolled,  String? activeRoute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationHubStore() when $default != null:
return $default(_that.isScrolled,_that.activeRoute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isScrolled,  String? activeRoute)  $default,) {final _that = this;
switch (_that) {
case _NavigationHubStore():
return $default(_that.isScrolled,_that.activeRoute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isScrolled,  String? activeRoute)?  $default,) {final _that = this;
switch (_that) {
case _NavigationHubStore() when $default != null:
return $default(_that.isScrolled,_that.activeRoute);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationHubStore implements NavigationHubStore {
  const _NavigationHubStore({this.isScrolled = false, this.activeRoute});
  

@override@JsonKey() final  bool isScrolled;
@override final  String? activeRoute;

/// Create a copy of NavigationHubStore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationHubStoreCopyWith<_NavigationHubStore> get copyWith => __$NavigationHubStoreCopyWithImpl<_NavigationHubStore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationHubStore&&(identical(other.isScrolled, isScrolled) || other.isScrolled == isScrolled)&&(identical(other.activeRoute, activeRoute) || other.activeRoute == activeRoute));
}


@override
int get hashCode => Object.hash(runtimeType,isScrolled,activeRoute);

@override
String toString() {
  return 'NavigationHubStore(isScrolled: $isScrolled, activeRoute: $activeRoute)';
}


}

/// @nodoc
abstract mixin class _$NavigationHubStoreCopyWith<$Res> implements $NavigationHubStoreCopyWith<$Res> {
  factory _$NavigationHubStoreCopyWith(_NavigationHubStore value, $Res Function(_NavigationHubStore) _then) = __$NavigationHubStoreCopyWithImpl;
@override @useResult
$Res call({
 bool isScrolled, String? activeRoute
});




}
/// @nodoc
class __$NavigationHubStoreCopyWithImpl<$Res>
    implements _$NavigationHubStoreCopyWith<$Res> {
  __$NavigationHubStoreCopyWithImpl(this._self, this._then);

  final _NavigationHubStore _self;
  final $Res Function(_NavigationHubStore) _then;

/// Create a copy of NavigationHubStore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isScrolled = null,Object? activeRoute = freezed,}) {
  return _then(_NavigationHubStore(
isScrolled: null == isScrolled ? _self.isScrolled : isScrolled // ignore: cast_nullable_to_non_nullable
as bool,activeRoute: freezed == activeRoute ? _self.activeRoute : activeRoute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
