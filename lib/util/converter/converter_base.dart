abstract class ConverterBase<A, B> {

  /// Converts from A to B
  B toB(A a);

  /// Converts from B to A
  A toA(B b);
}
