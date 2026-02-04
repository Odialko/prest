// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamState()';
}


}

/// @nodoc
class $TeamStateCopyWith<$Res>  {
$TeamStateCopyWith(TeamState _, $Res Function(TeamState) __);
}


/// Adds pattern-matching-related methods to [TeamState].
extension TeamStatePatterns on TeamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TeamStateLoading value)?  loading,TResult Function( TeamStateError value)?  error,TResult Function( TeamStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TeamStateLoading() when loading != null:
return loading(_that);case TeamStateError() when error != null:
return error(_that);case TeamStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TeamStateLoading value)  loading,required TResult Function( TeamStateError value)  error,required TResult Function( TeamStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case TeamStateLoading():
return loading(_that);case TeamStateError():
return error(_that);case TeamStateLoaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TeamStateLoading value)?  loading,TResult? Function( TeamStateError value)?  error,TResult? Function( TeamStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case TeamStateLoading() when loading != null:
return loading(_that);case TeamStateError() when error != null:
return error(_that);case TeamStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? message)?  error,TResult Function( List<TeamMember> members)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TeamStateLoading() when loading != null:
return loading();case TeamStateError() when error != null:
return error(_that.message);case TeamStateLoaded() when loaded != null:
return loaded(_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? message)  error,required TResult Function( List<TeamMember> members)  loaded,}) {final _that = this;
switch (_that) {
case TeamStateLoading():
return loading();case TeamStateError():
return error(_that.message);case TeamStateLoaded():
return loaded(_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? message)?  error,TResult? Function( List<TeamMember> members)?  loaded,}) {final _that = this;
switch (_that) {
case TeamStateLoading() when loading != null:
return loading();case TeamStateError() when error != null:
return error(_that.message);case TeamStateLoaded() when loaded != null:
return loaded(_that.members);case _:
  return null;

}
}

}

/// @nodoc


class TeamStateLoading implements TeamState {
  const TeamStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamState.loading()';
}


}




/// @nodoc


class TeamStateError implements TeamState {
  const TeamStateError({this.message});
  

 final  String? message;

/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamStateErrorCopyWith<TeamStateError> get copyWith => _$TeamStateErrorCopyWithImpl<TeamStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TeamState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TeamStateErrorCopyWith<$Res> implements $TeamStateCopyWith<$Res> {
  factory $TeamStateErrorCopyWith(TeamStateError value, $Res Function(TeamStateError) _then) = _$TeamStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$TeamStateErrorCopyWithImpl<$Res>
    implements $TeamStateErrorCopyWith<$Res> {
  _$TeamStateErrorCopyWithImpl(this._self, this._then);

  final TeamStateError _self;
  final $Res Function(TeamStateError) _then;

/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(TeamStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TeamStateLoaded implements TeamState {
  const TeamStateLoaded({final  List<TeamMember> members = const []}): _members = members;
  

 final  List<TeamMember> _members;
@JsonKey() List<TeamMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamStateLoadedCopyWith<TeamStateLoaded> get copyWith => _$TeamStateLoadedCopyWithImpl<TeamStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamStateLoaded&&const DeepCollectionEquality().equals(other._members, _members));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'TeamState.loaded(members: $members)';
}


}

/// @nodoc
abstract mixin class $TeamStateLoadedCopyWith<$Res> implements $TeamStateCopyWith<$Res> {
  factory $TeamStateLoadedCopyWith(TeamStateLoaded value, $Res Function(TeamStateLoaded) _then) = _$TeamStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<TeamMember> members
});




}
/// @nodoc
class _$TeamStateLoadedCopyWithImpl<$Res>
    implements $TeamStateLoadedCopyWith<$Res> {
  _$TeamStateLoadedCopyWithImpl(this._self, this._then);

  final TeamStateLoaded _self;
  final $Res Function(TeamStateLoaded) _then;

/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? members = null,}) {
  return _then(TeamStateLoaded(
members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<TeamMember>,
  ));
}


}

// dart format on
