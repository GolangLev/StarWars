/// ## [IRepoGame] abstract class(interface) набор методов для работы с базой данных
abstract class IRepoGame{
  Future getAllGames();
  Future getGameById(int id);
///Future createGame(Game game);
///Future updateGame(int id, Game game);
///Future deleteGame(int id);
}