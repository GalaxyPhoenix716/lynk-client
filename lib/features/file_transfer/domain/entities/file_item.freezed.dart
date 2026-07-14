// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileItem {

 String get id; String get name; int get size; String get contentType; FileStatus get status; String? get uploadUrl; String? get downloadUrl;
/// Create a copy of FileItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileItemCopyWith<FileItem> get copyWith => _$FileItemCopyWithImpl<FileItem>(this as FileItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,size,contentType,status,uploadUrl,downloadUrl);

@override
String toString() {
  return 'FileItem(id: $id, name: $name, size: $size, contentType: $contentType, status: $status, uploadUrl: $uploadUrl, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $FileItemCopyWith<$Res>  {
  factory $FileItemCopyWith(FileItem value, $Res Function(FileItem) _then) = _$FileItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, int size, String contentType, FileStatus status, String? uploadUrl, String? downloadUrl
});




}
/// @nodoc
class _$FileItemCopyWithImpl<$Res>
    implements $FileItemCopyWith<$Res> {
  _$FileItemCopyWithImpl(this._self, this._then);

  final FileItem _self;
  final $Res Function(FileItem) _then;

/// Create a copy of FileItem
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


/// Adds pattern-matching-related methods to [FileItem].
extension FileItemPatterns on FileItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileItem value)  $default,){
final _that = this;
switch (_that) {
case _FileItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileItem value)?  $default,){
final _that = this;
switch (_that) {
case _FileItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int size,  String contentType,  FileStatus status,  String? uploadUrl,  String? downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int size,  String contentType,  FileStatus status,  String? uploadUrl,  String? downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _FileItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int size,  String contentType,  FileStatus status,  String? uploadUrl,  String? downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _FileItem() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.contentType,_that.status,_that.uploadUrl,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc


class _FileItem implements FileItem {
  const _FileItem({required this.id, required this.name, required this.size, required this.contentType, required this.status, this.uploadUrl, this.downloadUrl});
  

@override final  String id;
@override final  String name;
@override final  int size;
@override final  String contentType;
@override final  FileStatus status;
@override final  String? uploadUrl;
@override final  String? downloadUrl;

/// Create a copy of FileItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileItemCopyWith<_FileItem> get copyWith => __$FileItemCopyWithImpl<_FileItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,size,contentType,status,uploadUrl,downloadUrl);

@override
String toString() {
  return 'FileItem(id: $id, name: $name, size: $size, contentType: $contentType, status: $status, uploadUrl: $uploadUrl, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$FileItemCopyWith<$Res> implements $FileItemCopyWith<$Res> {
  factory _$FileItemCopyWith(_FileItem value, $Res Function(_FileItem) _then) = __$FileItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int size, String contentType, FileStatus status, String? uploadUrl, String? downloadUrl
});




}
/// @nodoc
class __$FileItemCopyWithImpl<$Res>
    implements _$FileItemCopyWith<$Res> {
  __$FileItemCopyWithImpl(this._self, this._then);

  final _FileItem _self;
  final $Res Function(_FileItem) _then;

/// Create a copy of FileItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? size = null,Object? contentType = null,Object? status = null,Object? uploadUrl = freezed,Object? downloadUrl = freezed,}) {
  return _then(_FileItem(
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
