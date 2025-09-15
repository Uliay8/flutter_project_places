/// Базовый класс для конвертера
abstract base class Converter<TResult, TFrom> {
  const Converter();

  /// Конвертирует TFrom в TResult.
  TResult convert(TFrom input);

  /// Конвертирует TFrom list в TResult list.
  Iterable<TResult> convertMultiple(Iterable<TFrom> inputList) => inputList.map(convert);

  /// Конвертирует nullable TFrom в nullable TResult.
  TResult? convertNullable(TFrom? input) => input == null ? null : convert(input);
}

/// Базовый класс для конвертера, который имеет обратную конвертацию
abstract base class ConverterToAndFrom<TResult, TFrom> {
  const ConverterToAndFrom();

  /// TResult from TFrom converter.
  Converter<TResult, TFrom> get converter;

  /// TFrom from TResult converter.
  Converter<TFrom, TResult> get reverseConverter;

  /// Convert TFrom to TResult.
  TResult convert(TFrom input) => converter.convert(input);

  /// Convert TResult to TFrom.
  TFrom convertReverse(TResult input) => reverseConverter.convert(input);
}
