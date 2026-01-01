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
mixin _$NavigationHubState {

 bool get isScrolled; String? get activeRoute;
/// Create a copy of NavigationHubState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationHubStateCopyWith<NavigationHubState> get copyWith => _$NavigationHubStateCopyWithImpl<NavigationHubState>(this as NavigationHubState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationHubState&&(identical(other.isScrolled, isScrolled) || other.isScrolled == isScrolled)&&(identical(other.activeRoute, activeRoute) || other.activeRoute == activeRoute));
}


@override
int get hashCode => Object.hash(runtimeType,isScrolled,activeRoute);

@override
String toString() {
  return 'NavigationHubState(isScrolled: $isScrolled, activeRoute: $activeRoute)';
}


}

/// @nodoc
abstract mixin class $NavigationHubStateCopyWith<$Res>  {
  factory $NavigationHubStateCopyWith(NavigationHubState value, $Res Function(NavigationHubState) _then) = _$NavigationHubStateCopyWithImpl;
@useResult
$Res call({
 bool isScrolled, String? activeRoute
});




}
/// @nodoc
class _$NavigationHubStateCopyWithImpl<$Res>
    implements $NavigationHubStateCopyWith<$Res> {
  _$NavigationHubStateCopyWithImpl(this._self, this._then);

  final NavigationHubState _self;
  final $Res Function(NavigationHubState) _then;

/// Create a copy of NavigationHubState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isScrolled = null,Object? activeRoute = freezed,}) {
  return _then(_self.copyWith(
isScrolled: null == isScrolled ? _self.isScrolled : isScrolled // ignore: cast_nullable_to_non_nullable
as bool,activeRoute: freezed == activeRoute ? _self.activeRoute : activeRoute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationHubState].
extension NavigationHubStatePatterns on NavigationHubState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationHubState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationHubState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationHubState value)  $default,){
final _that = this;
switch (_that) {
case _NavigationHubState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationHubState value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationHubState() when $default != null:
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
case _NavigationHubState() when $default != null:
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
case _NavigationHubState():
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
case _NavigationHubState() when $default != null:
return $default(_that.isScrolled,_that.activeRoute);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationHubState implements NavigationHubState {
  const _NavigationHubState({this.isScrolled = false, this.activeRoute});
  

@override@JsonKey() final  bool isScrolled;
@override final  String? activeRoute;

/// Create a copy of NavigationHubState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationHubStateCopyWith<_NavigationHubState> get copyWith => __$NavigationHubStateCopyWithImpl<_NavigationHubState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationHubState&&(identical(other.isScrolled, isScrolled) || other.isScrolled == isScrolled)&&(identical(other.activeRoute, activeRoute) || other.activeRoute == activeRoute));
}


@override
int get hashCode => Object.hash(runtimeType,isScrolled,activeRoute);

@override
String toString() {
  return 'NavigationHubState(isScrolled: $isScrolled, activeRoute: $activeRoute)';
}


}

/// @nodoc
abstract mixin class _$NavigationHubStateCopyWith<$Res> implements $NavigationHubStateCopyWith<$Res> {
  factory _$NavigationHubStateCopyWith(_NavigationHubState value, $Res Function(_NavigationHubState) _then) = __$NavigationHubStateCopyWithImpl;
@override @useResult
$Res call({
 bool isScrolled, String? activeRoute
});




}
/// @nodoc
class __$NavigationHubStateCopyWithImpl<$Res>
    implements _$NavigationHubStateCopyWith<$Res> {
  __$NavigationHubStateCopyWithImpl(this._self, this._then);

  final _NavigationHubState _self;
  final $Res Function(_NavigationHubState) _then;

/// Create a copy of NavigationHubState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isScrolled = null,Object? activeRoute = freezed,}) {
  return _then(_NavigationHubState(
isScrolled: null == isScrolled ? _self.isScrolled : isScrolled // ignore: cast_nullable_to_non_nullable
as bool,activeRoute: freezed == activeRoute ? _self.activeRoute : activeRoute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
