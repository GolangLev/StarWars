/// ## [IRepoNews] abstract class(interface) набор методов для работы с базой данных
abstract class IRepoNews{
  Future getAllNews();
  Future getNewsById(int id);
  ///Future createNews(News news);
  ///Future updateNews(int id, News news);
  ///Future deleteNews(int id);
}