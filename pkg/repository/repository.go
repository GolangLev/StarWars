package repository

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type Authorization interface {
	CreateUser(user entities.Users) (int, error)
	GetUser(login, password string) (entities.Users, error)
	GetUserByLoginAndPassword(login, password string) (int, error)
}

type Games interface {
	CreateGames(games entities.Game) (int, error)
	GetAllGames() ([]entities.Game, error)
	GetGamesById(gameId int) (entities.Game, error)
	DeleteGames(gameId int) error
	UpdateGames(gameId int, game entities.UpdateGames) error
}

type Films interface {
	CreateFilm(film entities.Film) (int, error)
	GetAllFilms() ([]entities.Film, error)
	GetFilmById(filmId int) (entities.Film, error)
	DeleteFilm(filmId int) error
	UpdateFilm(filmId int, film entities.UpdateFilm) error
}

type Heroes interface {
	CreateHero(hero entities.Hero) (int, error)
	GetAllHeroes() ([]entities.HeroJoin, error)
	GetHeroById(heroId int) (entities.HeroJoin, error)
	DeleteHero(heroId int) error
	UpdateHero(heroId int, hero entities.UpdateHero) error
}

type Fractions interface {
	CreateFraction(fraction entities.Fraction) (int, error)
	GetAllFraction() ([]entities.Fraction, error)
	GetFractionById(fractionId int) (entities.Fraction, error)
	DeleteFraction(fractionId int) error
	UpdateFraction(fractionId int, fraction entities.UpdateFraction) error
}

type News interface {
	CreateNews(news entities.News) (int, error)
	GetAllNews() ([]entities.News, error)
	GetNewsById(newsId int) (entities.News, error)
	DeleteNews(newsId int) error
	UpdateNews(newsId int, news entities.UpdateNews) error
}

type Repository struct {
	Games
	Films
	Heroes
	Fractions
	News
	Authorization
}

func NewRepository(db *sqlx.DB) *Repository {
	return &Repository{
		News:          NewNewsRepository(db),
		Games:         NewGameRepository(db),
		Heroes:        NewHeroRepository(db),
		Films:         NewFilmsRepository(db),
		Fractions:     NewFractionRepository(db),
		Authorization: NewAuthRepository(db),
	}
}
