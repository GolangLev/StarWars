/// ## [IRepoHero] abstract class(interface) набор методов для работы с базой данных
abstract class IRepoHero{
  Future getAllHeroes();
  Future getHeroById(int id);
///Future createHero(Hero hero);
///Future updateHero(int id, Hero hero);
///Future deleteHero(int id);
}