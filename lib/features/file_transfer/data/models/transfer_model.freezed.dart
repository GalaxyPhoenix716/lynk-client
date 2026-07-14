// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferModel {

@JsonKey(name: 'transfer_id') String get id; TransferStatus get status;@JsonKey(name: 'total_files') int get totalFiles;@JsonKey(name: 'total_size') int get totalSize;@JsonKey(name: 'expires_in') int? get expiresMultiplier; List<FileItemModel> get files;
/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferModelCopyWith<TransferModel> get copyWith => _$TransferModelCopyWithImpl<TransferModel>(this as TransferModel, _$identity);

  /// Serializes this TransferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalFiles, totalFiles) || other.totalFiles == totalFiles)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.expiresMultiplier, expiresMultiplier) || other.expiresMultiplier == expiresMultiplier)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,totalFiles,totalSize,expiresMultiplier,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'TransferModel(id: $id, status: $status, totalFiles: $totalFiles, totalSize: $totalSize, expiresMultiplier: $expiresMultiplier, files: $files)';
}


}

/// @nodoc
abstract mixin class $TransferModelCopyWith<$Res>  {
  factory $TransferModelCopyWith(TransferModel value, $Res Function(TransferModel) _then) = _$TransferModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'transfer_id') String id, TransferStatus status,@JsonKey(name: 'total_files') int totalFiles,@JsonKey(name: 'total_size') int totalSize,@JsonKey(name: 'expires_in') int? expiresMultiplier, List<FileItemModel> files
});




}
/// @nodoc
class _$TransferModelCopyWithImpl<$Res>
    implements $TransferModelCopyWith<$Res> {
  _$TransferModelCopyWithImpl(this._self, this._then);

  final TransferModel _self;
  final $Res Function(TransferModel) _then;

/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? totalFiles = null,Object? totalSize = null,Object? expiresMultiplier = freezed,Object? files = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferStatus,totalFiles: null == totalFiles ? _self.totalFiles : totalFiles // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,expiresMultiplier: freezed == expiresMultiplier ? _self.expiresMultiplier : expiresMultiplier // ignore: cast_nullable_to_non_nullable
as int?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferModel].
extension TransferModelPatterns on TransferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'transfer_id')  String id,  TransferStatus status, @JsonKey(name: 'total_files')  int totalFiles, @JsonKey(name: 'total_size')  int totalSize, @JsonKey(name: 'expires_in')  int? expiresMultiplier,  List<FileItemModel> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'transfer_id')  String id,  TransferStatus status, @JsonKey(name: 'total_files')  int totalFiles, @JsonKey(name: 'total_size')  int totalSize, @JsonKey(name: 'expires_in')  int? expiresMultiplier,  List<FileItemModel> files)  $default,) {final _that = this;
switch (_that) {
case _TransferModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'transfer_id')  String id,  TransferStatus status, @JsonKey(name: 'total_files')  int totalFiles, @JsonKey(name: 'total_size')  int totalSize, @JsonKey(name: 'expires_in')  int? expiresMultiplier,  List<FileItemModel> files)?  $default,) {final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
return $default(_that.id,_that.status,_that.totalFiles,_that.totalSize,_that.expiresMultiplier,_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferModel implements TransferModel {
  const _TransferModel({@JsonKey(name: 'transfer_id') required this.id, required this.status, @JsonKey(name: 'total_files') required this.totalFiles, @JsonKey(name: 'total_size') required this.totalSize, @JsonKey(name: 'expires_in') this.expiresMultiplier, required final  List<FileItemModel> files}): _files = files;
  factory _TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);

@override@JsonKey(name: 'transfer_id') final  String id;
@override final  TransferStatus status;
@override@JsonKey(name: 'total_files') final  int totalFiles;
@override@JsonKey(name: 'total_size') final  int totalSize;
@override@JsonKey(name: 'expires_in') final  int? expiresMultiplier;
 final  List<FileItemModel> _files;
@override List<FileItemModel> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferModelCopyWith<_TransferModel> get copyWith => __$TransferModelCopyWithImpl<_TransferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalFiles, totalFiles) || other.totalFiles == totalFiles)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.expiresMultiplier, expiresMultiplier) || other.expiresMultiplier == expiresMultiplier)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,totalFiles,totalSize,expiresMultiplier,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'TransferModel(id: $id, status: $status, totalFiles: $totalFiles, totalSize: $totalSize, expiresMultiplier: $expiresMultiplier, files: $files)';
}


}

/// @nodoc
abstract mixin class _$TransferModelCopyWith<$Res> implements $TransferModelCopyWith<$Res> {
  factory _$TransferModelCopyWith(_TransferModel value, $Res Function(_TransferModel) _then) = __$TransferModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'transfer_id') String id, TransferStatus status,@JsonKey(name: 'total_files') int totalFiles,@JsonKey(name: 'total_size') int totalSize,@JsonKey(name: 'expires_in') int? expiresMultiplier, List<FileItemModel> files
});




}
/// @nodoc
class __$TransferModelCopyWithImpl<$Res>
    implements _$TransferModelCopyWith<$Res> {
  __$TransferModelCopyWithImpl(this._self, this._then);

  final _TransferModel _self;
  final $Res Function(_TransferModel) _then;

/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? totalFiles = null,Object? totalSize = null,Object? expiresMultiplier = freezed,Object? files = null,}) {
  return _then(_TransferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferStatus,totalFiles: null == totalFiles ? _self.totalFiles : totalFiles // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,expiresMultiplier: freezed == expiresMultiplier ? _self.expiresMultiplier : expiresMultiplier // ignore: cast_nullable_to_non_nullable
as int?,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileItemModel>,
  ));
}


}

// dart format on
