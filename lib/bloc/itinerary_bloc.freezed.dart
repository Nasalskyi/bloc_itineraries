// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'itinerary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItineraryEventTearOff {
  const _$ItineraryEventTearOff();

  ItineraryEventFetch fetch() {
    return const ItineraryEventFetch();
  }
}

/// @nodoc
const $ItineraryEvent = _$ItineraryEventTearOff();

/// @nodoc
mixin _$ItineraryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItineraryEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItineraryEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItineraryEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryEventCopyWith<$Res> {
  factory $ItineraryEventCopyWith(
          ItineraryEvent value, $Res Function(ItineraryEvent) then) =
      _$ItineraryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItineraryEventCopyWithImpl<$Res>
    implements $ItineraryEventCopyWith<$Res> {
  _$ItineraryEventCopyWithImpl(this._value, this._then);

  final ItineraryEvent _value;
  // ignore: unused_field
  final $Res Function(ItineraryEvent) _then;
}

/// @nodoc
abstract class $ItineraryEventFetchCopyWith<$Res> {
  factory $ItineraryEventFetchCopyWith(
          ItineraryEventFetch value, $Res Function(ItineraryEventFetch) then) =
      _$ItineraryEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItineraryEventFetchCopyWithImpl<$Res>
    extends _$ItineraryEventCopyWithImpl<$Res>
    implements $ItineraryEventFetchCopyWith<$Res> {
  _$ItineraryEventFetchCopyWithImpl(
      ItineraryEventFetch _value, $Res Function(ItineraryEventFetch) _then)
      : super(_value, (v) => _then(v as ItineraryEventFetch));

  @override
  ItineraryEventFetch get _value => super._value as ItineraryEventFetch;
}

/// @nodoc

class _$ItineraryEventFetch implements ItineraryEventFetch {
  const _$ItineraryEventFetch();

  @override
  String toString() {
    return 'ItineraryEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ItineraryEventFetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItineraryEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItineraryEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItineraryEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class ItineraryEventFetch implements ItineraryEvent {
  const factory ItineraryEventFetch() = _$ItineraryEventFetch;
}

ItineraryState _$ItineraryStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return ItineraryStateLoading.fromJson(json);
    case 'loaded':
      return ItineraryStateLoaded.fromJson(json);
    case 'error':
      return ItineraryStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ItineraryState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$ItineraryStateTearOff {
  const _$ItineraryStateTearOff();

  ItineraryStateLoading loading() {
    return const ItineraryStateLoading();
  }

  ItineraryStateLoaded loaded({required List<Itinerary> itineraryLoaded}) {
    return ItineraryStateLoaded(
      itineraryLoaded: itineraryLoaded,
    );
  }

  ItineraryStateError error() {
    return const ItineraryStateError();
  }

  ItineraryState fromJson(Map<String, Object?> json) {
    return ItineraryState.fromJson(json);
  }
}

/// @nodoc
const $ItineraryState = _$ItineraryStateTearOff();

/// @nodoc
mixin _$ItineraryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Itinerary> itineraryLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItineraryStateLoading value) loading,
    required TResult Function(ItineraryStateLoaded value) loaded,
    required TResult Function(ItineraryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryStateCopyWith<$Res> {
  factory $ItineraryStateCopyWith(
          ItineraryState value, $Res Function(ItineraryState) then) =
      _$ItineraryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItineraryStateCopyWithImpl<$Res>
    implements $ItineraryStateCopyWith<$Res> {
  _$ItineraryStateCopyWithImpl(this._value, this._then);

  final ItineraryState _value;
  // ignore: unused_field
  final $Res Function(ItineraryState) _then;
}

/// @nodoc
abstract class $ItineraryStateLoadingCopyWith<$Res> {
  factory $ItineraryStateLoadingCopyWith(ItineraryStateLoading value,
          $Res Function(ItineraryStateLoading) then) =
      _$ItineraryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItineraryStateLoadingCopyWithImpl<$Res>
    extends _$ItineraryStateCopyWithImpl<$Res>
    implements $ItineraryStateLoadingCopyWith<$Res> {
  _$ItineraryStateLoadingCopyWithImpl(
      ItineraryStateLoading _value, $Res Function(ItineraryStateLoading) _then)
      : super(_value, (v) => _then(v as ItineraryStateLoading));

  @override
  ItineraryStateLoading get _value => super._value as ItineraryStateLoading;
}

/// @nodoc
@JsonSerializable()
class _$ItineraryStateLoading implements ItineraryStateLoading {
  const _$ItineraryStateLoading({String? $type}) : $type = $type ?? 'loading';

  factory _$ItineraryStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ItineraryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ItineraryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Itinerary> itineraryLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItineraryStateLoading value) loading,
    required TResult Function(ItineraryStateLoaded value) loaded,
    required TResult Function(ItineraryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryStateLoadingToJson(this);
  }
}

abstract class ItineraryStateLoading implements ItineraryState {
  const factory ItineraryStateLoading() = _$ItineraryStateLoading;

  factory ItineraryStateLoading.fromJson(Map<String, dynamic> json) =
      _$ItineraryStateLoading.fromJson;
}

/// @nodoc
abstract class $ItineraryStateLoadedCopyWith<$Res> {
  factory $ItineraryStateLoadedCopyWith(ItineraryStateLoaded value,
          $Res Function(ItineraryStateLoaded) then) =
      _$ItineraryStateLoadedCopyWithImpl<$Res>;
  $Res call({List<Itinerary> itineraryLoaded});
}

/// @nodoc
class _$ItineraryStateLoadedCopyWithImpl<$Res>
    extends _$ItineraryStateCopyWithImpl<$Res>
    implements $ItineraryStateLoadedCopyWith<$Res> {
  _$ItineraryStateLoadedCopyWithImpl(
      ItineraryStateLoaded _value, $Res Function(ItineraryStateLoaded) _then)
      : super(_value, (v) => _then(v as ItineraryStateLoaded));

  @override
  ItineraryStateLoaded get _value => super._value as ItineraryStateLoaded;

  @override
  $Res call({
    Object? itineraryLoaded = freezed,
  }) {
    return _then(ItineraryStateLoaded(
      itineraryLoaded: itineraryLoaded == freezed
          ? _value.itineraryLoaded
          : itineraryLoaded // ignore: cast_nullable_to_non_nullable
              as List<Itinerary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryStateLoaded implements ItineraryStateLoaded {
  const _$ItineraryStateLoaded({required this.itineraryLoaded, String? $type})
      : $type = $type ?? 'loaded';

  factory _$ItineraryStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryStateLoadedFromJson(json);

  @override
  final List<Itinerary> itineraryLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ItineraryState.loaded(itineraryLoaded: $itineraryLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItineraryStateLoaded &&
            const DeepCollectionEquality()
                .equals(other.itineraryLoaded, itineraryLoaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(itineraryLoaded));

  @JsonKey(ignore: true)
  @override
  $ItineraryStateLoadedCopyWith<ItineraryStateLoaded> get copyWith =>
      _$ItineraryStateLoadedCopyWithImpl<ItineraryStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Itinerary> itineraryLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(itineraryLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call(itineraryLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(itineraryLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItineraryStateLoading value) loading,
    required TResult Function(ItineraryStateLoaded value) loaded,
    required TResult Function(ItineraryStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryStateLoadedToJson(this);
  }
}

abstract class ItineraryStateLoaded implements ItineraryState {
  const factory ItineraryStateLoaded(
      {required List<Itinerary> itineraryLoaded}) = _$ItineraryStateLoaded;

  factory ItineraryStateLoaded.fromJson(Map<String, dynamic> json) =
      _$ItineraryStateLoaded.fromJson;

  List<Itinerary> get itineraryLoaded;
  @JsonKey(ignore: true)
  $ItineraryStateLoadedCopyWith<ItineraryStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryStateErrorCopyWith<$Res> {
  factory $ItineraryStateErrorCopyWith(
          ItineraryStateError value, $Res Function(ItineraryStateError) then) =
      _$ItineraryStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItineraryStateErrorCopyWithImpl<$Res>
    extends _$ItineraryStateCopyWithImpl<$Res>
    implements $ItineraryStateErrorCopyWith<$Res> {
  _$ItineraryStateErrorCopyWithImpl(
      ItineraryStateError _value, $Res Function(ItineraryStateError) _then)
      : super(_value, (v) => _then(v as ItineraryStateError));

  @override
  ItineraryStateError get _value => super._value as ItineraryStateError;
}

/// @nodoc
@JsonSerializable()
class _$ItineraryStateError implements ItineraryStateError {
  const _$ItineraryStateError({String? $type}) : $type = $type ?? 'error';

  factory _$ItineraryStateError.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ItineraryState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ItineraryStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Itinerary> itineraryLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Itinerary> itineraryLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItineraryStateLoading value) loading,
    required TResult Function(ItineraryStateLoaded value) loaded,
    required TResult Function(ItineraryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItineraryStateLoading value)? loading,
    TResult Function(ItineraryStateLoaded value)? loaded,
    TResult Function(ItineraryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryStateErrorToJson(this);
  }
}

abstract class ItineraryStateError implements ItineraryState {
  const factory ItineraryStateError() = _$ItineraryStateError;

  factory ItineraryStateError.fromJson(Map<String, dynamic> json) =
      _$ItineraryStateError.fromJson;
}
