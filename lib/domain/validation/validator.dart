/// Abstract validator of something ([T])
abstract class Validator<T> {
  /// Validates [object] of type [T].
  ///
  /// Returns null, if [object] is valid, otherwise
  /// returns message of validation error.
  String? validate(T object);
}