// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receiver_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReceiverSession {

 String get id; ReceiverSessionStatus get status; String? get transferId; int? get expiresMultiplier;
/// Create a copy of ReceiverSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiverSessionCopyWith<ReceiverSession> get copyWith => _$ReceiverSessionCopyWithImpl<ReceiverSession>(this as ReceiverSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiverSession&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.transferId, transferId) || other.transferId == transferId)&&(identical(other.expiresMultiplier, expiresMultiplier) || other.expiresMultiplier == expiresMultiplier));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,transferId,expiresMultiplier);

@override
String toString() {
  return 'ReceiverSession(id: $id, status: $status, transferId: $transferId, expiresMultiplier: $expiresMultiplier)';
}


}

/// @nodoc
abstract mixin class $ReceiverSessionCopyWith<$Res>  {
  factory $ReceiverSessionCopyWith(ReceiverSession value, $Res Function(ReceiverSession) _then) = _$ReceiverSessionCopyWithImpl;
@useResult
$Res call({
 String id, ReceiverSessionStatus status, String? transferId, int? expiresMultiplier
});




}
/// @nodoc
class _$ReceiverSessionCopyWithImpl<$Res>
    implements $ReceiverSessionCopyWith<$Res> {
  _$ReceiverSessionCopyWithImpl(this._self, this._then);

  final ReceiverSession _self;
  final $Res Function(ReceiverSession) _then;

/// Create a copy of ReceiverSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? transferId = freezed,Object? expiresMultiplier = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReceiverSessionStatus,transferId: freezed == transferId ? _self.transferId : transferId // ignore: cast_nullable_to_non_nullable
as String?,expiresMultiplier: freezed == expiresMultiplier ? _self.expiresMultiplier : expiresMultiplier // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiverSession].
extension ReceiverSessionPatterns on ReceiverSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiverSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiverSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiverSession value)  $default,){
final _that = this;
switch (_that) {
case _ReceiverSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiverSession value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiverSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReceiverSessionStatus status,  String? transferId,  int? expiresMultiplier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiverSession() when $default != null:
return $default(_that.id,_that.status,_that.transferId,_that.expiresMultiplier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReceiverSessionStatus status,  String? transferId,  int? expiresMultiplier)  $default,) {final _that = this;
switch (_that) {
case _ReceiverSession():
return $default(_that.id,_that.status,_that.transferId,_that.expiresMultiplier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReceiverSessionStatus status,  String? transferId,  int? expiresMultiplier)?  $default,) {final _that = this;
switch (_that) {
case _ReceiverSession() when $default != null:
return $default(_that.id,_that.status,_that.transferId,_that.expiresMultiplier);case _:
  return null;

}
}

}

/// @nodoc


class _ReceiverSession implements ReceiverSession {
  const _ReceiverSession({required this.id, required this.status, this.transferId, this.expiresMultiplier});
  

@override final  String id;
@override final  ReceiverSessionStatus status;
@override final  String? transferId;
@override final  int? expiresMultiplier;

/// Create a copy of ReceiverSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiverSessionCopyWith<_ReceiverSession> get copyWith => __$ReceiverSessionCopyWithImpl<_ReceiverSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiverSession&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.transferId, transferId) || other.transferId == transferId)&&(identical(other.expiresMultiplier, expiresMultiplier) || other.expiresMultiplier == expiresMultiplier));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,transferId,expiresMultiplier);

@override
String toString() {
  return 'ReceiverSession(id: $id, status: $status, transferId: $transferId, expiresMultiplier: $expiresMultiplier)';
}


}

/// @nodoc
abstract mixin class _$ReceiverSessionCopyWith<$Res> implements $ReceiverSessionCopyWith<$Res> {
  factory _$ReceiverSessionCopyWith(_ReceiverSession value, $Res Function(_ReceiverSession) _then) = __$ReceiverSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, ReceiverSessionStatus status, String? transferId, int? expiresMultiplier
});




}
/// @nodoc
class __$ReceiverSessionCopyWithImpl<$Res>
    implements _$ReceiverSessionCopyWith<$Res> {
  __$ReceiverSessionCopyWithImpl(this._self, this._then);

  final _ReceiverSession _self;
  final $Res Function(_ReceiverSession) _then;

/// Create a copy of ReceiverSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? transferId = freezed,Object? expiresMultiplier = freezed,}) {
  return _then(_ReceiverSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReceiverSessionStatus,transferId: freezed == transferId ? _self.transferId : transferId // ignore: cast_nullable_to_non_nullable
as String?,expiresMultiplier: freezed == expiresMultiplier ? _self.expiresMultiplier : expiresMultiplier // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
