/// Abstract validator of something ([T])
abstract class Validator<T> {
  /// Validates [object] of type [T].
  ///
  /// Returns set of error messages (empty if valid).
  Set<String> validate(T object);

  /// Validates [object] of type [T].
  ///
  /// Returns null, if [object] is valid, otherwise
  /// returns message of validation error.
  String? validateOnce(T object) {
    var errors = validate(object);
    return errors.isNotEmpty ? errors.first : null;
  }
}
