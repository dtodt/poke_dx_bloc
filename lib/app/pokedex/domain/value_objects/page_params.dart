/// Page params
class PageParams {
  const PageParams({
    required this.limit,
    required this.offset,
  });

  final int limit;
  final int offset;

  factory PageParams.initial() => const PageParams(limit: 20, offset: 0);
}
