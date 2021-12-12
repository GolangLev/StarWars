///[IRepoFilm] abstract class(interface) набор методов для работы с базой данных
abstract class IRepoFilm{
  Future getAllFilms();
  Future getFilmById(int id);
///Future createFilm(Film film);
///Future updateFilm(int id, Film film);
///Future deleteFilm(int id);
}