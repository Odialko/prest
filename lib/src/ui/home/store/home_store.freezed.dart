// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PropertiesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertiesState()';
}


}

/// @nodoc
class $PropertiesStateCopyWith<$Res>  {
$PropertiesStateCopyWith(PropertiesState _, $Res Function(PropertiesState) __);
}


/// Adds pattern-matching-related methods to [PropertiesState].
extension PropertiesStatePatterns on PropertiesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PropertiesStateInit value)?  init,TResult Function( PropertiesStateLoading value)?  loading,TResult Function( PropertiesStateError value)?  error,TResult Function( PropertiesStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PropertiesStateInit() when init != null:
return init(_that);case PropertiesStateLoading() when loading != null:
return loading(_that);case PropertiesStateError() when error != null:
return error(_that);case PropertiesStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PropertiesStateInit value)  init,required TResult Function( PropertiesStateLoading value)  loading,required TResult Function( PropertiesStateError value)  error,required TResult Function( PropertiesStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case PropertiesStateInit():
return init(_that);case PropertiesStateLoading():
return loading(_that);case PropertiesStateError():
return error(_that);case PropertiesStateLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PropertiesStateInit value)?  init,TResult? Function( PropertiesStateLoading value)?  loading,TResult? Function( PropertiesStateError value)?  error,TResult? Function( PropertiesStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case PropertiesStateInit() when init != null:
return init(_that);case PropertiesStateLoading() when loading != null:
return loading(_that);case PropertiesStateError() when error != null:
return error(_that);case PropertiesStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function( String? message)?  error,TResult Function( List<Property> items)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PropertiesStateInit() when init != null:
return init();case PropertiesStateLoading() when loading != null:
return loading();case PropertiesStateError() when error != null:
return error(_that.message);case PropertiesStateLoaded() when loaded != null:
return loaded(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function( String? message)  error,required TResult Function( List<Property> items)  loaded,}) {final _that = this;
switch (_that) {
case PropertiesStateInit():
return init();case PropertiesStateLoading():
return loading();case PropertiesStateError():
return error(_that.message);case PropertiesStateLoaded():
return loaded(_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function( String? message)?  error,TResult? Function( List<Property> items)?  loaded,}) {final _that = this;
switch (_that) {
case PropertiesStateInit() when init != null:
return init();case PropertiesStateLoading() when loading != null:
return loading();case PropertiesStateError() when error != null:
return error(_that.message);case PropertiesStateLoaded() when loaded != null:
return loaded(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class PropertiesStateInit implements PropertiesState {
  const PropertiesStateInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesStateInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertiesState.init()';
}


}




/// @nodoc


class PropertiesStateLoading implements PropertiesState {
  const PropertiesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PropertiesState.loading()';
}


}




/// @nodoc


class PropertiesStateError implements PropertiesState {
  const PropertiesStateError({this.message});
  

 final  String? message;

/// Create a copy of PropertiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertiesStateErrorCopyWith<PropertiesStateError> get copyWith => _$PropertiesStateErrorCopyWithImpl<PropertiesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PropertiesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PropertiesStateErrorCopyWith<$Res> implements $PropertiesStateCopyWith<$Res> {
  factory $PropertiesStateErrorCopyWith(PropertiesStateError value, $Res Function(PropertiesStateError) _then) = _$PropertiesStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$PropertiesStateErrorCopyWithImpl<$Res>
    implements $PropertiesStateErrorCopyWith<$Res> {
  _$PropertiesStateErrorCopyWithImpl(this._self, this._then);

  final PropertiesStateError _self;
  final $Res Function(PropertiesStateError) _then;

/// Create a copy of PropertiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(PropertiesStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PropertiesStateLoaded implements PropertiesState {
  const PropertiesStateLoaded({final  List<Property> items = const []}): _items = items;
  

 final  List<Property> _items;
@JsonKey() List<Property> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PropertiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertiesStateLoadedCopyWith<PropertiesStateLoaded> get copyWith => _$PropertiesStateLoadedCopyWithImpl<PropertiesStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesStateLoaded&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PropertiesState.loaded(items: $items)';
}


}

/// @nodoc
abstract mixin class $PropertiesStateLoadedCopyWith<$Res> implements $PropertiesStateCopyWith<$Res> {
  factory $PropertiesStateLoadedCopyWith(PropertiesStateLoaded value, $Res Function(PropertiesStateLoaded) _then) = _$PropertiesStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Property> items
});




}
/// @nodoc
class _$PropertiesStateLoadedCopyWithImpl<$Res>
    implements $PropertiesStateLoadedCopyWith<$Res> {
  _$PropertiesStateLoadedCopyWithImpl(this._self, this._then);

  final PropertiesStateLoaded _self;
  final $Res Function(PropertiesStateLoaded) _then;

/// Create a copy of PropertiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(PropertiesStateLoaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Property>,
  ));
}


}

/// @nodoc
mixin _$HomeStoreState {

// Стан завантаження з CRM
 PropertiesState get propertiesState;// Навігація
 PageController get pageController; bool get isScrolled; int get currentPage;
/// Create a copy of HomeStoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStoreStateCopyWith<HomeStoreState> get copyWith => _$HomeStoreStateCopyWithImpl<HomeStoreState>(this as HomeStoreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStoreState&&(identical(other.propertiesState, propertiesState) || other.propertiesState == propertiesState)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.isScrolled, isScrolled) || other.isScrolled == isScrolled)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,propertiesState,pageController,isScrolled,currentPage);

@override
String toString() {
  return 'HomeStoreState(propertiesState: $propertiesState, pageController: $pageController, isScrolled: $isScrolled, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $HomeStoreStateCopyWith<$Res>  {
  factory $HomeStoreStateCopyWith(HomeStoreState value, $Res Function(HomeStoreState) _then) = _$HomeStoreStateCopyWithImpl;
@useResult
$Res call({
 PropertiesState propertiesState, PageController pageController, bool isScrolled, int currentPage
});


$PropertiesStateCopyWith<$Res> get propertiesState;

}
/// @nodoc
class _$HomeStoreStateCopyWithImpl<$Res>
    implements $HomeStoreStateCopyWith<$Res> {
  _$HomeStoreStateCopyWithImpl(this._self, this._then);

  final HomeStoreState _self;
  final $Res Function(HomeStoreState) _then;

/// Create a copy of HomeStoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propertiesState = null,Object? pageController = null,Object? isScrolled = null,Object? currentPage = null,}) {
  return _then(_self.copyWith(
propertiesState: null == propertiesState ? _self.propertiesState : propertiesState // ignore: cast_nullable_to_non_nullable
as PropertiesState,pageController: null == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController,isScrolled: null == isScrolled ? _self.isScrolled : isScrolled // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HomeStoreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertiesStateCopyWith<$Res> get propertiesState {
  
  return $PropertiesStateCopyWith<$Res>(_self.propertiesState, (value) {
    return _then(_self.copyWith(propertiesState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeStoreState].
extension HomeStoreStatePatterns on HomeStoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeStoreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeStoreState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeStoreState value)  $default,){
final _that = this;
switch (_that) {
case _HomeStoreState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeStoreState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeStoreState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PropertiesState propertiesState,  PageController pageController,  bool isScrolled,  int currentPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeStoreState() when $default != null:
return $default(_that.propertiesState,_that.pageController,_that.isScrolled,_that.currentPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PropertiesState propertiesState,  PageController pageController,  bool isScrolled,  int currentPage)  $default,) {final _that = this;
switch (_that) {
case _HomeStoreState():
return $default(_that.propertiesState,_that.pageController,_that.isScrolled,_that.currentPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PropertiesState propertiesState,  PageController pageController,  bool isScrolled,  int currentPage)?  $default,) {final _that = this;
switch (_that) {
case _HomeStoreState() when $default != null:
return $default(_that.propertiesState,_that.pageController,_that.isScrolled,_that.currentPage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeStoreState implements HomeStoreState {
  const _HomeStoreState({required this.propertiesState, required this.pageController, this.isScrolled = false, this.currentPage = 0});
  

// Стан завантаження з CRM
@override final  PropertiesState propertiesState;
// Навігація
@override final  PageController pageController;
@override@JsonKey() final  bool isScrolled;
@override@JsonKey() final  int currentPage;

/// Create a copy of HomeStoreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStoreStateCopyWith<_HomeStoreState> get copyWith => __$HomeStoreStateCopyWithImpl<_HomeStoreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeStoreState&&(identical(other.propertiesState, propertiesState) || other.propertiesState == propertiesState)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.isScrolled, isScrolled) || other.isScrolled == isScrolled)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,propertiesState,pageController,isScrolled,currentPage);

@override
String toString() {
  return 'HomeStoreState(propertiesState: $propertiesState, pageController: $pageController, isScrolled: $isScrolled, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$HomeStoreStateCopyWith<$Res> implements $HomeStoreStateCopyWith<$Res> {
  factory _$HomeStoreStateCopyWith(_HomeStoreState value, $Res Function(_HomeStoreState) _then) = __$HomeStoreStateCopyWithImpl;
@override @useResult
$Res call({
 PropertiesState propertiesState, PageController pageController, bool isScrolled, int currentPage
});


@override $PropertiesStateCopyWith<$Res> get propertiesState;

}
/// @nodoc
class __$HomeStoreStateCopyWithImpl<$Res>
    implements _$HomeStoreStateCopyWith<$Res> {
  __$HomeStoreStateCopyWithImpl(this._self, this._then);

  final _HomeStoreState _self;
  final $Res Function(_HomeStoreState) _then;

/// Create a copy of HomeStoreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propertiesState = null,Object? pageController = null,Object? isScrolled = null,Object? currentPage = null,}) {
  return _then(_HomeStoreState(
propertiesState: null == propertiesState ? _self.propertiesState : propertiesState // ignore: cast_nullable_to_non_nullable
as PropertiesState,pageController: null == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController,isScrolled: null == isScrolled ? _self.isScrolled : isScrolled // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeStoreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertiesStateCopyWith<$Res> get propertiesState {
  
  return $PropertiesStateCopyWith<$Res>(_self.propertiesState, (value) {
    return _then(_self.copyWith(propertiesState: value));
  });
}
}

// dart format on
