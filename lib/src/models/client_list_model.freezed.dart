// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientListModel {

 bool get result; String? get message; List<ClientModel> get clients;
/// Create a copy of ClientListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientListModelCopyWith<ClientListModel> get copyWith => _$ClientListModelCopyWithImpl<ClientListModel>(this as ClientListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientListModel&&(identical(other.result, result) || other.result == result)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.clients, clients));
}


@override
int get hashCode => Object.hash(runtimeType,result,message,const DeepCollectionEquality().hash(clients));

@override
String toString() {
  return 'ClientListModel(result: $result, message: $message, clients: $clients)';
}


}

/// @nodoc
abstract mixin class $ClientListModelCopyWith<$Res>  {
  factory $ClientListModelCopyWith(ClientListModel value, $Res Function(ClientListModel) _then) = _$ClientListModelCopyWithImpl;
@useResult
$Res call({
 bool result, String? message, List<ClientModel> clients
});




}
/// @nodoc
class _$ClientListModelCopyWithImpl<$Res>
    implements $ClientListModelCopyWith<$Res> {
  _$ClientListModelCopyWithImpl(this._self, this._then);

  final ClientListModel _self;
  final $Res Function(ClientListModel) _then;

/// Create a copy of ClientListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? message = freezed,Object? clients = null,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<ClientModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientListModel].
extension ClientListModelPatterns on ClientListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientListModel value)  $default,){
final _that = this;
switch (_that) {
case _ClientListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClientListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool result,  String? message,  List<ClientModel> clients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientListModel() when $default != null:
return $default(_that.result,_that.message,_that.clients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool result,  String? message,  List<ClientModel> clients)  $default,) {final _that = this;
switch (_that) {
case _ClientListModel():
return $default(_that.result,_that.message,_that.clients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool result,  String? message,  List<ClientModel> clients)?  $default,) {final _that = this;
switch (_that) {
case _ClientListModel() when $default != null:
return $default(_that.result,_that.message,_that.clients);case _:
  return null;

}
}

}

/// @nodoc


class _ClientListModel implements ClientListModel {
  const _ClientListModel({required this.result, this.message, final  List<ClientModel> clients = const []}): _clients = clients;
  

@override final  bool result;
@override final  String? message;
 final  List<ClientModel> _clients;
@override@JsonKey() List<ClientModel> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}


/// Create a copy of ClientListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientListModelCopyWith<_ClientListModel> get copyWith => __$ClientListModelCopyWithImpl<_ClientListModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientListModel&&(identical(other.result, result) || other.result == result)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._clients, _clients));
}


@override
int get hashCode => Object.hash(runtimeType,result,message,const DeepCollectionEquality().hash(_clients));

@override
String toString() {
  return 'ClientListModel(result: $result, message: $message, clients: $clients)';
}


}

/// @nodoc
abstract mixin class _$ClientListModelCopyWith<$Res> implements $ClientListModelCopyWith<$Res> {
  factory _$ClientListModelCopyWith(_ClientListModel value, $Res Function(_ClientListModel) _then) = __$ClientListModelCopyWithImpl;
@override @useResult
$Res call({
 bool result, String? message, List<ClientModel> clients
});




}
/// @nodoc
class __$ClientListModelCopyWithImpl<$Res>
    implements _$ClientListModelCopyWith<$Res> {
  __$ClientListModelCopyWithImpl(this._self, this._then);

  final _ClientListModel _self;
  final $Res Function(_ClientListModel) _then;

/// Create a copy of ClientListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? message = freezed,Object? clients = null,}) {
  return _then(_ClientListModel(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,clients: null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<ClientModel>,
  ));
}


}

// dart format on
