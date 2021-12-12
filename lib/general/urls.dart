/// ## [Urls] класс содержащий адреса для отправки REST запросов
class Urls{
  Urls._();

static const signUp = 'http://127.0.0.1:8000/auth/auth-user/sign-up';
static const signIn = 'http://127.0.0.1:8000/auth/auth-user/sign-in';
static const userId = 'http://127.0.0.1:8000/auth/auth-user/user/';

static const news = 'http://127.0.0.1:8000/';
static const newsId = 'http://127.0.0.1:8000/news/';
static const createNews = 'http://127.0.0.1:8000/api/CreateNews';
static const updateNews = 'http://127.0.0.1:8000/api/UpdateNews/';
static const deleteNews = 'http://127.0.0.1:8000/api/DeleteNews/';

static const game = 'http://127.0.0.1:8000/game/';
static const gameId = 'http://127.0.0.1:8000/game/';
static const createGame = 'http://127.0.0.1:8000/game/api/CreateGame';
static const updateGame = 'http://127.0.0.1:8000/game/api/UpdateGame/';
static const deleteGame = 'http://127.0.0.1:8000/game/api/DeleteGame/';

static const hero = 'http://127.0.0.1:8000/hero/';
static const heroId = 'http://127.0.0.1:8000/hero/';
static const createHero = 'http://127.0.0.1:8000/hero/api/CreateHero';
static const updateHero = 'http://127.0.0.1:8000/hero/api/UpdateHero/';
static const deleteHero = 'http://127.0.0.1:8000/hero/api/Deletehero/';

static const film = 'http://127.0.0.1:8000/film/';
static const filmId = 'http://127.0.0.1:8000/film/';
static const createFilm = 'http://127.0.0.1:8000/film/api/CreateFilm';
static const updateFilm = 'http://127.0.0.1:8000/film/api/UpdateFilm/';
static const deleteFilm = 'http://127.0.0.1:8000/film/api/DeleteFilm/';

static const fraction = 'http://127.0.0.1:8000/fraction/';
static const fractionId = 'http://127.0.0.1:8000/fraction/';
static const createFraction = 'http://127.0.0.1:8000/fraction/api/CreateFraction';
static const updateFraction = 'http://127.0.0.1:8000/fraction/api/UpdateFraction/';
static const deleteFraction = 'http://127.0.0.1:8000/fraction/api/DeleteFraction/';
}