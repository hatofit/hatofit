abstract class ParamUseCase<T, P> {
  Future<T> execute(P param);
}
