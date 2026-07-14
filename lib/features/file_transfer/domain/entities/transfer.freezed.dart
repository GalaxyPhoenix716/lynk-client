// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transfer {

 String get id; TransferStatus get status; int get totalFiles; int get totalSize; int? get expiresMultiplier; List<FileItem> get files;
/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferCopyWith<Transfer> get copyWith => _$TransferCopyWithImpl<Transfer>(this as Transfer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transfer&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalFiles, totalFiles) || other.totalFiles == totalFiles)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.expiresMultiplier, expiresMultiplier) || other.expiresMultiplier == expiresMultiplier)&&const DeepCollectionEquality().equals(other.files, files));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,totalFiles,totalSize,expiresMultiplier,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'Transfer(id: $id, status: $status, totalFiles: $totalFiles, totalSize: $totalSize, expiresMultiplier: $expiresMultiplier, files: $files)';
}


}

/// @nodoc
abstract mixin class $TransferCopyWith<$Res>  {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) _then) = _$TransferCopyWithImpl;
@useResult
$Res call({
 String id, TransferStatus status, int totalFiles, int totalSize, int? expiresMultiplier, List<FileItem> files
});




}
/// @nodoc
class _$TransferCopyWithImpl<$Res>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._self, this._then);

  final Transfer _self;
  final $Res Function(Transfer) _then;

/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? totalFiles = null,Object? totalSize = null,Object? expiresMultiplier = freezed,Object? files = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferStatus,totalFiles: null == totalFiles ? _self.totalFiles : totalFiles // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,expiresMultiplier: freezed == expiresMultiplier ? _self.expiresMultiplier : expiresMultiplier // ignore: cast_nullable_to_non_nullable
as int?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [Transfer].
extension TransferPatterns on Transfer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transfer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transfer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transfer value)  $default,){
final _that = this;
switch (_that) {
case _Transfer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transfer value)?  $default,){
final _that = this;
switch (_that) {
case _Transfer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TransferStatus status,  int totalFiles,  int totalSize,  int? expiresMultiplier,  List<FileItem> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transfer() when $default != null:
return $default(_that.id,_that.status,_that.totalFiles,_that.totalSize,_that.expiresMultiplier,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TransferStatus status,  int totalFiles,  int totalSize,  int? expiresMultiplier,  List<FileItem> files)  $default,) {final _that = this;
switch (_that) {
case _Transfer():
return $default(_that.id,_that.status,_that.totalFiles,_that.totalSize,_that.expiresMultiplier,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TransferStatus status,  int totalFiles,  int totalSize,  int? expiresMultiplier,  List<FileItem> files)?  $default,) {final _that = this;
switch (_that) {
case _Transfer() when $default != null:
return $default(_that.id,_that.status,_that.totalFiles,_that.totalSize,_that.expiresMultiplier,_that.files);case _:
  return null;

}
}

}

/// @nodoc


class _Transfer implements Transfer {
  const _Transfer({required this.id, required this.status, required this.totalFiles, required this.totalSize, this.expiresMultiplier, required final  List<FileItem> files}): _files = files;
  

@override final  String id;
@override final  TransferStatus status;
@override final  int totalFiles;
@override final  int totalSize;
@override final  int? expiresMultiplier;
 final  List<FileItem> _files;
@override List<FileItem> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferCopyWith<_Transfer> get copyWith => __$TransferCopyWithImpl<_Transfer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transfer&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalFiles, totalFiles) || other.totalFiles == totalFiles)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.expiresMultiplier, expiresMultiplier) || other.expiresMultiplier == expiresMultiplier)&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,totalFiles,totalSize,expiresMultiplier,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'Transfer(id: $id, status: $status, totalFiles: $totalFiles, totalSize: $totalSize, expiresMultiplier: $expiresMultiplier, files: $files)';
}


}

/// @nodoc
abstract mixin class _$TransferCopyWith<$Res> implements $TransferCopyWith<$Res> {
  factory _$TransferCopyWith(_Transfer value, $Res Function(_Transfer) _then) = __$TransferCopyWithImpl;
@override @useResult
$Res call({
 String id, TransferStatus status, int totalFiles, int totalSize, int? expiresMultiplier, List<FileItem> files
});




}
/// @nodoc
class __$TransferCopyWithImpl<$Res>
    implements _$TransferCopyWith<$Res> {
  __$TransferCopyWithImpl(this._self, this._then);

  final _Transfer _self;
  final $Res Function(_Transfer) _then;

/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? totalFiles = null,Object? totalSize = null,Object? expiresMultiplier = freezed,Object? files = null,}) {
  return _then(_Transfer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferStatus,totalFiles: null == totalFiles ? _self.totalFiles : totalFiles // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,expiresMultiplier: freezed == expiresMultiplier ? _self.expiresMultiplier : expiresMultiplier // ignore: cast_nullable_to_non_nullable
as int?,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileItem>,
  ));
}


}

// dart format on
