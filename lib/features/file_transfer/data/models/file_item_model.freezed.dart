// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileItemModel {

@JsonKey(name: 'file_id') String get id;@JsonKey(name: 'file_name') String get name;@JsonKey(name: 'file_size') int get size;@JsonKey(name: 'content_type') String get contentType; FileStatus get status;@JsonKey(name: 'upload_url') String? get uploadUrl;@JsonKey(name: 'download_url') String? get downloadUrl;
/// Create a copy of FileItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileItemModelCopyWith<FileItemModel> get copyWith => _$FileItemModelCopyWithImpl<FileItemModel>(this as FileItemModel, _$identity);

  /// Serializes this FileItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,size,contentType,status,uploadUrl,downloadUrl);

@override
String toString() {
  return 'FileItemModel(id: $id, name: $name, size: $size, contentType: $contentType, status: $status, uploadUrl: $uploadUrl, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $FileItemModelCopyWith<$Res>  {
  factory $FileItemModelCopyWith(FileItemModel value, $Res Function(FileItemModel) _then) = _$FileItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'file_id') String id,@JsonKey(name: 'file_name') String name,@JsonKey(name: 'file_size') int size,@JsonKey(name: 'content_type') String contentType, FileStatus status,@JsonKey(name: 'upload_url') String? uploadUrl,@JsonKey(name: 'download_url') String? downloadUrl
});




}
/// @nodoc
class _$FileItemModelCopyWithImpl<$Res>
    implements $FileItemModelCopyWith<$Res> {
  _$FileItemModelCopyWithImpl(this._self, this._then);

  final FileItemModel _self;
  final $Res Function(FileItemModel) _then;

/// Create a copy of FileItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? size = null,Object? contentType = null,Object? status = null,Object? uploadUrl = freezed,Object? downloadUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FileStatus,uploadUrl: freezed == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String?,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FileItemModel].
extension FileItemModelPatterns on FileItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileItemModel value)  $default,){
final _that = this;
switch (_that) {
case _FileItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _FileItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'file_id')  String id, @JsonKey(name: 'file_name')  String name, @JsonKey(name: 'file_size')  int size, @JsonKey(name: 'content_type')  String contentType,  FileStatus status, @JsonKey(name: 'upload_url')  String? uploadUrl, @JsonKey(name: 'download_url')  String? downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileItemModel() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.contentType,_that.status,_that.uploadUrl,_that.downloadUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'file_id')  String id, @JsonKey(name: 'file_name')  String name, @JsonKey(name: 'file_size')  int size, @JsonKey(name: 'content_type')  String contentType,  FileStatus status, @JsonKey(name: 'upload_url')  String? uploadUrl, @JsonKey(name: 'download_url')  String? downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _FileItemModel():
return $default(_that.id,_that.name,_that.size,_that.contentType,_that.status,_that.uploadUrl,_that.downloadUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'file_id')  String id, @JsonKey(name: 'file_name')  String name, @JsonKey(name: 'file_size')  int size, @JsonKey(name: 'content_type')  String contentType,  FileStatus status, @JsonKey(name: 'upload_url')  String? uploadUrl, @JsonKey(name: 'download_url')  String? downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _FileItemModel() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.contentType,_that.status,_that.uploadUrl,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileItemModel implements FileItemModel {
  const _FileItemModel({@JsonKey(name: 'file_id') required this.id, @JsonKey(name: 'file_name') required this.name, @JsonKey(name: 'file_size') required this.size, @JsonKey(name: 'content_type') required this.contentType, required this.status, @JsonKey(name: 'upload_url') this.uploadUrl, @JsonKey(name: 'download_url') this.downloadUrl});
  factory _FileItemModel.fromJson(Map<String, dynamic> json) => _$FileItemModelFromJson(json);

@override@JsonKey(name: 'file_id') final  String id;
@override@JsonKey(name: 'file_name') final  String name;
@override@JsonKey(name: 'file_size') final  int size;
@override@JsonKey(name: 'content_type') final  String contentType;
@override final  FileStatus status;
@override@JsonKey(name: 'upload_url') final  String? uploadUrl;
@override@JsonKey(name: 'download_url') final  String? downloadUrl;

/// Create a copy of FileItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileItemModelCopyWith<_FileItemModel> get copyWith => __$FileItemModelCopyWithImpl<_FileItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,size,contentType,status,uploadUrl,downloadUrl);

@override
String toString() {
  return 'FileItemModel(id: $id, name: $name, size: $size, contentType: $contentType, status: $status, uploadUrl: $uploadUrl, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$FileItemModelCopyWith<$Res> implements $FileItemModelCopyWith<$Res> {
  factory _$FileItemModelCopyWith(_FileItemModel value, $Res Function(_FileItemModel) _then) = __$FileItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'file_id') String id,@JsonKey(name: 'file_name') String name,@JsonKey(name: 'file_size') int size,@JsonKey(name: 'content_type') String contentType, FileStatus status,@JsonKey(name: 'upload_url') String? uploadUrl,@JsonKey(name: 'download_url') String? downloadUrl
});




}
/// @nodoc
class __$FileItemModelCopyWithImpl<$Res>
    implements _$FileItemModelCopyWith<$Res> {
  __$FileItemModelCopyWithImpl(this._self, this._then);

  final _FileItemModel _self;
  final $Res Function(_FileItemModel) _then;

/// Create a copy of FileItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? size = null,Object? contentType = null,Object? status = null,Object? uploadUrl = freezed,Object? downloadUrl = freezed,}) {
  return _then(_FileItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FileStatus,uploadUrl: freezed == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String?,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
