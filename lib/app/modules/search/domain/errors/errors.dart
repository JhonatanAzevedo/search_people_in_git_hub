abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  final String mensagem;

  DatasourceError({required this.mensagem});
}

class InvalidSearchText extends FailureSearch {}

class EmptyList extends FailureSearch {}
