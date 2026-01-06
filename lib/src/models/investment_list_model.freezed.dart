// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvestmentListModel {

 bool get success; int get count; List<InvestmentModel> get investments;
/// Create a copy of InvestmentListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestmentListModelCopyWith<InvestmentListModel> get copyWith => _$InvestmentListModelCopyWithImpl<InvestmentListModel>(this as InvestmentListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestmentListModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.investments, investments));
}


@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(investments));

@override
String toString() {
  return 'InvestmentListModel(success: $success, count: $count, investments: $investments)';
}


}

/// @nodoc
abstract mixin class $InvestmentListModelCopyWith<$Res>  {
  factory $InvestmentListModelCopyWith(InvestmentListModel value, $Res Function(InvestmentListModel) _then) = _$InvestmentListModelCopyWithImpl;
@useResult
$Res call({
 bool success, int count, List<InvestmentModel> investments
});




}
/// @nodoc
class _$InvestmentListModelCopyWithImpl<$Res>
    implements $InvestmentListModelCopyWith<$Res> {
  _$InvestmentListModelCopyWithImpl(this._self, this._then);

  final InvestmentListModel _self;
  final $Res Function(InvestmentListModel) _then;

/// Create a copy of InvestmentListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? investments = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,investments: null == investments ? _self.investments : investments // ignore: cast_nullable_to_non_nullable
as List<InvestmentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [InvestmentListModel].
extension InvestmentListModelPatterns on InvestmentListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvestmentListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvestmentListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvestmentListModel value)  $default,){
final _that = this;
switch (_that) {
case _InvestmentListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvestmentListModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvestmentListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int count,  List<InvestmentModel> investments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvestmentListModel() when $default != null:
return $default(_that.success,_that.count,_that.investments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int count,  List<InvestmentModel> investments)  $default,) {final _that = this;
switch (_that) {
case _InvestmentListModel():
return $default(_that.success,_that.count,_that.investments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int count,  List<InvestmentModel> investments)?  $default,) {final _that = this;
switch (_that) {
case _InvestmentListModel() when $default != null:
return $default(_that.success,_that.count,_that.investments);case _:
  return null;

}
}

}

/// @nodoc


class _InvestmentListModel implements InvestmentListModel {
  const _InvestmentListModel({required this.success, required this.count, required final  List<InvestmentModel> investments}): _investments = investments;
  

@override final  bool success;
@override final  int count;
 final  List<InvestmentModel> _investments;
@override List<InvestmentModel> get investments {
  if (_investments is EqualUnmodifiableListView) return _investments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_investments);
}


/// Create a copy of InvestmentListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvestmentListModelCopyWith<_InvestmentListModel> get copyWith => __$InvestmentListModelCopyWithImpl<_InvestmentListModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvestmentListModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._investments, _investments));
}


@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(_investments));

@override
String toString() {
  return 'InvestmentListModel(success: $success, count: $count, investments: $investments)';
}


}

/// @nodoc
abstract mixin class _$InvestmentListModelCopyWith<$Res> implements $InvestmentListModelCopyWith<$Res> {
  factory _$InvestmentListModelCopyWith(_InvestmentListModel value, $Res Function(_InvestmentListModel) _then) = __$InvestmentListModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, int count, List<InvestmentModel> investments
});




}
/// @nodoc
class __$InvestmentListModelCopyWithImpl<$Res>
    implements _$InvestmentListModelCopyWith<$Res> {
  __$InvestmentListModelCopyWithImpl(this._self, this._then);

  final _InvestmentListModel _self;
  final $Res Function(_InvestmentListModel) _then;

/// Create a copy of InvestmentListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? investments = null,}) {
  return _then(_InvestmentListModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,investments: null == investments ? _self._investments : investments // ignore: cast_nullable_to_non_nullable
as List<InvestmentModel>,
  ));
}


}

// dart format on
